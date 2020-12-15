package com.example.community.dao;

import com.example.community.domain.Blog;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BlogMapper {

    List<Blog> getByUserName(String userName);
    List<Blog> getByUserId(int userId);
    Blog getById(int id);
    List<Blog> getAll();
    List<Blog> query(@Param("name")String name, @Param("author")String author, @Param("text")String text);
    List<Blog> getFavorites(int userId);

    int addBlog(Blog blog);//返回插入记录条数
    int addStar(@Param("userId")int userId, @Param("blogId")int blogId);
    int removeStar(@Param("userId")int userId, @Param("blogId")int blogId);

}
