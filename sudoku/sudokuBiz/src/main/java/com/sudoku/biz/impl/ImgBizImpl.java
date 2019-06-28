package com.sudoku.biz.impl;

import com.sudoku.biz.ImgBiz;
import com.sudoku.dao.ImgDao;
import com.sudoku.entity.Img;
import com.sun.activation.registries.MailcapParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("imgBiz")
public class ImgBizImpl implements ImgBiz {

    @Autowired
    @Qualifier("imgDao")
    private ImgDao imgDao;

    //添加图片
    public void add(List<Img> imgs) {
        imgDao.insert(imgs);
    }

    //删除图片
    public void remove(Integer id) {
        imgDao.delete(id);
    }

    //获取该房源的全部图片
    public List<Img> getAllImg(Integer houseId) {

        return imgDao.selectAll(houseId);
    }

    //获取该房源图片的标题
    public List<Img> getImgTitles(Integer hoseId) {
        return imgDao.selectTitles(hoseId);
    }

    //获取房源详情的图片（5张）
    public Map<String,Object> getDetailPhotos(Integer houseId) {
        List<Img> imgs=imgDao.selectAll(houseId);
        Map<String,Object> map = new HashMap<String,Object>();
        int index=0;
        for(Img img:imgs){
            switch (index){
                case 0:
                {
                    map.put("first",img.getImgPath());
                    break;
                }

                case 1:
                {
                    map.put("second",img.getImgPath());
                    break;
                }
                case 2:
                {
                    map.put("three",img.getImgPath());
                    break;
                }
                case 3:
                {
                    map.put("four",img.getImgPath());
                    break;
                }
                case 4:
                {
                    map.put("five",img.getImgPath());
                    break;
                }
                default:
                {
                    break;
                }
            }
            index++;
        }
        return map;
    }
}
