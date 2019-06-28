package com.sudoku.controller;

import com.sudoku.biz.*;
import com.sudoku.entity.*;
import com.sudoku.global.House;
import com.sudoku.util.WebSocketUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@Controller("submitController")
public class SubmitController {

    @Autowired
    private HouseBasicInfoBiz houseBasicInfoBiz;
    @Autowired
    private HouseDetailBiz houseDetailBiz;
    @Autowired
    private HouseResourceBiz houseResourceBiz;
    @Autowired
    private ImgBiz houseImgBiz;
    @Autowired
    private FacilityBiz facilityBiz;


    @RequestMapping("/toSubmit")
    public String toSubmit(){
        return "userPages/houseSubmit";
    }

    @RequestMapping(value = "/submit",method = RequestMethod.POST)
    public String submit(){
        try {
            WebSocketUtil.sendMessage("有人提交房源，正在等待管理员审核");
            System.out.println("管理员在线");
        } catch (IOException e) {
            System.out.println("管理员不在线");
        } catch(NullPointerException e){
            System.out.println("空指针");
        }catch (Exception e){
            System.out.println("其他异常");
        }finally{
            System.out.println("留言信息保存在数据库中");
        }

        HouseBasicInfo houseBasicInfo = (HouseBasicInfo) House.getInstance().getHouseMap().get("houseBasicInfo");
        houseBasicInfoBiz.add(houseBasicInfo);
        HouseResource houseResource=(HouseResource) House.getInstance().getHouseMap().get("houseResource");
        houseResourceBiz.add(houseResource);
        List<Img> imgList=(List<Img>) House.getInstance().getHouseMap().get("houseImg");
        System.out.println(imgList);
        houseImgBiz.add(imgList);
        List<HouseDetail> detailList=(List<HouseDetail>)House.getInstance().getHouseMap().get("houseDetail");
        if(detailList.isEmpty()){
            System.out.println("空");
        }else{
            System.out.println("submit---"+detailList);
            houseDetailBiz.add(detailList);
        }
        Facility facility=(Facility) House.getInstance().getHouseMap().get("facility");
        facilityBiz.add(facility);

        return "redirect:waitCheck";
    }

    @RequestMapping("/waitCheck")
    public String waitCheck(Map<String,Object> map)
    {
        return "userPages/success";
    }
}
