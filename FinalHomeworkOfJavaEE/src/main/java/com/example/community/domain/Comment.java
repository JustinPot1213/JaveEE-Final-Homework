package com.example.community.domain;

import java.util.Date;

public class Comment {

    public String text;
    public User user;
    public Date date;
    public String time;
    public Comment comment;


    public Comment(String text, User user, Comment comment) {
        this.text = text;
        this.user = user;
        this.comment = comment;
        this.date = new Date();
        this.time = date.toString();
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

    public Comment getComment() {
        return comment;
    }

    public void setComment(Comment comment) {
        this.comment = comment;
    }
}
