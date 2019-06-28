package com.sudoku.biz.impl;

import com.sudoku.biz.HouseOrderBiz;
import com.sudoku.dao.HouseOrderDao;
import com.sudoku.entity.HouseOrder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service("houseOrderBiz")
public class HouseOrderBizImpl implements HouseOrderBiz {

    @Autowired
    @Qualifier("houseOrderDao")
    private HouseOrderDao houseOrderDao;

    //添加订单
    public void add(HouseOrder houseOrder) {
        houseOrderDao.insert(houseOrder);
    }

    //修改订单
    public void edit(HouseOrder houseOrder) {
        houseOrderDao.update(houseOrder);
    }

    //取消订单
    public void remove(String orderId) {
        houseOrderDao.delete(orderId);
    }

    //通过订单编号查询订单
    public HouseOrder getById(String orderId) {
        return houseOrderDao.selectById(orderId);
    }

    //查询用户所有的订单
    public List<HouseOrder> getByUserId(String orderUserId) {
        return houseOrderDao.selectByUser(orderUserId);
    }

    //查询该房源的所有订单
    public List<HouseOrder> getByHouseId(String orderHouseId) {
        return houseOrderDao.selectByHouse(orderHouseId);
    }

    //根据预定房间的起止时间，得到入住的所有日期
    public List<Date> getAllDate(Date start, Date end) {
        List<Date> list = new ArrayList<Date>();
        Long oneDay = 1000 * 60 * 60 * 24l;
        long s = start.getTime();
        long e = end.getTime();

        System.out.println("start="+s);
        System.out.println("end="+e);

        String format="yyyy-MM-dd";
        while (s <= e) {
            start = new Date(s);
            String obtainDate=new SimpleDateFormat("yyyy-MM-dd").format(start);
            Date date= null;
            try {
                date = new SimpleDateFormat(format).parse(obtainDate);
            } catch (ParseException e1) {
                e1.printStackTrace();
            }

            list.add(date);
            s += oneDay;
        }
        return list;
    }
}
