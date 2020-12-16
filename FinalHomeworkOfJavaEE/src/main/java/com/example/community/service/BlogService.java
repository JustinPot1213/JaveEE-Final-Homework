package com.example.community.service;

import com.example.community.dao.BlogMapper;
import com.example.community.dao.CommentMapper;
import com.example.community.dao.UserMapper;
import com.example.community.domain.Blog;
import com.example.community.domain.Comment;
import com.example.community.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BlogService {

    @Autowired
    private BlogMapper blogMapper;
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private CommentMapper commentMapper;

    public void writeBlog(String userName, String header, String text){
        User user = userMapper.getByName(userName);
        Blog newBlog = new Blog(header, text, user, null);
        blogMapper.addBlog(newBlog);
    };

    public List<Blog> getAllBlogs(){
        return blogMapper.getAll();
    };

    public List<Blog> getMyFavorites(int userId){ return blogMapper.getFavorites(userId); };

    public void addFavorite(int userId, int blogId){ blogMapper.addStar(userId,blogId);}

    public void removeFavorite(int userId, int blogId){ blogMapper.removeStar(userId,blogId);}

    public List<Blog> queryByConditions(String name, String author, String text){
        return blogMapper.query(name, author, text);
    };

    public Blog getById(int blogId){
        return blogMapper.getById(blogId);
    };

    public List<Comment> getItsCommentsById(int blogId){
        return commentMapper.getByBlogId(blogId);
    };

    public List<Blog> getMyBlogs(User user){
        return blogMapper.getByUserId(user.id);
    };

}
