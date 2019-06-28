package com.sudoku.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {

    public static Date obtainDate(){


        String format="yyyy-MM-dd";
        //2.当前时间
        String curDate=convertToString(new Date(),format);
        return convertToDate(curDate,format);
    }

    //后端日期格式转换（Date 转换为 String）
    public static String convertToString(Date date,String format){

        return new SimpleDateFormat(format).format(date);

    }

    //后端日期格式转换（String 转换为 Date）
    public static Date convertToDate(String dateString,String format){
        Date date= null;
        try {
            date = new SimpleDateFormat(format).parse(dateString);
        } catch (ParseException e) {
            e.printStackTrace();
        }
       return date;

    }

}
