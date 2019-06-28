package com.sudoku.controller;

import com.alibaba.fastjson.JSON;
import com.sudoku.biz.UserBiz;
import com.sudoku.biz.util.Code;
import com.sudoku.biz.util.CodeBiz;
import com.sudoku.entity.User;
import com.sudoku.global.House;
import com.sudoku.util.FileUploadUtil;
import com.sudoku.util.SavePathUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;

@Controller
public class DefaultController {

    @Autowired
    private UserBiz userBiz;
    //进入登录界面
    @RequestMapping("/toLogin")
    public String toLogin(){
        return "login";
    }

    //登录操作
    @RequestMapping(value = "login",method = RequestMethod.POST)
    public String login(String name, String password, HttpServletRequest request){

        if(!userBiz.getByName(name).isEmpty()){
            User user=userBiz.login(name,password);
            if(user == null){
                request.getSession().setAttribute("USERNAME",name);
                request.getSession().setAttribute("result","密码错误，请重新输入");
                return "redirect:/toLogin";
            }else {
                if(user.getName().equals("admin")){
                    request.getSession().setAttribute("ADMIN", user);
                    request.getSession().setAttribute("result",null);
                    System.out.println("进入后台管理");
                    return "redirect:admin";
                }else{
                    request.getSession().setAttribute("USER", user);
                    request.getSession().setAttribute("result",null);
                    return "redirect:/house/houseList";
                }
            }
        }else{
            request.getSession().setAttribute("result","用户不存在，请先去注册");
            return "redirect:/toLogin";
        }
    }

    //邮箱验证码
    @RequestMapping(value = "/sendEmail",params = "email",method = RequestMethod.GET)
    @ResponseBody
    public void sendEmailTo(String email, HttpServletRequest req, HttpServletResponse resp) throws Exception{
        String validateCode=Code.getRes();
        System.out.println(validateCode);
        HttpSession session=req.getSession();
        session.setAttribute("validateCode",validateCode);//将验证码存储到Session传到前端
        CodeBiz.sendEmail(email,validateCode);
        String json= JSON.toJSONString(validateCode);
        resp.getWriter().write(json);
    }
    //进入注册界面
    @RequestMapping("/toRegister")
    public String toRegister(Map<String,Object> map, HttpServletRequest request){
        map.put("user",new User());
        request.getSession().setAttribute("result",null);
        return "register";
    }

    //进行注册操作
    @RequestMapping("/register")
    public String register(User user, MultipartFile file ,HttpServletRequest request) throws IOException {
        user.setHeadPhoto(FileUploadUtil.upload(file, SavePathUtil.HEADPORTRAIT_PATH,request));
        userBiz.add(user);
        return "redirect:toLogin";
    }



    //退出
    @RequestMapping("/quit")
    public String quit(Map<String,Object> map,HttpServletRequest request){
        User user=(User)request.getSession().getAttribute("USER");
        request.getSession().setAttribute("USERNAME",user.getName());
        request.getSession().setAttribute("USER", null);
        return "redirect:toLogin";
    }

    @RequestMapping("/adminQuit")
    public String adminQuit(Map<String,Object> map,HttpServletRequest request){
        User user=(User)request.getSession().getAttribute("ADMIN");
        request.getSession().setAttribute("USERNAME",user.getName());
        request.getSession().setAttribute("ADMIN", null);
        return "redirect:toLogin";
    }
}
