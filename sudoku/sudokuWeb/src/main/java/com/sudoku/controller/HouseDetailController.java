package com.sudoku.controller;

import com.sudoku.biz.FacilityBiz;
import com.sudoku.biz.HouseDetailBiz;
import com.sudoku.entity.Facility;
import com.sudoku.entity.HouseBasicInfo;
import com.sudoku.entity.HouseDetail;
import com.sudoku.global.House;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller("houseDetailController ")
@RequestMapping("/houseDetail")
public class HouseDetailController {

    @Autowired
    private HouseDetailBiz houseDetailBiz;
    @Autowired
    private FacilityBiz facilityBiz;

    @RequestMapping(value = "/detail",params = "houseId")
    public String detail(Integer houseId, Map<String,Object> map){
        map.put("houseDetail",houseDetailBiz.getByHouseId(houseId));
        return "";
    }

    @RequestMapping("/toAdd")
    public String toAdd(Map<String, Object> map){
        HouseBasicInfo houseBasicInfo=(HouseBasicInfo)House.getInstance().getHouseMap().get("houseBasicInfo");
        List<HouseDetail> list=(List<HouseDetail>) House.getInstance().getHouseMap().get("houseDetail");
        Facility facility=(Facility) House.getInstance().getHouseMap().get("facility");
        map.put("houseId",houseBasicInfo.getId());
        if(list != null){
            map.put("list",list);
        }
        if(facility != null){
            map.put("facility",facility);
        }
        return "userPages/houseDetail_add";
    }

    @RequestMapping(value = "/add")
    public  String add(String[] name,Double[] price,Integer[] maxTenants,String[] roomDescribe,Integer houseId,Facility facility ) throws Exception{
        List<HouseDetail> list = new ArrayList<>();
        for(int i=0;i<name.length;i++){
            HouseDetail houseDetail=new HouseDetail();
            houseDetail.setName(name[i]);
            houseDetail.setPrice(price[i]);
            houseDetail.setMaxTenants(maxTenants[i]);
            houseDetail.setRoomDescribe(roomDescribe[i]);
            houseDetail.setHouseId(houseId);
            list.add(houseDetail);
        }
         House.getInstance().getHouseMap().put("houseDetail",list);
         House.getInstance().getHouseMap().put("facility",facility);
        return "redirect:/houseImg/toAdd";
    }
}
