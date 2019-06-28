package com.sudoku.biz;

import com.sudoku.entity.Followers;
import com.sudoku.entity.User;

import java.util.List;

public interface FollowersBiz {
    List<Followers> getFollowById(User user);
    List<Followers> getFollowersById(User user);
    List<Followers> getBothFollowById(User user);
    Integer getFollowByUserId(User user, User follow);
    void insertFollowers(User user, User follow);
    void deleteFollowers(User user, User follow);
}
