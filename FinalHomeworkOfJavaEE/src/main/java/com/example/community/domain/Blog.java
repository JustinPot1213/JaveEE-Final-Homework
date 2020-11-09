package com.example.community.domain;

import java.util.Date;

public class Blog {

    public String header;
    public String text;
    public User user;
    public Date date;
    public String time;


    public Blog(String header, String text, User user) {
        this.header = header;
        this.text = text;
        this.user = user;
        this.date = new Date();
        this.time = date.toString();
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
}
