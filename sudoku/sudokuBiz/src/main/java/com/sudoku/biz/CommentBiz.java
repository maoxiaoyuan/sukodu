package com.sudoku.biz;

import com.sudoku.entity.Comment;
import com.sudoku.entity.Story;
import com.sudoku.entity.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

public interface CommentBiz {
        int getCoutById(Integer sid);
        List<Comment> getCommentByStoryId(Integer sid);

        void insertComment(Comment comment, Integer sid, User user);
        void deleteComment(Story story, User user);
}
