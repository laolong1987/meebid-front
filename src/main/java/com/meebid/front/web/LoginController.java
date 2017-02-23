package com.meebid.front.web;

import com.meebid.front.bean.UserInfo;
import com.meebid.front.exception.ErrorException;
import com.meebid.front.service.CommonService;
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

/**
 * Created by gaoyang on 16/2/28.
 */
@Controller
@RequestMapping("/login")
public class LoginController {

    //登录URL
    private static String USERLOGIN = "http://192.169.202.87:8080/auction/user/login";

    @Autowired
    private RestOperations restOps;

    @Autowired
    private CommonService commonService;

    /**
     * 显示登陆页
     *
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/")
    public String showlogin(HttpServletRequest request,
                            HttpServletResponse response) {

        commonService.test();
        return "/login";
    }

    /**
     * 显示登陆页
     *
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/tologin")
    public String tologin(HttpServletRequest request,
                          HttpServletResponse response) throws Exception {
        String username = StringUtil.safeToString(request.getParameter("username"), "");
        String password = StringUtil.safeToString(request.getParameter("password"), "");

        MultiValueMap<String, String> form = new LinkedMultiValueMap<String, String>();
        form.set("username", username);
        form.set("password", MD5Util.string2MD5(password.trim()));

        ResponseEntity<UserInfo> responseEntity = null;
        try {
            responseEntity = restOps.exchange(
                    "http://192.169.202.87:8080/auction/user/login",
                    HttpMethod.POST,
                    new HttpEntity<MultiValueMap<String, String>>(form, new HttpHeaders()),
                    UserInfo.class);
        } catch (ErrorException e){
            request.setAttribute("errorinfo",e.getErrorBean().getMessage());
        }

        if (responseEntity.getStatusCode() != HttpStatus.OK) {
            return "redirect:/login";
        } else {
            return "redirect:/auctionhouse/index";
        }
    }
}
