package com.sudoku.biz.impl;

import com.sudoku.biz.CityBiz;
import com.sudoku.dao.CityDao;
import com.sudoku.entity.City;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("cityBiz")
public class CityBizImpl implements CityBiz {

    @Qualifier("cityDao")
    @Autowired
    private CityDao cityDao;


    public City getCityById(Integer id) {
        return cityDao.selectById(id);
    }

    public City getCityByCityName(String name) {
        return cityDao.selectByName(name);
    }

    public List<City> getCitys(Integer pid) {

        return cityDao.selectByPid(pid);
    }

    public String getCityName(String id) {

        return this.getCityById(Integer.parseInt(id)).getCityName();
    }

    public Integer getCityId(String name) {
        return this.getCityByCityName(name).getId();
    }
}
