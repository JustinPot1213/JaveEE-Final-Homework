package com.example.community.service;

import com.example.community.dao.BlogMapper;
import com.example.community.dao.UserMapper;
import com.example.community.domain.Blog;
import com.example.community.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BlogService {

    @Autowired
    private BlogMapper blogMapper;
    @Autowired
    private UserMapper userMapper;

    public void writeBlog(String userName, String header, String text){
        User user = userMapper.getByName(userName);
        Blog newBlog = new Blog(header, text, user, null);
        blogMapper.addBlog(newBlog);
    };

}
