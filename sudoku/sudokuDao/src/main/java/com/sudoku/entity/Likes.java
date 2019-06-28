package com.sudoku.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@Setter
@Getter
@ToString
// 实体类：点赞
public class Likes {

    private Integer lid;

    private User user;

    private Story story;

    private Date createTime;


}
