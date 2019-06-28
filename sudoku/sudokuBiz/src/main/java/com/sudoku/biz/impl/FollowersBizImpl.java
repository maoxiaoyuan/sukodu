package com.sudoku.biz.impl;

import com.sudoku.biz.FollowersBiz;

import com.sudoku.dao.FollowersDao;
import com.sudoku.entity.Followers;
import com.sudoku.entity.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class FollowersBizImpl implements FollowersBiz {

    @Resource(name = "followersDao")
    private FollowersDao followersDao;

    //     A的关注列表
    public List<Followers> getFollowById(User user){
        return followersDao.selectFollowById(user.getId());
    }

    //    A的粉丝列表
    public List<Followers> getFollowersById(User user){
        return followersDao.selectFollowersById(user.getId());
    }

    //    A的互粉列表
    public List<Followers> getBothFollowById(User user){
        return followersDao.selectBothFollowById(user.getId());
    }

    //A是否关注了B
    public Integer getFollowByUserId(User user,User follow){
        Followers followers=new Followers();
        followers.setUserFollow(user);
        followers.setUserFollower(follow);
        return followersDao.selectFollowByUserId(followers);
    }

    //    A关注B
    public void insertFollowers(User user,User follow){
        Followers followers=new Followers();
        followers.setUserFollow(user);
        followers.setUserFollower(follow);;
        followersDao.insertFollowers(followers);
    }

    //    A取关B
    public void deleteFollowers(User user,User follow){
        Followers followers=new Followers();
        followers.setUserFollow(user);
        followers.setUserFollower(follow);
        System.out.println("deleteFollowers"+followers);
        followersDao.deleteFollowers(followers);
    }
}
