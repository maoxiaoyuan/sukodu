package com.sudoku.biz;

import com.sudoku.entity.Img;

import java.util.List;
import java.util.Map;

public interface ImgBiz {

    void add(List<Img> imgs);

    void remove(Integer id);

    List<Img> getAllImg(Integer houseId);

    List<Img> getImgTitles(Integer hoseId);

    Map<String,Object> getDetailPhotos(Integer houseId);
}
