package com.sudoku.biz;

import com.sudoku.entity.User;

import java.util.List;

//事务层
public interface UserBiz {

    void add(User user);

    void edit(User user);

    List<User> getAll();
    List<User> getByName(String name);

    User getById(Integer id);

    User login(String name,String password);

}
