package com.sudoku.biz.impl;

import com.sudoku.biz.FavoritesBiz;
import com.sudoku.dao.FavoritesDao;
import com.sudoku.dao.StoryDao;
import com.sudoku.dao.UserDao;
import com.sudoku.entity.Favorites;
import com.sudoku.entity.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
public class FavoritesBizImpl implements FavoritesBiz {

    @Resource(name = "favoritesDao")
    private FavoritesDao favoritesDao;

    @Resource(name = "storyDao")
    private StoryDao storyDao;

    @Resource(name = "userDao")
    private UserDao userDao;

    //根据sid获取收藏该故事的所有人数，目的是为了插入story_detail表中
    public int getCoutById(Integer sid){
        return favoritesDao.selectCoutById(sid);
    }

    //根据sid获取收藏该故事的所有人
    public List<Favorites> getFavoritesByStoryId(Integer sid){
        return favoritesDao.selectFavoritesByStoryId(sid);
    }

    //根据uid获取该用户收藏的所有故事
    public List<Favorites> getFavoritesByUserId(Integer id){
        return favoritesDao.selectFavoritesByUserId(id);
    }

    //判断该用户是否收藏过该故事
    public int getByUserStory(Integer sid,User user){
        Favorites favorites=new Favorites();
        favorites.setStory(storyDao.selectStoryById(sid));
        favorites.setUser(user);
        return favoritesDao.selectByUserStory(favorites);
    }

    //插入收藏记录
    public void insertFavorites(Integer sid, User user){
        Favorites favorites=new Favorites();
        favorites.setCreateTime(new Date());
        favorites.setStory( storyDao.selectStoryById(sid));
        favorites.setUser(user);
        System.out.println("service层insertFavorites方法---"+favorites);
        favoritesDao.insertFavorites(favorites);
    }

    //删除收藏记录
    public void deleteFavorites(Integer sid, User user){
        Favorites favorites=new Favorites();
        favorites.setStory(storyDao.selectStoryById(sid));
        favorites.setUser(user);
        favoritesDao.deleteFavorites(favorites);
    }
}
