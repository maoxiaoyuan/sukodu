package com.sudoku.controller;

import com.alibaba.fastjson.JSON;
import com.sudoku.biz.BookDateBiz;
import com.sudoku.entity.BookDate;
import com.sudoku.entity.City;
import com.sudoku.util.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
public class BookDateController {

    @Autowired
    private BookDateBiz bookDateBiz;

    @RequestMapping( value = "/dateList" ,params = "houseId",method = RequestMethod.GET)
    @ResponseBody
    public void dateList(@RequestParam("houseId") String houseId, HttpServletResponse response) throws IOException{
        List<BookDate> dateList = bookDateBiz.getAllDate(houseId);

        List<String> dates=new ArrayList<>();

        for(BookDate date:dateList){
            String d= DateUtil.convertToString(date.getOrderDate(),"yyyy-MM-dd");
            dates.add(d);
        }

        String json= JSON.toJSONString(dates);
        response.getWriter().write(json);
    }

}
