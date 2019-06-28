package com.sudoku.biz;

import com.sudoku.entity.HouseOrder;

import java.util.Date;
import java.util.List;

public interface HouseOrderBiz {

    void add(HouseOrder houseOrder);

    void edit(HouseOrder houseOrder);

    void remove(String orderId);

    HouseOrder getById(String orderId);

    List<HouseOrder> getByUserId(String orderUserId);

    List<HouseOrder> getByHouseId(String orderHouseId);

    List<Date> getAllDate(Date start,Date end);

}
