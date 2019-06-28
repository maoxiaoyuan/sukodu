package com.sudoku.biz.impl;

import com.sudoku.biz.BookDateBiz;
import com.sudoku.dao.BookDateDao;
import com.sudoku.entity.BookDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("bookDateBizImpl")
public class BookDateBizImpl implements BookDateBiz {

    @Autowired
    @Qualifier("bookDateDao")
    private BookDateDao bookDateDao;


    public void add(List<BookDate> list) {
        bookDateDao.insert(list);
    }

    public void remove(String houseId) {
        bookDateDao.delete(houseId);
    }

    public List<BookDate> getAllDate(String houseId) {
        return bookDateDao.selectAll(houseId);
    }
}
