package com.sudoku.biz;


import com.sudoku.entity.HouseResource;

public interface HouseResourceBiz {

    void add(HouseResource houseResource);

    void edit(HouseResource houseResource);

    void editPrice(Integer id);

    HouseResource getResourceById(Integer id);
}
