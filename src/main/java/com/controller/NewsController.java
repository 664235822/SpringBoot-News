package com.controller;

import com.entity.News;
import com.entity.NewsList;
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

    @RequestMapping(value = "/querylist", method = RequestMethod.POST)
    @ResponseBody
    public NewsList queryNewsList() {
        List<News> list = newsMapper.queryNewsList();
        int total = list.size();

        NewsList newsList = new NewsList();
        newsList.setTotal(total);
        newsList.setList(list);

        return newsList;
    }

    @RequestMapping(value = "queryNews", method = RequestMethod.GET)
    public String queryNews(int id, HttpSession session) {
        try {
            News news = newsMapper.queryNews(id);
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
    public boolean updateButton(int id, String author, HttpSession session) {
        try {
            News news = newsMapper.queryNews(id);
            if (news.getAuthor().equals(author)) {
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
    public boolean deleteNews(int id, String author) {
        try {
            News news = newsMapper.queryNews(id);
            if (news.getAuthor().equals(author)) {
                newsMapper.deleteNews(id);
                return true;
            }
            return false;
        } catch (Exception e) {
            return false;
        }
    }
}
