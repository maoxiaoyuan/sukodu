package com.sudoku.dao;

import com.sudoku.entity.Info;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("infoDao")
public interface InfoDao {

    //增
    void insert(Info info);

    //查
    List<Info> selectAll();
}
