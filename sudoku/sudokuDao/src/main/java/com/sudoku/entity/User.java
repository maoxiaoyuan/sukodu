package com.sudoku.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//实体类：用户
@Setter
@Getter
@ToString
public class User {

    private Integer id;         //编号

    private String name;        //姓名

    private String password;    //密码

    private Integer age;        //年龄

    private String sex;         //性别

    private String phone;       //手机号码

    private String email;       //邮箱

    private String idNumber;    //身份证号

    private String headPhoto;   //头像

    private String idImg;       //身份证照片


}
