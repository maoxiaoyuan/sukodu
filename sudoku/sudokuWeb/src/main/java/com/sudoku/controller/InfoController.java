package com.sudoku.controller;

import com.sudoku.biz.InfoBiz;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

@Controller("/infoController")
public class InfoController {

    @Autowired
    private InfoBiz infoBiz;

    @RequestMapping("/infoList")
    public String infoList(Map<String,Object> map){
        map.put("infoList",infoBiz.getAll());
        return "adminPages/info";
    }
}
