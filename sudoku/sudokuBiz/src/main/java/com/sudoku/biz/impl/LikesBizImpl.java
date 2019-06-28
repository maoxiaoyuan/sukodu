package com.sudoku.biz.impl;


import com.sudoku.biz.LikesBiz;
import com.sudoku.dao.LikesDao;
import com.sudoku.dao.StoryDao;
import com.sudoku.dao.UserDao;
import com.sudoku.entity.Likes;
import com.sudoku.entity.Story;
import com.sudoku.entity.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
public class LikesBizImpl implements LikesBiz {

    @Resource(name = "likesDao")
    private LikesDao likesDao;
    @Resource(name = "storyDao")
    private StoryDao storyDao;
    @Resource(name = "userDao")
    private UserDao userDao;
    //根据sid获取喜欢该故事的所有人数，目的是为了插入story_detail表中
    public int getCoutById(Integer sid){
        return likesDao.selectCoutById(sid);
    };
    //根据sid获取喜欢该故事的所有人
    public List<Likes> getLikesByStoryId(Integer sid){
        return likesDao.selectLikesByStoryId(sid);
    };
    //根据uid获取该用户喜欢的所有故事
    public List<Likes> getLikesByUserId(Integer uid){
        return likesDao.selectLikesByUserId(uid);
    }
    //判断该用户是否喜欢过该故事
    public int getByUserStory(Integer sid ,User user){
        Likes likes=new Likes();
        likes.setUser(user);
        likes.setStory(storyDao.selectStoryById(sid));
        return likesDao.selectByUserStory(likes);
    }
    //插入喜欢记录
    public void insertLikes(Integer sid, User user){
        Likes likes=new Likes();
        likes.setCreateTime(new Date());
        //设置Likes的story和user
        //story应该从request中获取，user应该从session中获取
        Story story= storyDao.selectStoryById(sid);
        System.out.println("-----userDao.selectUserById(2)"+user);
        likes.setStory(story);
        likes.setUser(user);
        likesDao.insertLikes(likes);
    };
    //删除喜欢记录
    public void deleteLikes(Integer sid, User user){
        Likes likes=new Likes();
        //设置likes的story和user属性
        Story story=storyDao.selectStoryById(sid);
        likes.setStory(story);
        likes.setUser(user);
        likesDao.deleteLikes(likes);
    };
}
