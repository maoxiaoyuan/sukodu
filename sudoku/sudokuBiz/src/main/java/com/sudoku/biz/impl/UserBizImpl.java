package com.sudoku.biz.impl;

import com.sudoku.biz.UserBiz;
import com.sudoku.dao.UserDao;
import com.sudoku.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("userBiz")
public class UserBizImpl implements UserBiz {

    @Qualifier("userDao")
    @Autowired
    private UserDao userDao;

    public void add(User user) {
        userDao.insert(user);
    }

    public void edit(User user) {
        userDao.insert(user);
    }

    public List<User> getAll() {
        System.out.println(userDao);
        return userDao.selectAll();
    }

    public List<User> getByName(String name) {
        return userDao.selectByName(name);
    }

    public User getById(Integer id) {
        return userDao.selectById(id);
    }

    public User login(String name, String password) {
        List<User> users = userDao.selectByName(name);

        for(User user:users){
            if(user.getPassword().equals(password)){
                return user;
            }
        }
        return null;
    }
}
