package com.sudoku.dao;

import com.sudoku.entity.Likes;
import org.springframework.stereotype.Component;

import java.util.List;

@Component("likesDao")
public interface LikesDao {

    int selectCoutById(Integer sid);

    List<Likes> selectLikesByStoryId(Integer sid);

    List<Likes> selectLikesByUserId(Integer uid);

    int selectByUserStory(Likes likes);

    void insertLikes(Likes likes);

    void deleteLikes(Likes likes);

}
