package com.sudoku.dao;

import com.sudoku.entity.HouseResource;
import org.springframework.stereotype.Repository;

@Repository("houseResourceDao")
public interface HouseResourceDao {

    void insert(HouseResource houseResource);

    void updatePrice(Integer id);

    void update(HouseResource houseResource);

    HouseResource selectById(Integer id);

    HouseResource selectByHouseId(Integer houseId);

}
