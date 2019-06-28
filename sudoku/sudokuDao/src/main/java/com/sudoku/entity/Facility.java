package com.sudoku.entity;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
//房源设备
public class Facility {

    private Integer id;              //设备编号

    private Integer houseId;         //房源编号

    private Integer WLAN;            //无线局域网

    private Integer heating;         //暖气

    private Integer airConditioner;  //空调

    private Integer fireplace;       //壁炉

    private Integer iron;            //熨斗

    private Integer hairDryer;       //吹风机

    private Integer washingMachine;  //洗衣机

    private Integer dryer;           //干洗机

    private Integer kitchen;         //厨房

    private Integer bathroom;        //浴室

    private Integer toilet;          //卫生间

    private Integer livingRoom;      //客厅

    private Integer swimmingPool;    //游泳池

    private Integer fitnessRoom;     //健身房


}
