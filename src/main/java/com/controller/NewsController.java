package com.controller;

import com.entity.*;
import com.mapper.CommentsMapper;
import com.mapper.LikesMapper;
import com.mapper.NewsMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping(value = "/news")
public class NewsController {

    @Resource
    private NewsMapper newsMapper;

    @Resource
    private LikesMapper likesMapper;

    @Resource
    private CommentsMapper commentsMapper;

    @RequestMapping(value = "/queryNewsList", method = RequestMethod.POST)
    @ResponseBody
    public NewsList queryNewsList(int currentPage) {
        int currentIndex = (currentPage - 1) * 10;
        List<News> list = newsMapper.queryNewsList(currentIndex);

        for (int i = 0; i < list.size(); i++) {
            List<Likes> likesList = likesMapper.queryLikesList(list.get(i).getId());
            list.get(i).setLike(likesList.size());

            List<Comment> commentList = commentsMapper.queryCommentList(list.get(i).getId());
            list.get(i).setComments(commentList.size());
        }

        int total = list.size();
        NewsList newsList = new NewsList();
        newsList.setTotal(total);
        newsList.setList(list);
        newsList.setCurrentPage(currentPage);

        return newsList;
    }

    @RequestMapping(value = "queryNews", method = RequestMethod.GET)
    public String queryNews(int id, HttpSession session) {
        try {
            News news = newsMapper.queryNews(id);
            List<Likes> likesList = likesMapper.queryLikesList(news.getId());
            news.setLike(likesList.size());
            List<Comment> commentList = commentsMapper.queryCommentList(news.getId());
            news.setComments(commentList.size());

            session.setAttribute("news", news);

            return "news";
        } catch (Exception e) {
            return "main";
        }

    }

    @RequestMapping(value = "/publish", method = RequestMethod.POST)
    @ResponseBody
    public boolean publishNews(News news, HttpSession session) {
        try {
            if (session.getAttribute("user") != null) {
                newsMapper.insertNews(news);

                return true;
            }
            return false;
        } catch (Exception e) {
            return false;
        }
    }

    @RequestMapping(value = "/updateButton", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateButton(int id, HttpSession session) {
        try {
            News news = newsMapper.queryNews(id);
            if (news.getUsername().trim().equals(((User) session.getAttribute("user")).getUsername())) {
                session.setAttribute("news", news);
                return true;
            }
            return false;
        } catch (Exception e) {
            return false;
        }
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateNews(News news) {
        try {
            newsMapper.updateNews(news);

            return true;
        } catch (Exception e) {
            return false;
        }
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public boolean deleteNews(int id, HttpSession session) {
        try {
            News news = newsMapper.queryNews(id);
            if (news.getUsername().trim().equals(((User) session.getAttribute("user")).getUsername())) {
                newsMapper.deleteNews(id);
                likesMapper.deleteLikeByNews(id);
                commentsMapper.deleteCommentByNews(id);
                return true;
            }
            return false;
        } catch (Exception e) {
            return false;
        }
    }

    @RequestMapping(value = "/clickLikes", method = RequestMethod.POST)
    @ResponseBody
    public boolean clickLikes(Likes likes, HttpSession session) {
        if (session.getAttribute("user") != null) {
            Likes currentLikes = likesMapper.queryLikes(likes);
            if (currentLikes == null) {
                likesMapper.insertLike(likes);
            } else {
                likesMapper.deleteSingleLike(likes);
            }

            return true;
        }
        return false;
    }
}
