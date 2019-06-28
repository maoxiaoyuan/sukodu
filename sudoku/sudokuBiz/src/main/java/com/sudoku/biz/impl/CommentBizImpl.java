package com.sudoku.biz.impl;

import com.sudoku.biz.CommentBiz;

import com.sudoku.dao.CommentDao;

import com.sudoku.dao.StoryDao;
import com.sudoku.dao.UserDao;
import com.sudoku.entity.Comment;
import com.sudoku.entity.Story;
import com.sudoku.entity.User;
import org.springframework.stereotype.Service;


import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
@Service("commentBiz")
public class CommentBizImpl implements CommentBiz {
    @Resource(name = "commentDao")
    private CommentDao commentDao;

    @Resource(name = "storyDao")
    private StoryDao storyDao;

    @Resource(name = "userDao")
    private UserDao userDao;

    public int getCoutById(Integer sid){
        return commentDao.selectCoutById(sid);
    };

    public List<Comment> getCommentByStoryId(Integer sid){

        return commentDao.selectCommentByStoryId(sid);
    }
    public void insertComment(Comment comment,Integer sid, User user){

        comment.setCreateTime(new Date());
        comment.setStory(storyDao.selectStoryById(sid));
        comment.setUser(user);
//        System.out.println("CommentServiceImpl---"+comment);
        commentDao.insertComment(comment);

    }
    public void deleteComment(Story story, User user){

    }

}
