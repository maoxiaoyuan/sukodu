package com.sudoku.entity;

import lombok.Data;
import lombok.ToString;

//房源详情
@Data
@ToString
public class HouseResource {

    private Integer id;         //详情信息编号

    private Integer houseId;    //房源的ID

    private String houseType;   //房源的类型（公寓、车房、海景房。。。）

    private String rentType;    //出租类型（整套出租、单个出租、合住）

    private Integer maxRoomer;  //最多容纳房客数

    private Integer roomNumber; //房间的数量

    private Integer bedNumber;  //床铺的数量

    private Double price;       //所有房间全部出租的价格

    private Float sevenDiscount; //连续入住超过（含）7天折扣

    private Float monthDiscount; //连续入住超过（含）28天折扣


}
