package com.sudoku.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@Setter
@Getter
@ToString
//预定日期实体类
public class BookDate {

    private Integer bookId;     //ID编号

    private Date orderDate;     //预定日期

    private String houseId;    //被预定的房源
}
