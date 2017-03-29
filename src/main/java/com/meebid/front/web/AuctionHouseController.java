package com.meebid.front.web;

import com.meebid.front.bean.Auctions;
import com.meebid.front.bean.UserInfo;
import com.meebid.front.exception.ErrorException;
import com.meebid.front.utils.MD5Util;
import com.meebid.front.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestOperations;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

/**
 * Created by gaoyang on 16/2/28.
 */
@Controller
@RequestMapping("/auctionhouse")
public class AuctionHouseController {

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
                    "http://192.168.0.119:8080/auction/create",
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
        Auctions[] auctionses= restOps.postForObject("http://192.169.202.87:8080/auction/auction/seller-auction-list",form,Auctions[].class);
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
}
