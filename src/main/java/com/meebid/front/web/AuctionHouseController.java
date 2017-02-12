package com.meebid.front.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;

/**
 * Created by gaoyang on 16/2/28.
 */
@Controller
@RequestMapping("/auctionhouse")
public class AuctionHouseController {

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
     * 拍卖会列表页面
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/listauction")
    public String listauction(HttpServletRequest request,
                                    HttpServletResponse response) {
        return "/auctionhouse/listauction";
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
