package com.sudoku.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
//详情：故事详情
public class StoryDetail {

    private Integer sdid;           //ID编码

    private Story story;            //故事

    private Integer likeNum;        //该故事点赞的人数

    private Integer favoriteNum;    //收藏该故事的人数

    private Integer commentNum;     //评论该故事的人数

}
