package com.sudoku.dao;

import com.sudoku.entity.BookDate;
import org.springframework.stereotype.Repository;


import java.util.List;

@Repository("bookDateDao")
public interface BookDateDao {

    void insert(List<BookDate> list);

    void delete(String houseId);

    List<BookDate> selectAll(String houseId);

}
