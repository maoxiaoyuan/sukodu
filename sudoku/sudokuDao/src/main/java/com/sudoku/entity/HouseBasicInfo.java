package com.sudoku.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;
import java.util.List;

//实体类：房屋基本信息
@Setter
@Getter
@ToString
public class HouseBasicInfo {

    private Integer id;                 //房屋编号

    private Integer landlordId;         //房东编号

    private String province;            //省

    private String  city;               //市

    private String  town;               //区/县

    private String detailAddress;       //房屋的详细地址

    private String title;               //房源标题

    private String introduce;           //房源介绍

    private String travelInfo;          //出行信息

    private String certificateNumber;   //房产证编号

    private String certificateImg;      //房产证照片

    private Integer status;              //房源状态（待审核，审核通过，审核未通过）

    private Date registerTime;          //房源注册时间

    private User user;                  //获取该房源的房东信息

    private HouseDetail houseDetail;    //获取该房源的详细信息

    private HouseResource  houseResource;//获取该房源的规格信息

    private Facility facility ;         //获取该房源的设备信息
}
