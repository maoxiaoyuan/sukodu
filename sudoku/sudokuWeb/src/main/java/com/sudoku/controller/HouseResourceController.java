package com.sudoku.controller;

import com.sudoku.biz.HouseResourceBiz;
import com.sudoku.biz.impl.HouseResourceBizImpl;
import com.sudoku.entity.HouseBasicInfo;
import com.sudoku.entity.HouseResource;
import com.sudoku.global.House;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

@Controller
@RequestMapping("/houseResource")
public class HouseResourceController {

    @Autowired
    private HouseResourceBiz houseResourceBiz=new HouseResourceBizImpl();

    //房屋详情信息
    @RequestMapping(value = "/list",params = "id")
    public String list(Map<String,Object> map,Integer id){
        map.put("list",houseResourceBiz.getResourceById(id));
        return "houseResource_list";
    }

    //打开添加界面
    @RequestMapping("/toAdd")
    public String toAdd(Map<String,Object> map){
        HouseBasicInfo houseBasicInfo=(HouseBasicInfo)House.getInstance().getHouseMap().get("houseBasicInfo");
        HouseResource houseResource=(HouseResource) House.getInstance().getHouseMap().get("houseResource");
        map.put("houseId",houseBasicInfo.getId());
        if( houseResource == null){
            map.put("houseResource",new HouseResource());
        }else{
            map.put("houseResource",houseResource);
        }
        return "userPages/houseResource_add";
    }

    //处理添加
    @RequestMapping("/add")
    public String add(HouseResource houseResource){
        House.getInstance().getHouseMap().put("houseResource",houseResource);
        return "redirect:/houseDetail/toAdd";
    }

    //打开编辑界面
    @RequestMapping(value = "/toEdit",params = "id")
    public String toEdit(Integer id,Map<String,Object> map){
        map.put("houseResource", houseResourceBiz.getResourceById(id));
        return "houseBasicInfo_edit";
    }

    //进行编辑
    public String edit(HouseResource houseResource){
        houseResourceBiz.edit(houseResource);
        return "";
    }


}
