package com.example.community.domain;

import java.util.Date;
import java.util.List;

public class Blog {

    public int id;
    public String header;
    public String text;
    public User user;
    public Date date;
    public String time;
    public List<Comment> comments;


    public Blog(int id, String header, String text, User user, Date date, String time, List<Comment> comments) {
        this.id = id;
        this.header = header;
        this.text = text;
        this.user = user;
        this.date = date;
        this.time = time;
        this.comments = comments;
    }

    public Blog(String header, String text, User user, List<Comment> comments) {
        this.header = header;
        this.text = text;
        this.user = user;
        this.comments = comments;
        this.date = new Date();
        this.time = date.toString();
    }

    public Blog(int id, String header, String text, User user, String time) {
        this.id = id;
        this.header = header;
        this.text = text;
        this.user = user;
        this.time = time;
    }

    public Blog() {
    }

    public String getHeader() {
        return header;
    }

    public void setHeader(String header) {
        this.header = header;
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

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

}
