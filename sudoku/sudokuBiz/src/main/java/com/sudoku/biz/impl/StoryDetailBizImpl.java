package com.sudoku.biz.impl;

import com.sudoku.biz.StoryDetailBiz;

import com.sudoku.dao.StoryDao;
import com.sudoku.dao.StoryDetailDao;

import com.sudoku.entity.HouseBasicInfo;
import com.sudoku.entity.StoryDetail;
import com.sudoku.entity.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

import java.util.List;

@Service
public class StoryDetailBizImpl implements StoryDetailBiz {

    @Resource(name = "storyDetailDao")
    private StoryDetailDao storyDetailDao;

    @Resource(name = "storyDao")
    private StoryDao storyDao;

    //根据sid查询StoryDetail
    public StoryDetail getStoryDetailByStoryId(Integer sid){
        return storyDetailDao.selectStoryDetailByStoryId(sid);
    };

    //按点赞数量显示所有故事
    public List<StoryDetail> getAllStoryDetail(){
        return storyDetailDao.selectAllStoryDetail();
    }

    //按照点赞数量排序显示前四名
    public List<StoryDetail> getStoryDetailTop(){
        return storyDetailDao.selectStoryDetailTop();
    }
    //显示相关故事中点赞数最多的前9个
    public List<StoryDetail> getRelatedStoryDetail(Integer sid){

        if (!(storyDao.selectStoryById(sid).getTourCity().equals("false"))){
            String city=storyDao.selectStoryById(sid).getTourCity();
            System.out.println("city="+city);
            return storyDetailDao.selectRelatedStoryDetail(sid,city);
        }else {
            HouseBasicInfo house=storyDao.selectStoryById(sid).getHouse();
            System.out.println("house="+house);
            System.out.println("storyDetailServiceImpl---"+storyDetailDao.selectRelatedStoryDetailByHouse(sid,house));
            return storyDetailDao.selectRelatedStoryDetailByHouse(sid,house);
        }
    }

    //根据sid,uid插入StoryDetail
    public void insertStoryDetail( Integer sid, User user){
        StoryDetail storyDetail=new StoryDetail();
        storyDetail.setStory(storyDao.selectStoryById(sid));
        storyDetail.setFavoriteNum(0);
        storyDetail.setLikeNum(0);
        storyDetail.setCommentNum(0);
        //设置storyDetail的属性
        storyDetailDao.insertStoryDetail(storyDetail);
    }
    //点赞和收藏执行该函数
    public void updateStoryDetailinsert(Integer sid, User user,char f){
        //通过storyid获取storyDetail
        System.out.println("sid:"+sid+"----"+user+"--"+f);
        StoryDetail storyDetail=storyDetailDao.selectStoryDetailByStoryId(sid);
        System.out.println("storyDetail:---insertBefor---"+storyDetail.getSdid()+"---"+storyDetail.getLikeNum()+"--"+storyDetail.getFavoriteNum()+"---"+storyDetail.getCommentNum());
        changeAdd(f,storyDetail);
        System.out.println("storyDetail:---insertAfter---"+storyDetail.getSdid()+"---"+storyDetail.getLikeNum()+"--"+storyDetail.getFavoriteNum()+"---"+storyDetail.getCommentNum());
        storyDetailDao.updateStoryDetail(storyDetail);
    }
    //取消点赞和收藏执行该函数
    public void updateStoryDetaildelete(Integer sid ,User user,char f){
        StoryDetail storyDetail=storyDetailDao.selectStoryDetailByStoryId(sid);
        System.out.println("storyDetail:---delete---"+storyDetail);
        changeDelete(f,storyDetail);
        storyDetailDao.updateStoryDetail(storyDetail);
    }
    //删除故事详情
    public void deleteStoryDetail(Integer sid){
        storyDetailDao.deleteStoryDetailByStoryId(sid);
    }

    //更改like_num,favorite_num,comment_num并在前面的函数中调用
    public void changeAdd(char f , StoryDetail storyDetail){
        switch (f){
            case 'c':
                storyDetail.setCommentNum(storyDetail.getCommentNum()+1);
                break;
            case 'l':
                storyDetail.setLikeNum(storyDetail.getLikeNum()+1);
                break;
            case 'f':
                storyDetail.setFavoriteNum(storyDetail.getFavoriteNum()+1);
                break;
        }
    }
    public void changeDelete(char f , StoryDetail storyDetail){
        switch (f){
            case 'c':
                storyDetail.setCommentNum(storyDetail.getCommentNum()-1);
                break;
            case 'l':
                storyDetail.setLikeNum(storyDetail.getLikeNum()-1);
                break;
            case 'f':
                storyDetail.setFavoriteNum(storyDetail.getFavoriteNum()-1);
                break;
        }
    }
}
