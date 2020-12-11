package com.example.community.dao;

import com.example.community.domain.Comment;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CommentMapper {

    List<Comment> getByUserName(String userName);
    List<Comment> getByUserId(int userId);
    List<Comment> getByBlogId(int blogId);
    Comment getById(int id);

    int insertComment(Comment comment);//返回插入记录条数
    int insertCommentIntoUC(Comment comment);//返回插入记录条数
    int insertCommentIntoBC(Comment comment);//返回插入记录条数

}
