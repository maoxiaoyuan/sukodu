package com.sudoku.biz.impl;

import com.sudoku.biz.FacilityBiz;
import com.sudoku.dao.FacilityDao;
import com.sudoku.entity.Facility;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("facilityBiz")
public class FacilityBizImpl implements FacilityBiz {

    @Qualifier("facilityDao")
    @Autowired
    private FacilityDao facilityDao;

    public void add(Facility facility) {
        facilityDao.insert(facility);
    }

    public Facility getByHouseId(Integer houseId) {
        return facilityDao.selectByHouseId(houseId);
    }

}
