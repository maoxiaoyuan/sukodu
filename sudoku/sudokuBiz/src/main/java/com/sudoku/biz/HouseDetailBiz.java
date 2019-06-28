package com.sudoku.biz;

import com.sudoku.entity.HouseDetail;

import java.util.List;

public interface HouseDetailBiz {

    void add(List<HouseDetail> list);

    HouseDetail getByHouseId(Integer houseId);
}
