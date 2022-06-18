package com.mapper;

import com.entity.News;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface NewsMapper {

    List<News> queryNewsList(int currentIndex);

    News queryNews(int id);

    void insertNews(News news);

    void updateNews(News news);

    void deleteNews(int id);
}
