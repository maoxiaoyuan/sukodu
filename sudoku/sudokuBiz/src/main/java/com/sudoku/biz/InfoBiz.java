package com.sudoku.biz;

import com.sudoku.entity.Info;

import java.util.List;

public interface InfoBiz {

    void add(Info  info);

    List<Info> getAll();
}
