package com.sudoku.biz;

import com.sudoku.entity.StoryDetail;
import com.sudoku.entity.User;
import java.util.List;

public interface StoryDetailBiz {

    StoryDetail getStoryDetailByStoryId(Integer sid);

    List<StoryDetail> getAllStoryDetail();

    List<StoryDetail> getStoryDetailTop();

    List<StoryDetail> getRelatedStoryDetail(Integer sid);

    void insertStoryDetail(Integer sid, User user);

    void updateStoryDetailinsert(Integer sid, User user, char f);

    void updateStoryDetaildelete(Integer sid, User user, char f);

    void deleteStoryDetail(Integer sid);
}
