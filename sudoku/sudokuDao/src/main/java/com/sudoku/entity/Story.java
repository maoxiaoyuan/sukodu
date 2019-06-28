package com.sudoku.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Setter
@Getter
@ToString
//实体类：故事
public class Story {

    private Integer sid;            //故事ID编码

    private Date createTime;        //故事创建时间

    private String storyTitle;      //故事标题

    private String storyContent;    //故事内容

    private String tourCity;        //相关城市

    private User user;              //发表故事的用户

    private HouseBasicInfo house;   //故事关联的房源

    private String img01;           //图片1

    private String img02;           //图片2

    private String img03;           //图片3

    private String img04;           //图片4

    private String img05;           //图片5

    private String img06;           //图片6

}
