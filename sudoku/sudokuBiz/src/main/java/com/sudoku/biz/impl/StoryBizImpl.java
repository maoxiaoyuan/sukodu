package com.sudoku.biz.impl;

import com.sudoku.biz.StoryBiz;
import com.sudoku.dao.HouseBasicInfoDao;
import com.sudoku.dao.StoryDao;
import com.sudoku.dao.UserDao;
import com.sudoku.entity.Story;
import com.sudoku.entity.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class StoryBizImpl implements StoryBiz {

    @Resource(name="storyDao")
    private StoryDao storyDao;

    @Resource(name = "userDao")
    private UserDao userDao;

    @Resource(name = "houseBasicInfoDao")
    private HouseBasicInfoDao houseDao;

    //根据id获取story
    public Story getStoryById(Integer id){
        return storyDao.selectStoryById(id);
    }

    //根据用户id获取story
    public List<Story> getStoryByUserId(Integer uid){
        return storyDao.selectStoryByUserId(uid);
    }

    public List<Story> getAllStory() {
        return storyDao.selectAllStory();
    }

    //插入故事
    public void insertStory(Story story, User user,List imgList)throws IllegalStateException, IOException {
        story.setCreateTime(new Date());
        //选择房源

        story.setUser(user);
        setImages(story,imgList,imgList.size());
//        System.out.println("service-------------"+story);
        storyDao.insertStory(story);
//        Integer id = story.getSid();
//        System.out.println("刚插入的id为----");

    }

    //根据story的id删除故事
    public void deleteStoryById(Integer sid){
        storyDao.deleteStoryById(sid);
    }

    //插入图片到数据库函数
    public void setImages(Story story,List imgList,Integer num){
        if (num>=1){
            story.setImg01(imgList.get(0).toString());
            if (num>=2){
                story.setImg02(imgList.get(1).toString());
                if (num>=3){
                    story.setImg03(imgList.get(2).toString());
                    if (num>=4){
                        story.setImg04(imgList.get(3).toString());
                        if (num>=5){
                            story.setImg05(imgList.get(4).toString());
                            if (num>=6){
                                story.setImg06(imgList.get(5).toString());
                            }
                        }
                    }
                }
            }

        }
//        switch (num){
//            case 1:story.setImg01(list.get(1).toString());break;
//            case 2:story.setImg02();
//        }
    }


}
