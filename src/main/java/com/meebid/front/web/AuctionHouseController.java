package com.meebid.front.web;

import com.meebid.front.bean.*;
import com.meebid.front.exception.ErrorException;
import com.meebid.front.service.UploadService;
import com.meebid.front.utils.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestOperations;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by gaoyang on 16/2/28.
 */
@Controller
@RequestMapping("/auctionhouse")
public class AuctionHouseController {


    private  String RESTURL= SettingUtil.getSetting("RESTURL");

    private String uid="15800531996";

    @Autowired
    private RestOperations restOps;

    @Autowired
    private UploadService uploadService;


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
     * 创建拍卖页面
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/createauctionitem")
    public String createauctionitem(HttpServletRequest request,
                                HttpServletResponse response,@RequestParam("uploadfile") MultipartFile[] files) {

        String name=ConvertUtil.safeToString(request.getParameter("name"),"");
        String description=ConvertUtil.safeToString(request.getParameter("description"),"");
        String auctionId=ConvertUtil.safeToString(request.getParameter("auctionId"),"");
        String category=ConvertUtil.safeToString(request.getParameter("category"),"");

        Integer lotnumber=ConvertUtil.safeToInteger(request.getParameter("lotnumber"),0);
        Integer reservePrice=ConvertUtil.safeToInteger(request.getParameter("reservePrice"),0);
        Integer startingPrice=ConvertUtil.safeToInteger(request.getParameter("startingPrice"),0);
        Integer estimateMax=ConvertUtil.safeToInteger(request.getParameter("estimateMax"),0);
        Integer estimateMin=ConvertUtil.safeToInteger(request.getParameter("estimateMin"),0);

        List<String> imgPaths=new ArrayList<>();

        RequestAuctionItem requestAuctionItem=new RequestAuctionItem();
        requestAuctionItem.setAuctionId(auctionId);
        requestAuctionItem.setCategory(category);
        requestAuctionItem.setLotNumber(lotnumber);
        requestAuctionItem.setName(name);
        requestAuctionItem.setEstimateMax(estimateMax);
        requestAuctionItem.setEstimateMin(estimateMin);
        requestAuctionItem.setReservePrice(reservePrice);
        requestAuctionItem.setStartingPrice(startingPrice);
        requestAuctionItem.setDescription(description);


        for (MultipartFile file :files) {
            try {
                    String imgurl= uploadService.qiniuyunupload(file.getBytes());
                imgPaths.add(imgurl);
                } catch (Exception e) {
                    e.printStackTrace();
                }
        }
        requestAuctionItem.setImgPaths(imgPaths);

        MultiValueMap<String, String> form = new LinkedMultiValueMap<String, String>();

        ResponseEntity<String> responseEntity = null;
        try {
            responseEntity = restOps.exchange(
                    RESTURL+"auction/create",
                    HttpMethod.POST,
                    new HttpEntity<RequestAuctionItem>(requestAuctionItem, new HttpHeaders()),
                    String.class);
        } catch (ErrorException e){
            request.setAttribute("errorinfo",e.getErrorBean().getMessage());
            return "/auctionhouse/createauctionitem";
        }
        if (responseEntity.getStatusCode() != HttpStatus.OK) {
            return "/auctionhouse/createauctionitem";
        }else{
            return "redirect:/auctionhouse/listauctions";
        }

//        if(files!=null&&files.length>0){
//            //循环获取file数组中得文件
//            for(int i = 0;i<files.length;i++){
//                MultipartFile file = files[i];
//                //保存文件
//                try {
//                    String imgurl= uploadService.qiniuyunupload(file.getBytes());
//                } catch (Exception e) {
//                    e.printStackTrace();
//                }
//            }
//        }
    }

    /**
     * 创建拍卖商品添加
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/showcreateauctionitem")
    public String showcreateauctionitem(HttpServletRequest request,
                                    HttpServletResponse response) {
        return "/auctionhouse/createauctionitem";
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
        int page= ConvertUtil.safeToInteger(request.getParameter("page"),1);
        int pageSize=ConvertUtil.safeToInteger(request.getParameter("pageSize"),10);
        String status=StringUtil.safeToString(request.getParameter("status"),"");


        MultiValueMap<String, Object> form = new LinkedMultiValueMap<String, Object>();
        form.set("sellerId", "3");
        form.set("pageSize", ""+pageSize);
        form.set("page", ""+page);
        form.set("status", status);



        ResponseEntity<SearchTemplate<Auctions>> res = restOps.exchange(
                RESTURL+"auction/seller-auction-list",
                HttpMethod.POST,
                new HttpEntity<MultiValueMap<String, Object>>(form, new HttpHeaders()),
                new ParameterizedTypeReference<SearchTemplate<Auctions>>() {});

        request.setAttribute("auctionses",res.getBody().getDateList());
        request.setAttribute("page", PageUtil.getPage(page,pageSize,res.getBody().getTotalCount()));

        request.setAttribute("a"+status,"active");
        request.setAttribute("status",status);

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
        String page=StringUtil.safeToString(request.getParameter("page"),"1");
        String pageSize=StringUtil.safeToString(request.getParameter("pageSize"),"10");


        MultiValueMap<String, String> form = new LinkedMultiValueMap<String, String>();
        form.set("uid", uid);
        form.set("pageSize", pageSize);
        form.set("page", page);
        ResponseEntity<SearchTemplate<Message>> res = restOps.exchange(
                RESTURL+"message/list",
                HttpMethod.POST,
                new HttpEntity<MultiValueMap<String, String>>(form, new HttpHeaders()),
                new ParameterizedTypeReference<SearchTemplate<Message>>() {});
        request.setAttribute("listmessage",res.getBody().getDateList());
        request.setAttribute("page", PageUtil.getPage(Integer.valueOf(page),Integer.parseInt(pageSize),res.getBody().getTotalCount()));
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

    @RequestMapping(value = "/updateMessageStateAll",method = RequestMethod.POST)
    @ResponseBody
    public Object updateMessageStateAll(HttpServletRequest request, HttpServletResponse response){

        MultiValueMap<String, String> form = new LinkedMultiValueMap<String, String>();
        form.set("uid", uid);

        ResponseEntity<String> responseEntity = null;
        try {
            responseEntity = restOps.exchange(
                    RESTURL+"message/updateAllMessageToRead",
                    HttpMethod.POST,
                    new HttpEntity<MultiValueMap<String, String>>(form, new HttpHeaders()),
                    String.class);
        } catch (ErrorException e){
            return e.getErrorBean().getMessage();
        }
        return "";
    }
}
