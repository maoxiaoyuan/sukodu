package com.sudoku.biz;

import com.sudoku.entity.Story;
import com.sudoku.entity.User;

import java.io.IOException;

import java.util.List;

public interface StoryBiz {

    Story getStoryById(Integer id);

    List<Story> getStoryByUserId(Integer uid);

    List<Story> getAllStory();

//    List<Story> getRelatedStory(Integer id);

    void insertStory(Story story, User user, List list)throws IllegalStateException, IOException;

    void deleteStoryById(Integer sid);
}
