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
@RequestMapping("/login")
public class LoginController {

    /**
     * 显示登陆页
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/")
    public String showlogin(HttpServletRequest request,
                                HttpServletResponse response) {
        return "/login";
    }
}
