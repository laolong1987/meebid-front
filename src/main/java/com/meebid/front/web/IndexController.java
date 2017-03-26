package com.meebid.front.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by gaoyang on 16/2/28.
 */
@Controller
@RequestMapping("/index")
public class IndexController {

    @RequestMapping(value = "")
    public String show(HttpServletRequest request,
                                HttpServletResponse response) {

        return "/index";
    }
}
