package com.sudoku.biz.impl;

import com.sudoku.biz.HouseResourceBiz;
import com.sudoku.dao.HouseResourceDao;
import com.sudoku.entity.HouseResource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("houseResourceBiz")
public class HouseResourceBizImpl implements HouseResourceBiz {

    @Qualifier("houseResourceDao")
    @Autowired
    private HouseResourceDao houseResourceDao;

    public void add(HouseResource houseResource) {
        houseResourceDao.insert(houseResource);
    }

    public void edit(HouseResource houseResource) {
        houseResourceDao.update(houseResource);
    }

    public void editPrice(Integer id) {
        houseResourceDao.updatePrice(id);
    }

    public HouseResource getResourceById(Integer id) {
        return houseResourceDao.selectById(id);
    }
}
