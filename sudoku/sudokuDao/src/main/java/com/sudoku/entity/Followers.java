package com.sudoku.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class Followers {

    private Integer foid;       //关注的编号

    private User userFollow;    //关注者

    private User userFollower;  //被关注者


}
