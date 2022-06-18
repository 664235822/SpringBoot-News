package com.mapper;

import com.entity.Comment;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CommentsMapper {

    List<Comment> queryCommentList(int newsId);

    List<Comment> queryCommentListLimit(int newsId, int currentIndex);

    Comment queryComment(int Id);

    void insertComment(Comment comment);

    void deleteCommentById(int id);

    void deleteCommentByNews(int newsId);
}
