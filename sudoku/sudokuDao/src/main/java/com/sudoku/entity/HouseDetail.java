package com.sudoku.entity;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
//房源规格
public class HouseDetail {

    private Integer id;             //编号

    private String name;            //某一个房间的名称

    private Double price;           //某一个房间的价格

    private Integer maxTenants;     //该房间最多容纳人数

    private String roomDescribe;    //对该房间的描述

    private Integer houseId;        //房子的ID


}
