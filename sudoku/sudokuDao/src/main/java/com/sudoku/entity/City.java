package com.sudoku.entity;


import lombok.Data;
import lombok.ToString;

import java.util.ArrayList;
import java.util.List;

@Data
@ToString
//城市
public class City {

    private Integer id;         //编号
    private Integer pid;        //父级的id编号
    private String cityName;    //城市名称
    private Integer type;       //级别：1-一级城市；2-二级城市；3-三级城市

    private List<City> children=new ArrayList<City>();  //子类


}
