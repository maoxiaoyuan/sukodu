package com.sudoku.controller;

import com.sudoku.biz.*;
import com.sudoku.global.House;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller("/HouseController")
@RequestMapping("/house")
public class HouseController {

    @Autowired
    ImgBiz imgBiz;
    @Autowired
    HouseBasicInfoBiz houseBasicInfoBiz;
    @Autowired
    UserBiz userBiz;

    @Autowired
    StoryBiz storyBiz;

    //前台：房源列表(首页)
    @RequestMapping("/houseList")
    public String houseList(Map<String,Object> map){
        House.getInstance().getHouseMap().clear();
        map.put("houseList", houseBasicInfoBiz.getHouseToHome());
        map.put("storiesList",storyBiz.getAllStory());
        return "homepage";
    }



    //前台：房源详情
    @RequestMapping("/detail/{houseId}")
    public String detail(@PathVariable("houseId") Integer houseId, Map<String,Object> map){
       map.put("photos",imgBiz.getDetailPhotos(houseId));
       map.put("houseBasic",houseBasicInfoBiz.getHouseById(houseId));
        List<String> strList=new ArrayList<>();

        if(houseBasicInfoBiz.getHouseById(houseId).getTravelInfo().indexOf(" ")==-1&&houseBasicInfoBiz.getHouseById(houseId).getTravelInfo().indexOf("。")!=-1){
            strList.add(houseBasicInfoBiz.getHouseById(houseId).getTravelInfo());
        }else{
            String[] str=houseBasicInfoBiz.getHouseById(houseId).getTravelInfo().split(" ");
            for(int i=0;i<str.length;i++){
                strList.add(str[i]);
            }
        }

       map.put("travel", strList);
       map.put("houseId",houseId);
        return "userPages/view_house_detail";
    }

    //前台：联系房东
    @PostMapping("/communicateHost")
    public String communicateHost(Integer hostId,Integer houseId,Map<String,Object> map){
        map.put("houseBasic",houseBasicInfoBiz.getHouseById(houseId));
        System.out.println(houseBasicInfoBiz.getHouseById(houseId));
        map.put("houseId",houseId);
        return "userPages/communicate_host";
    }

    //后台：通过状态查询房源信息
    @RequestMapping("/getHouse")
    public String getInfoByStatus(Integer status,Integer pageNum,Map<String,Object> map){
        Map<String,Object> ele=houseBasicInfoBiz.getHouseByStatus(status, pageNum);
        map.put("pageInfo",ele.get("pageInfo"));
        return (String)ele.get("path");
    }

    //后台：查看该房源的所有信息
    @RequestMapping("/houseDetail")
    public String houseDetail(Integer houseId, Map<String,Object> map){
        map.put("allImg",imgBiz.getAllImg(houseId));
        map.put("houseBasic",houseBasicInfoBiz.getHouseById(houseId));
        map.put("houseId",houseId);
        return "adminPages/house_detail";
    }

    //后台：房源查询
    @RequestMapping("/getHouseInfo")
    public String getHouseInfo(String searchInfo,Map<String,Object> map){
        map.put("house",houseBasicInfoBiz.getHouseInfo(searchInfo));
        return  "adminPages/select-house";
    }
}
