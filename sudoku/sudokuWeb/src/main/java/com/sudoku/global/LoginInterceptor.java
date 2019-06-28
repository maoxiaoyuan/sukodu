package com.sudoku.global;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//登录拦截器
public class LoginInterceptor implements HandlerInterceptor {

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        // 返回false则不执行拦截
        HttpSession session = request.getSession();
        if(session.getAttribute("USER")==null&&session.getAttribute("ADMIN")==null){
            // 拦截后进入登录页面
            response.sendRedirect(request.getContextPath()+"/toLogin");
            return false;

        }else{
            return true;
        }

    }
}
