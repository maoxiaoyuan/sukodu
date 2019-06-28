package com.sudoku.dao;

import com.sudoku.entity.City;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("cityDao")
public interface CityDao {

    City selectById(int id);

    City selectByName(String cityName);

    List<City> selectByPid(int pid);
}
