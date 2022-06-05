package com.controller;

import com.entity.Likes;
import com.entity.News;
import com.entity.NewsList;
import com.entity.User;
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

    @RequestMapping(value = "/querylist", method = RequestMethod.POST)
    @ResponseBody
    public NewsList queryNewsList(int currentPage) {
        int currentIndex = (currentPage - 1) * 10;
        List<News> list = newsMapper.queryNewsList(currentIndex);

        for (int i = 0; i < list.size(); i++) {
            List<Likes> likesList = likesMapper.queryLikesList(list.get(i).getId());
            list.get(i).setLike(likesList.size());
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

            session.setAttribute("news", news);

            return "news";
        } catch (Exception e) {
            return "main";
        }

    }

    @RequestMapping(value = "/publish", method = RequestMethod.POST)
    @ResponseBody
    public boolean publishNews(News news) {
        try {
            newsMapper.insertNews(news);

            return true;
        } catch (Exception e) {
            return false;
        }
    }

    @RequestMapping(value = "/updateButton", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateButton(int id, HttpSession session) {
        try {
            News news = newsMapper.queryNews(id);
            if (news.getAuthor().trim().equals(((User) session.getAttribute("user")).getUsername())) {
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
            if (news.getAuthor().trim().equals(((User) session.getAttribute("user")).getUsername())) {
                newsMapper.deleteNews(id);
                return true;
            }
            return false;
        } catch (Exception e) {
            return false;
        }
    }

    @RequestMapping(value = "/clickLikes", method = RequestMethod.POST)
    @ResponseBody
    public boolean clickLikes(Likes likes) {
        Likes currentLikes = likesMapper.queryLikes(likes);
        if (currentLikes == null) {
            likesMapper.insertLike(likes);
            return true;
        } else {
            likesMapper.deleteSingleLike(likes);
            return false;
        }
    }
}
