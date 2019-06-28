package com.sudoku.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

@Controller
public class AdminController {

    @RequestMapping("/admin")
    public String list(Map<String,Object> map){
        return "/adminPages/index";
    }

    @RequestMapping("/main")
    public String mainPages(){
        return "/adminPages/welcome";
    }



}
