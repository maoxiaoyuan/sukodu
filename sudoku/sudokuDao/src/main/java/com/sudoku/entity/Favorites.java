package com.sudoku.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@Getter
@Setter
@ToString
//实体类：我的收藏
public class Favorites {

    private Integer fid;        //编号ID

    private User user;          //喜欢该故事的用户

    private Story story;        //喜欢的故事

    private Date createTime;    //收藏时间


}
