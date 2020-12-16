package com.example.community.domain;

import java.util.Date;

public class Record {
    public int id;
    public Date date;
    public User user;
    public Blog blog;

    public Record(int id, User user, Blog blog) {
        this.id = id;
        this.user = user;
        this.blog = blog;
    }

    public Record(User user, Blog blog) {
        this.user = user;
        this.blog = blog;
        this.date = new Date();
    }

    public Record() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Blog getBlog() {
        return blog;
    }

    public void setBlog(Blog blog) {
        this.blog = blog;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
