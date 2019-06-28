package com.sudoku.dao;

import com.sudoku.entity.Facility;
import org.springframework.stereotype.Repository;

@Repository("facilityDao")
public interface FacilityDao {

    void insert(Facility facility);

    Facility selectByHouseId(Integer houseId);
}
