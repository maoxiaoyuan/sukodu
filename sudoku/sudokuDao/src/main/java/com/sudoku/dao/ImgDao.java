package com.sudoku.dao;

import com.sudoku.entity.Img;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

//持久层：图片
@Repository("imgDao")
public interface ImgDao {

    void insert(List<Img> list);

    void delete(Integer id);

    List<Img> selectAll(Integer houseId);

    List<Img> selectTitles(Integer houseId);
}
