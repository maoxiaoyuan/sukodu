package com.sudoku.dao;

import com.sudoku.entity.HouseOrder;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("houseOrderDao")
public interface HouseOrderDao {

    //增加订单
    void insert(HouseOrder houseOrder);

    //修改订单
    void update(HouseOrder houseOrder);

    //删除订单
    void delete(String orderId);

    //根据订单编号查询订单
    HouseOrder selectById(String orderId);

    //根据用户查询订单
    List<HouseOrder> selectByUser(String orderUserId);

    //根据房源查询订单
    List<HouseOrder> selectByHouse(String orderHouseId);
}
