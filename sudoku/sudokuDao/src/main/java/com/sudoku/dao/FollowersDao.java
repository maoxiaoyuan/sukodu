package com.sudoku.dao;

import com.sudoku.entity.Followers;
import org.springframework.stereotype.Component;

import java.util.List;

@Component("followersDao")
public interface FollowersDao {

    List<Followers> selectFollowById(Integer uid);

    List<Followers> selectFollowersById(Integer uid);

    List<Followers> selectBothFollowById(Integer uid);

    Integer selectFollowByUserId(Followers followers);

    void insertFollowers(Followers followers);

    void deleteFollowers(Followers followers);
}
