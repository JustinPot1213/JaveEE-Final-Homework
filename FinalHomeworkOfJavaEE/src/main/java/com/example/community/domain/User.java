package com.example.community.domain;

import java.util.List;

public class User {

    public int id;
    public String name;
    private String password;
    public List<Blog> blogs;
    public List<Comment> comments;

    public User(String name, String password) {
        this.name = name;
        this.password = password;
        blogs = null;
        comments = null;
    }

    public User(int id, String name, String password, List<Blog> blogs, List<Comment> comments) {
        this.id = id;
        this.name = name;
        this.password = password;
        this.blogs = blogs;
        this.comments = comments;
    }

    public User(int id, String name, String password) {
        this.id = id;
        this.name = name;
        this.password = password;
        blogs = null;
        comments = null;
    }

    public User() {
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public List<Blog> getBlogs() {
        return blogs;
    }

    public void setBlogs(List<Blog> blogs) {
        this.blogs = blogs;
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
