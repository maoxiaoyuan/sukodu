package com.sudoku.controller;

import com.sudoku.biz.CityBiz;
import com.sudoku.biz.HouseBasicInfoBiz;
import com.sudoku.entity.HouseBasicInfo;
import com.sudoku.global.House;
import com.sudoku.util.DateUtil;
import com.sudoku.util.FileUploadUtil;
import com.sudoku.util.SavePathUtil;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContextEvent;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Map;

@Controller
@RequestMapping("/houseBasicInfo")
public class HouseBasicInfoController {

    @Autowired
    private HouseBasicInfoBiz houseBasicInfoBiz;
    @Autowired
    private CityBiz cityBiz;
    //房屋基本信息列表
    @RequestMapping("/list")
    public String list(Map<String,Object> map){
        map.put("list",houseBasicInfoBiz.getHouseAll());
        return "houseBasicInfo_list";
    }

    //打开添加界面
    @RequestMapping("/toAdd")
    public String toAdd(Map<String,Object> map){
        HouseBasicInfo houseBasicInfo=(HouseBasicInfo) House.getInstance().getHouseMap().get("houseBasicInfo");
        if(houseBasicInfo == null){
            map.put("houseBasicInfo",new HouseBasicInfo());
        }else{
            String s=houseBasicInfo.getProvince();
            map.put("houseBasicInfo",houseBasicInfo);
            map.put("province",cityBiz.getCityId(houseBasicInfo.getProvince()));
            map.put("town",cityBiz.getCityId(houseBasicInfo.getCity()));
            map.put("city",cityBiz.getCityId(houseBasicInfo.getTown()));
        }
        return "userPages/houseBasicInfo_add";
    }

    //处理添加
    @RequestMapping("/add")
    public String add(HouseBasicInfo houseBasicInfo,MultipartFile file, HttpServletRequest request)throws IllegalStateException, IOException {

        houseBasicInfo.setCertificateImg(FileUploadUtil.upload(file, SavePathUtil.CERTIFICATEIMG_PATH,request));
        houseBasicInfo.setProvince(cityBiz.getCityName(houseBasicInfo.getProvince()));
        houseBasicInfo.setCity(cityBiz.getCityName(houseBasicInfo.getCity()));
        houseBasicInfo.setTown(cityBiz.getCityName(houseBasicInfo.getTown()));
        houseBasicInfo.setStatus(0);
        houseBasicInfo.setRegisterTime(DateUtil.obtainDate());

        House.getInstance().getHouseMap().put("houseBasicInfo",houseBasicInfo);
        System.out.println(houseBasicInfo);
        return "redirect:/houseResource/toAdd";
    }

    //打开编辑界面
    @RequestMapping(value = "/toEdit",params = "id")
    public String toEdit(Integer id,Map<String,Object> map){
        map.put("houseBasicInfo", houseBasicInfoBiz.getHouseById(id));
        return "houseBasicInfo_edit";
    }

    //进行编辑
    public String edit(HouseBasicInfo houseBasicInfo){
        houseBasicInfoBiz.edit(houseBasicInfo);
        return "";
    }

    //删除操作
    public String remove(Integer id){
        houseBasicInfoBiz.remove(id);
        return "";
    }

}
