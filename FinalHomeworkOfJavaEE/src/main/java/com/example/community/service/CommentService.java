package com.example.community.service;

import com.example.community.dao.BlogMapper;
import com.example.community.dao.CommentMapper;
import com.example.community.dao.UserMapper;
import com.example.community.domain.Blog;
import com.example.community.domain.Comment;
import com.example.community.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentService {

    @Autowired
    CommentMapper commentMapper;
    @Autowired
    UserMapper userMapper;
    @Autowired
    BlogMapper blogMapper;

    private void insert(Comment comment){
        commentMapper.insertComment(comment);
//        commentMapper.insertCommentIntoBC(comment);
//        commentMapper.insertCommentIntoUC(comment);
    };

    public void makeComment(String userName, int blogId, String text){
        User user = userMapper.getByName(userName);
        Blog blog = blogMapper.getById(blogId);
        Comment newComment = new Comment(text, user, null, blog);
        insert(newComment);

    };

    public void replyComment(String userName, int blogId, int toCommentId, String text){
        User user = userMapper.getByName(userName);
        Blog blog = blogMapper.getById(blogId);
        Comment toComment = commentMapper.getById(toCommentId);
        Comment newComment = new Comment(text, user, toComment, blog);
        insert(newComment);
    };

}
