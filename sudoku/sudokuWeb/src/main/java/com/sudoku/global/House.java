package com.sudoku.global;

import java.util.HashMap;
import java.util.Map;

public class  House {

    private static House house;

    private static Map<String,Object> houseMap;


    private  House(){

        houseMap=new HashMap<>();
    }

    private static House instance=new House();

    public static House getInstance(){

        return instance;
    }


    public static Map<String,Object> getHouseMap(){
        return houseMap;
    }
}
