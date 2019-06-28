package com.sudoku.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

/**
 * 保存信息（15天之内）
 */
@Getter
@Setter
@ToString
public class Info {

    private Integer id;         //消息的编码

    private Integer infoSend;   //消息的发送者

    private String infoContent; //消息的内容

    private Date infoDate;      //发送消息的日期

    private User user;

}
