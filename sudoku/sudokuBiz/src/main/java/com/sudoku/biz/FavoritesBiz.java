package com.sudoku.biz;

import com.sudoku.entity.Favorites;
import com.sudoku.entity.Likes;
import com.sudoku.entity.Story;
import com.sudoku.entity.User;

import java.util.List;

public interface FavoritesBiz {
    int getCoutById(Integer sid);
    List<Favorites> getFavoritesByStoryId(Integer sid);
    List<Favorites> getFavoritesByUserId(Integer uid);
    int getByUserStory(Integer sid, User user);
    void insertFavorites(Integer sid, User user);
    void deleteFavorites(Integer sid, User user);
}
