package com.sudoku.biz.util;

//生成随机的六位验证码
public class Code {

    public static String getRes() {
        String s="";
        for(int i=0;i<6;i++) {
            int res=(int)(Math.random()*3);
            if(res==0) {
                s=s+(char)getUpper();
            } else if(res==1) {
                s=s+(char)getLower();
            } else {
                s=s+getNumber();
            }
        }
        return s;
    }
    public static int getUpper() {//大写字母
        return (int)(Math.random()*26+65);
    }
    public static int getLower() {//小写字母
        return (int)(Math.random()*26+97);
    }
    public static int getNumber() {//得到数字
        return (int)(Math.random()*10);
    }
}
