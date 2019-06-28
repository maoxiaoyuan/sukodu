package com.sudoku.biz;

import com.sudoku.entity.Facility;

public interface FacilityBiz {

    void add(Facility facility);

    Facility getByHouseId(Integer houseId);
}
