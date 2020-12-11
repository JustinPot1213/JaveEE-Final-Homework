package com.example.community.domain;

import java.util.Date;

public class Comment {

    public int id;
    public String text;
    public User user;
    public Date date;
    public String time;
    public Comment toComment;
    public Blog blog;

    public Comment(int id, String text, User user, Comment comment) {
        this.id = id;
        this.text = text;
        this.user = user;
        this.toComment = comment;
        this.date = new Date();
        this.time = date.toString();
    }

    public Comment(int id, String text, User user, Date date, String time, Comment toComment, Blog blog) {
        this.id = id;
        this.text = text;
        this.user = user;
        this.date = date;
        this.time = time;
        this.toComment = toComment;
        this.blog = blog;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public Comment getToComment() {
        return toComment;
    }

    public void setToComment(Comment toComment) {
        this.toComment = toComment;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Blog getBlog() {
        return blog;
    }

    public void setBlog(Blog blog) {
        this.blog = blog;
    }
}
