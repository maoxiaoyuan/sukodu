package com.sudoku.dao;

import com.sudoku.entity.Story;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;

@Component("storyDao")
public interface StoryDao {

    Story selectStoryById(Integer id);

    List<Story> selectStoryByUserId(Integer uid);

    List<Story> selectAllStory();

    void insertStory(Story story);

    void deleteStoryById(Integer sid);
}
