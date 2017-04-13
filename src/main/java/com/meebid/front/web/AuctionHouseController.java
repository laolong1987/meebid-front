package com.meebid.front.web;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.meebid.front.bean.Auctions;
import com.meebid.front.bean.Message;
import com.meebid.front.bean.SearchTemplate;
import com.meebid.front.bean.UserInfo;
import com.meebid.front.exception.ErrorException;
import com.meebid.front.utils.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestOperations;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

/**
 * Created by gaoyang on 16/2/28.
 */
@Controller
@RequestMapping("/auctionhouse")
public class AuctionHouseController {


    private  String RESTURL= SettingUtil.getSetting("RESTURL");

    @Autowired
    private RestOperations restOps;

    /**
     *拍卖行首页
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/index")
    public String index(HttpServletRequest request,
                                HttpServletResponse response) {
        return "/auctionhouse/index";
    }

    /**
     * 创建拍卖页面
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/showcreateauction")
    public String showcreateauction(HttpServletRequest request,
                        HttpServletResponse response) {
        return "/auctionhouse/createauction";
    }

    /**
     * 创建拍卖页面
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/createauction")
    public String createauction(HttpServletRequest request,
                                    HttpServletResponse response) {
        String name=request.getParameter("name");
        String exhibition= StringUtil.safeToString(request.getParameter("exhibition"),"0");
        String timezone= StringUtil.safeToString(request.getParameter("timezone"),"");
        String month= StringUtil.safeToString(request.getParameter("month"),"");
        String day= StringUtil.safeToString(request.getParameter("day"),"");
        String year= StringUtil.safeToString(request.getParameter("year"),"");
        String house= StringUtil.safeToString(request.getParameter("house"),"");
        String minute= StringUtil.safeToString(request.getParameter("minute"),"");
        String desc= StringUtil.safeToString(request.getParameter("desc"),"");
        String country= StringUtil.safeToString(request.getParameter("country"),"");
        String state= StringUtil.safeToString(request.getParameter("state"),"");
        String city= StringUtil.safeToString(request.getParameter("city"),"");

        MultiValueMap<String, String> form = new LinkedMultiValueMap<String, String>();
        form.set("name", name);
        form.set("country", country);
        form.set("state", state);
        form.set("city", city);
        form.set("timezone", timezone);
        form.set("desc", desc);
        form.set("start_time",year+"-"+month+"-"+day+" "+house+":"+minute+":00");
        form.set("sellerId","0");

        ResponseEntity<String> responseEntity = null;
        try {
            responseEntity = restOps.exchange(
                    RESTURL+"auction/create",
                    HttpMethod.POST,
                    new HttpEntity<MultiValueMap<String, String>>(form, new HttpHeaders()),
                    String.class);
        } catch (ErrorException e){
            request.setAttribute("errorinfo",e.getErrorBean().getMessage());
            return "/auctionhouse/createauction";
        }
        if (responseEntity.getStatusCode() != HttpStatus.OK) {
            return "/auctionhouse/createauction";
        }else{
            return "redirect:/auctionhouse/listauctions";
        }
    }

    /**
     * 拍卖会列表页面
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/listauctions")
    public String listauction(HttpServletRequest request,
                                    HttpServletResponse response) {
        String page=StringUtil.safeToString(request.getParameter("page"),"1");
        String pageSize=StringUtil.safeToString(request.getParameter("pageSize"),"10");
        String orderby=StringUtil.safeToString(request.getParameter("orderby"),"");

        MultiValueMap<String, String> form = new LinkedMultiValueMap<String, String>();
        form.set("sellerId", StringUtil.safeToString(request.getSession().getAttribute("userid"),"0"));
        form.set("pageSize", pageSize);
        form.set("page", page);
        Auctions[] auctionses= restOps.postForObject(RESTURL+"auction/seller-auction-list",form,Auctions[].class);
        request.setAttribute("auctionses",auctionses);
        return "/auctionhouse/listauctions";
    }
    /**
     * 拍卖会信息显示
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/auctioninfo")
    public String auctioninfo(HttpServletRequest request,
                              HttpServletResponse response) {
        return "/auctionhouse/auctioninfo";
    }

    /**
     * 拍卖会列表页面
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/listmessage")
    public String listmessage(HttpServletRequest request,
                              HttpServletResponse response) {
        int page= ConvertUtil.safeToInteger(request.getParameter("page"),1);
        int pageSize=ConvertUtil.safeToInteger(request.getParameter("pageSize"),10);


        MultiValueMap<String, String> form = new LinkedMultiValueMap<String, String>();
        form.set("uid", "15800531996");
        form.set("pageSize", String.valueOf(pageSize));
        form.set("page", String.valueOf(page));
//        Message[] listmessage= restOps.postForObject(RESTURL+"message/list",form,Message[].class);
        SearchTemplate<Message> searchTemplate= restOps.postForObject(RESTURL+"message/list",form,SearchTemplate.class);
        
        request.setAttribute("listmessage",searchTemplate.getDateList());
        request.setAttribute("page", PageUtil.getPage(page,pageSize,searchTemplate.getTotalCount()));
        return "/auctionhouse/listmessage";
    }

    @RequestMapping(value = "/addmessage", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
    public Object addmessage(HttpServletRequest request, HttpServletResponse response) {
        String subject=StringUtil.safeToString(request.getParameter("subject"),"");
        String content=StringUtil.safeToString(request.getParameter("content"),"");
        String recipients=StringUtil.safeToString(request.getParameter("recipients"),"");

        MultiValueMap<String, String> form = new LinkedMultiValueMap<String, String>();
        form.set("subject", subject);
        form.set("content", content);
        form.set("recipients", recipients);
        form.set("correspondent", "15800531997");
        form.set("attachment", "");

        ResponseEntity<String> responseEntity = null;
        try {
            responseEntity = restOps.exchange(
                    RESTURL+"message/create",
                    HttpMethod.POST,
                    new HttpEntity<MultiValueMap<String, String>>(form, new HttpHeaders()),
                    String.class);
        } catch (ErrorException e){
            request.setAttribute("errorinfo",e.getErrorBean().getMessage());
            return "/auctionhouse/listmessage";
        }
        return "redirect:/auctionhouse/listmessage";
    }


    @RequestMapping(value = "/updateMessageState",method = RequestMethod.POST)
    @ResponseBody
    public Object updateMessageState(HttpServletRequest request, HttpServletResponse response){
        String messageId=StringUtil.safeToString(request.getParameter("messageId"),"");
        String state = StringUtil.safeToString(request.getParameter("state"),"1");


        MultiValueMap<String, String> form = new LinkedMultiValueMap<String, String>();
        form.set("messageId", messageId);
        form.set("state", state);

        ResponseEntity<String> responseEntity = null;
        try {
            responseEntity = restOps.exchange(
                    RESTURL+"message/updateMessageState",
                    HttpMethod.POST,
                    new HttpEntity<MultiValueMap<String, String>>(form, new HttpHeaders()),
                    String.class);
        } catch (ErrorException e){
            return e.getErrorBean().getMessage();
        }
        return "";
    }
}
