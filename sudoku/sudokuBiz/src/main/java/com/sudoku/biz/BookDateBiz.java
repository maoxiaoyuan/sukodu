package com.sudoku.biz;

import com.sudoku.entity.BookDate;

import java.util.List;

public interface BookDateBiz {


    void add(List<BookDate> list);

    void remove(String houseId);

    List<BookDate> getAllDate(String houseId);
}
