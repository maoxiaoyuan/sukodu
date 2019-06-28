package com.sudoku.controller;

import com.sudoku.biz.UserBiz;
import com.sudoku.biz.impl.UserBizImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

@Controller("userController")
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserBiz userBiz=new UserBizImpl();
    //user列表显示
    @RequestMapping("/list")
    public String list(Map<String,Object> map){
        System.out.println(userBiz);
        map.put("list",userBiz.getAll());
        System.out.println(userBiz.getAll());
        //转发到jsp界面
        return "user_list";
    }


}
