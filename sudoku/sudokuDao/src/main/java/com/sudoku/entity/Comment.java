package com.sudoku.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@Setter
@Getter
@ToString
//评论实体类
public class Comment {

    private Integer cid;                //编号ID

    private User user;                  //发表评论的用户

    private Story story;                 //被评论的故事

    private Date createTime;            //评论创建的时间

    private String commentContent;      //评论的内容
}
