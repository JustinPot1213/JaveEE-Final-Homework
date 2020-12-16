package com.example.community.dao;

import com.example.community.domain.Comment;
import com.example.community.domain.User;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserMapper {

    User getByName(String name);
//    String getPasswordByName(String name);
    User getById(int id);

    int addUser(User user); //返回插入记录条数

    int updatePassword(@Param("name")String name, @Param("newPassword")String newPassword);//同理

}
