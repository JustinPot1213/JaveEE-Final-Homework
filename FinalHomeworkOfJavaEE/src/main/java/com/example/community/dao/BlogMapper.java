package com.example.community.dao;

import com.example.community.domain.Blog;

import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BlogMapper {

    List<Blog> getByUserName(String userName);
    List<Blog> getByUserId(int userId);
    Blog getById(int id);

    int addBlog(Blog blog);//返回插入记录条数

}
