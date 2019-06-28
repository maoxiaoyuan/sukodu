package com.sudoku.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

//订单表
@Setter
@Getter
@ToString
public class HouseOrder {

    private String orderId;         //订单编号

    private String orderUserId;     //下单用户的ID

    private String orderHouseId;    //租住房源的ID

    private Integer rentNum;        //租住人数

    private Date orderTime;         //下单时间

    private Date bookStartTime;     //预定日期

    private Date bookEndTime;       //退房日期

    private Double totalPrice;      //总价

    private String status;          //付款状态（已付款，未付款）





}
