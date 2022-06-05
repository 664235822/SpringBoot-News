package com.mapper;

import com.entity.Likes;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface LikesMapper {

    List<Likes> queryLikesList(int newsId);

    Likes queryLikes(Likes likes);

    void insertLike(Likes likes);

    void deleteSingleLike(Likes likes);

    void deleteLikeByNews(int newsId);
}
