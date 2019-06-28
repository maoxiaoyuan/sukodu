package com.sudoku.dao;

import com.sudoku.entity.Comment;
import com.sudoku.entity.Favorites;
import com.sudoku.entity.Likes;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

@Component("commentDao")
public interface CommentDao {

    int selectCoutById(Integer sid);

    List<Comment> selectCommentByStoryId(Integer sid);

    void insertComment(Comment comment);

    void deleteComment(Comment comment);
}
