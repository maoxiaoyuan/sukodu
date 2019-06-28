package com.sudoku.dao;

import com.sudoku.entity.User;
import org.springframework.stereotype.Repository;

import java.util.List;

//持久层：userDao接口
@Repository("userDao")
public interface UserDao {

   void insert(User user);

   void update(User user);

   User selectById(int id);

   List<User> selectByName(String name);

   List<User> selectAll();

}
