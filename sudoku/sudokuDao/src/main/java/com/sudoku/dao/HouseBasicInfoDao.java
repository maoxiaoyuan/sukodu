package com.sudoku.dao;

import com.sudoku.entity.HouseBasicInfo;
import org.springframework.stereotype.Repository;

import java.util.List;

//持久层：房屋基本信息
@Repository("houseBasicInfoDao")
public interface HouseBasicInfoDao {

    //添加房源详情
    void insert(HouseBasicInfo houseBasicInfo);

    //删除房源信息
    void delete(Integer id);

    //修改房源信息
    void update(HouseBasicInfo houseBasicInfo);

    //通过房源ID查找该房源的信息
    HouseBasicInfo selectById(Integer id);

    //通过该房源的状态查找符合的房源
    List<HouseBasicInfo> selectByStatus(Integer status);

    //通过房东查询房源信息
    List<HouseBasicInfo> selectBylandlordId(Integer landlordId);

    //通过房产证编号查询房源信息
    HouseBasicInfo selectByCNum(String number);

    //查找所有的房源信息
    List<HouseBasicInfo> selectAll();

}
