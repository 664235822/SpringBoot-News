package com.entity;

import java.util.List;

public class NewsList {

    private int total;

    private List<News> list;

    private int currentPage;

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public List<News> getList() {
        return list;
    }

    public void setList(List<News> list) {
        this.list = list;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }
}
