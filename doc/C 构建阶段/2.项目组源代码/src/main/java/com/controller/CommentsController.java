package com.controller;

import com.entity.Comment;
import com.entity.CommentList;
import com.entity.User;
import com.mapper.CommentsMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping(value = "/comments")
public class CommentsController {

    @Resource
    private CommentsMapper commentsMapper;

    @RequestMapping(value = "/queryCommentList", method = RequestMethod.POST)
    @ResponseBody
    public CommentList queryCommentList(int newsId, int currentPage) {
        int currentIndex = (currentPage - 1) * 10;
        List<Comment> list = commentsMapper.queryCommentListLimit(newsId, currentIndex);

        CommentList commentList = new CommentList();
        commentList.setList(list);
        commentList.setCurrentPage(currentPage);

        return commentList;
    }

    @RequestMapping(value = "/publish", method = RequestMethod.POST)
    @ResponseBody
    public boolean publishComment(Comment comment, HttpSession session) {
        try {
            if (session.getAttribute("user") != null) {
                commentsMapper.insertComment(comment);

                return true;
            }
            return false;
        } catch (Exception e) {
            return false;
        }
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public boolean deleteComments(int id, HttpSession session) {
        try {
            Comment comment = commentsMapper.queryComment(id);
            if (comment.getUsername().trim().equals(((User) session.getAttribute("user")).getUsername())) {
                commentsMapper.deleteCommentById(id);

                return true;
            }
            return false;
        } catch (Exception e) {
            return false;
        }
    }
}
