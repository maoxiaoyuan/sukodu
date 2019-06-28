package com.sudoku.controller;

import com.sudoku.biz.BookDateBiz;
import com.sudoku.biz.HouseBasicInfoBiz;
import com.sudoku.biz.HouseOrderBiz;
import com.sudoku.biz.ImgBiz;
import com.sudoku.entity.BookDate;
import com.sudoku.entity.HouseOrder;
import com.sudoku.util.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/order")
public class HouseOrderController {

    @Autowired
    private HouseOrderBiz houseOrderBiz;

    @Autowired
    private BookDateBiz bookDateBiz;

    @Autowired
    private HouseBasicInfoBiz houseBasicInfoBiz;

    @Autowired
    private ImgBiz imgBiz;
    //进入下订单界面
    @RequestMapping("/toAdd")
    public String toAdd(HouseOrder houseOrder, Double price, String startTime,String endTime,Map<String,Object> map){

        long days=(DateUtil.convertToDate(endTime,"yyyy-MM-dd").getTime()-DateUtil.convertToDate(startTime,"yyyy-MM-dd").getTime()+1000000)/(60*60*24*1000);
        map.put("house",houseBasicInfoBiz.getHouseById(Integer.parseInt(houseOrder.getOrderHouseId())));
        map.put("img",imgBiz.getDetailPhotos(Integer.parseInt(houseOrder.getOrderHouseId())));
        map.put("days",days);
        map.put("houseOrder",houseOrder);
        map.put("price",price);
        map.put("startTime",startTime);
        map.put("endTime",endTime);
        return "userPages/house_order_detail";
    }

    //添加订单
    @RequestMapping("/add")
    public String add(HouseOrder houseOrder,String startTime,String endTime){
        houseOrder.setOrderTime(DateUtil.obtainDate());
        houseOrder.setBookStartTime(DateUtil.convertToDate(startTime,"yyyy-MM-dd"));
        houseOrder.setBookEndTime(DateUtil.convertToDate(endTime,"yyyy-MM-dd"));

        System.out.println(houseOrder);
       houseOrderBiz.add(houseOrder);

        List<Date> dates=houseOrderBiz.getAllDate(houseOrder.getBookStartTime(),houseOrder.getBookEndTime());

        List<BookDate> bookDates=new ArrayList<>();
        for(Date date:dates){
            BookDate bookDate=new BookDate();
            bookDate.setOrderDate(date);
            bookDate.setHouseId(houseOrder.getOrderHouseId());
            bookDates.add(bookDate);
        }

        bookDateBiz.add(bookDates);
        System.out.println("所有预定时间为："+bookDates);
        return "userPages/house_order_wait";
    }

    //进入修改订单界面
    @RequestMapping(value = "/toEdit",params = "orderId")
    public String toEdit(String orderId,Map<String,Object> map){
        map.put("houseOrder",houseOrderBiz.getById(orderId));
        return null;
    }

    //修改订单
    @RequestMapping("/edit")
    public String edit(HouseOrder houseOrder){
        houseOrderBiz.edit(houseOrder);
        return null;
    }

    //取消订单
    @RequestMapping(value = "/remove",params = "orderId")
    public String remove(String orderId){
        houseOrderBiz.remove(orderId);
        return null;
    }

    //根据订单编号查询订单
    @RequestMapping(value = "/getByOrderId",params = "orderId")
    public String getByOrderId(String orderId,Map<String,Object> map){

        HouseOrder houseOrder=houseOrderBiz.getById(orderId);
        map.put("GetById",houseOrder);

        return null;
    }

    //查询该用户的所有订单
    @RequestMapping(value = "/getByUser",params = "orderUserId")
    public String getByUser(String orderUserId,Map<String,Object> map){
        map.put("GetByUser",houseOrderBiz.getByUserId(orderUserId));
        System.out.println(map.get("GetByUser"));
        return null;
    }

    //查询跟该房源有关的所有订单
    @RequestMapping(value = "/getByHouse",params = "orderHouseId")
    public String getByHouse(String orderHouseId,Map<String,Object> map){
        map.put("GetByHouse",houseOrderBiz.getByHouseId(orderHouseId));
        System.out.println(map.get("GetByHouse"));
        return null;
    }

}
