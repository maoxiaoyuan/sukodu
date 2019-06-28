package com.sudoku.dao;

import com.sudoku.entity.Favorites;
import com.sudoku.entity.Likes;
import org.springframework.stereotype.Component;

import java.util.List;

@Component("favoritesDao")
public interface FavoritesDao {

    int selectCoutById(Integer sid);

    List<Favorites> selectFavoritesByStoryId(Integer sid);

    List<Favorites> selectFavoritesByUserId(Integer uid);

    int selectByUserStory(Favorites favorites);

    void insertFavorites(Favorites favorites);

    void deleteFavorites(Favorites favorites);
}
