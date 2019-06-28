package com.sudoku.dao;


import com.sudoku.entity.HouseBasicInfo;

import com.sudoku.entity.StoryDetail;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

@Component("storyDetailDao")
public interface StoryDetailDao {

    StoryDetail selectStoryDetailByStoryId(Integer sid);

    List<StoryDetail> selectAllStoryDetail();

    List<StoryDetail> selectStoryDetailTop();

    List<StoryDetail> selectRelatedStoryDetail(@Param("sid") Integer sid, @Param("tourCity") String tourCity);

    List<StoryDetail> selectRelatedStoryDetailByHouse(@Param("sid") Integer sid, @Param("house") HouseBasicInfo house);

    void insertStoryDetail(StoryDetail storyDetail);

    void updateStoryDetail(StoryDetail storyDetail);

    void deleteStoryDetailByStoryId(Integer sid);
}
