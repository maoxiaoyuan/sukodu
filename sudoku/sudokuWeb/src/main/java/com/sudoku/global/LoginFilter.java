package com.sudoku.global;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

//登录过滤器
public class LoginFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("进入登录过滤器。。。。。。");
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        System.out.println("过滤操作。。。。。。");
        HttpServletRequest request=(HttpServletRequest) servletRequest;
        HttpServletResponse response=(HttpServletResponse) servletResponse;
        Object object=request.getSession().getAttribute("USER");
        if(object == null){
            System.out.println("USER为空。");
            response.sendRedirect(request.getContextPath()+"/toLogin");
        }else{
            filterChain.doFilter(request,response);
        }
    }

    @Override
    public void destroy() {
        System.out.println("过滤销毁。。。。。。");
    }
}
