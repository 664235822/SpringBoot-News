package com.controller;

import com.entity.News;
import com.entity.NewsList;
import com.mapper.NewsMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class NewsController {

    @Resource
    private NewsMapper newsMapper;

    @RequestMapping(value = "/news/querylist", method = RequestMethod.POST)
    @ResponseBody
    public NewsList queryNewsList(){
        List<News> list=newsMapper.queryNewsList();
        int total=list.size();

        NewsList newsList=new NewsList();
        newsList.setTotal(total);
        newsList.setList(list);

        return newsList;
    }
}
