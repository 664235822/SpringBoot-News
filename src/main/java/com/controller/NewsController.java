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
public class NewsController {

    @Resource
    private NewsMapper newsMapper;

    @RequestMapping(value = "/news/querylist", method = RequestMethod.POST)
    @ResponseBody
    public NewsList queryNewsList() {
        List<News> list = newsMapper.queryNewsList();
        int total = list.size();

        NewsList newsList = new NewsList();
        newsList.setTotal(total);
        newsList.setList(list);

        return newsList;
    }

    @RequestMapping(value = "/news/publish", method = RequestMethod.POST)
    @ResponseBody
    public boolean publishNews(News news) {
        try {
            newsMapper.insertNews(news);

            return true;
        } catch (Exception e) {
            return false;
        }
    }

    @RequestMapping(value = "/news/updateButton", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateButton(int id, HttpSession session) {
        try {
            News news = newsMapper.queryNews(id);
            session.setAttribute("news", news);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    @RequestMapping(value = "/news/update", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateNews(News news) {
        try {
            newsMapper.updateNews(news);

            return true;
        } catch (Exception e) {
            return false;
        }
    }

    @RequestMapping(value = "/news/delete", method = RequestMethod.POST)
    @ResponseBody
    public boolean deleteNews(int id) {
        try {
            newsMapper.deleteNews(id);

            return true;
        } catch (Exception e) {
            return false;
        }
    }
}
