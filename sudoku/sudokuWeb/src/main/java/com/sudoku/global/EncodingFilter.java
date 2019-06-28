package com.sudoku.global;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 编码过滤器
 */
public class EncodingFilter implements Filter {

    private String encoding="utf-8";

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        if(filterConfig.getInitParameter("encoding")!=null){
           encoding=filterConfig.getInitParameter("encoding");
        }
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        //强制转换
        HttpServletRequest request=(HttpServletRequest) servletRequest;
        HttpServletResponse response=(HttpServletResponse) servletResponse;
        //设置字符集
        request.setCharacterEncoding(encoding);
        response.setCharacterEncoding(encoding);
        //调用拦截器链，让其继续执行
        filterChain.doFilter(request,response);
    }

    @Override
    public void destroy() {

    }
}
