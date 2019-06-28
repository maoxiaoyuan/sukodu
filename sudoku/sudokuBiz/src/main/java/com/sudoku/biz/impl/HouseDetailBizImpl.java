package com.sudoku.biz.impl;

import com.sudoku.biz.HouseDetailBiz;
import com.sudoku.dao.HouseDetailDao;
import com.sudoku.entity.HouseDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("houseDetailBiz")
public class HouseDetailBizImpl implements HouseDetailBiz {

    @Qualifier("houseDetailDao")
    @Autowired
    private HouseDetailDao houseDetailDao;

    public void add(List<HouseDetail> list) {
        houseDetailDao.insert(list);
    }

    public HouseDetail getByHouseId(Integer houseId) {
        return houseDetailDao.selectByHouseId(houseId);
    }
}
