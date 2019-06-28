package com.sudoku.dao;

import com.sudoku.entity.HouseDetail;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("houseDetailDao")
public interface HouseDetailDao {

    void insert(List<HouseDetail> list);

    HouseDetail selectByHouseId(Integer houseId);
}
