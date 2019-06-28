package com.sudoku.biz;

import com.sudoku.entity.Likes;
import com.sudoku.entity.Story;
import com.sudoku.entity.User;

import java.util.List;

public interface LikesBiz {
    int getCoutById(Integer sid);
    List<Likes> getLikesByStoryId(Integer sid);
    List<Likes> getLikesByUserId(Integer uid);
    int getByUserStory(Integer sid, User user);
    void insertLikes(Integer sid, User user);
    void deleteLikes(Integer sid, User user);
}
