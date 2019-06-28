package com.sudoku.biz;

import com.sudoku.entity.HouseBasicInfo;

import java.util.List;
import java.util.Map;

public interface HouseBasicInfoBiz {

    void add(HouseBasicInfo houseBasicInfo);

    void edit(HouseBasicInfo houseBasicInfo);

    void remove(Integer id);

    HouseBasicInfo getHouseById(Integer id);

    List<HouseBasicInfo> getHouseByStatus(Integer status);

    Map<String,Object> getHouseByStatus(Integer status, Integer pageNum);

    List<HouseBasicInfo> getHouseByLandlordId(Integer landlordId);

    HouseBasicInfo getHouseByCNum(String number);

    List<HouseBasicInfo> getHouseInfo(String searchInfo);

    List<HouseBasicInfo> getHouseAll();

    List<Object> getHouseToHome();
}
