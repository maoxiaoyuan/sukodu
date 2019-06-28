package com.sudoku.entity;

import lombok.Data;
import lombok.ToString;

import java.util.Date;
import java.util.List;

//实体类：房屋图片
@Data
@ToString
public class Img {
    private Integer id;         //图片的编号

    private Integer houseId;    //房源的编号

    private String title;       //图片标签

    private String smallTitle;  //图片副标签

    private String imgPath;     //图片的路径

    private Date date;          //图片上传日期


}
