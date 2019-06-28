package com.sudoku.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.sudoku.biz.ImgBiz;
import com.sudoku.entity.HouseBasicInfo;
import com.sudoku.entity.Img;
import com.sudoku.global.House;
import com.sudoku.util.DateUtil;
import com.sudoku.util.FileUploadUtil;
import com.sudoku.util.SavePathUtil;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import sun.rmi.runtime.NewThreadAction;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller("houseImgController ")
@RequestMapping("/houseImg")
public class HouseImgController {

    @Autowired
    private ImgBiz imgBiz;



    @RequestMapping("/toAdd")
    public String toAdd(Map<String, Object> map){
        HouseBasicInfo houseBasicInfo=(HouseBasicInfo)House.getInstance().getHouseMap().get("houseBasicInfo");
        map.put("houseId",houseBasicInfo.getId());
        map.put("img",new Img());
        return "userPages/houseImg_add";
    }



    @RequestMapping("/add")
    public String add(Integer houseId,String imageList,MultipartFile[] image,HttpServletRequest request)throws IllegalStateException, IOException  {

        List<Img> imgList=new ArrayList<>();
        String[] imgStr=imageList.split(",");
        for(int i=0;i<imgStr.length-1;i++){
            imgStr[i]=imgStr[i].substring(imgStr[i].indexOf("[")+1,imgStr[i].indexOf("]"));
            String[] imgSingle=imgStr[i].split(";");
                Img img=new Img();
                img.setHouseId(houseId);
                img.setTitle(imgSingle[0]);
                img.setSmallTitle(imgSingle[1]);
                img.setDate(DateUtil.obtainDate());
                imgList.add(img);
        }
        int index=0;
        for(MultipartFile file:image) {
            if (file.isEmpty()) {
                System.out.println("文件未上传");
                index=index-1;
            } else {
                System.out.println("上传成功！"+index);
               imgList.get(index).setImgPath(FileUploadUtil.fileTransfer(SavePathUtil.HOUSEPHOTOS_PATH,file,request));
            }
            index++;
        }

        House.getInstance().getHouseMap().put("houseImg",imgList);
        return "redirect:/toSubmit";
    }

    @RequestMapping("/viewPhotos")
    public String viewPhotos(Integer houseId,String title,Map<String, Object> map){
        List<Img> lists=imgBiz.getAllImg(houseId);
        List<Img> titles=imgBiz.getImgTitles(houseId);
        map.put("imgList",lists);
        map.put("imgTitle",titles);
        map.put("title",title);
        map.put("houseId",houseId);
        return "userPages/view_house_photo";
    }
 }
