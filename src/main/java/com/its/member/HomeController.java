package com.its.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping("/")
    public String index(){
        return "index";
    }

    @GetMapping("/login-form")
    public String login_form(){
        return "login";
    }

    @GetMapping("/save-form")
    public String save_form(){
        return "save";
    }




}
