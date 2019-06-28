package com.sudoku.biz;

import com.sudoku.entity.City;

import java.util.List;

public interface CityBiz {

    City getCityById(Integer id);

    City getCityByCityName(String name);

    List<City> getCitys(Integer pid);

    String getCityName(String id);

    Integer getCityId(String name);
}
