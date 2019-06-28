package com.sudoku.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.sudoku.biz.CityBiz;
import com.sudoku.biz.impl.CityBizImpl;
import com.sudoku.entity.City;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("city")
public class CityController {

    @Autowired
    private CityBiz cityBiz=new CityBizImpl();


    //城市三级联动（省、市、县）
    @RequestMapping(value = "/getCitys",params = "pid",method = RequestMethod.GET)
    @ResponseBody
    public void getCitys(Integer pid,HttpServletResponse response) throws IOException {
        List<City> citys=new ArrayList<City>();
        citys=cityBiz.getCitys(pid);
        String json= JSON.toJSONString(citys);
        response.getWriter().write(json);
    }



}
