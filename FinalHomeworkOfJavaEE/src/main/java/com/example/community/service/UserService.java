package com.example.community.service;

import com.example.community.dao.BlogMapper;
import com.example.community.dao.CommentMapper;
import com.example.community.dao.UserMapper;
import com.example.community.domain.Comment;
import com.example.community.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import javax.print.CancelablePrintJob;

@Service
public class UserService {

    @Autowired
    UserMapper userMapper;

    @Autowired
    BlogMapper blogMapper;

    @Autowired
    CommentMapper commentMapper;

    public String register(String name, String password1, String password2){
        if (name.equals("")) return "请输入用户名";
        else if (password1.equals("")) return "请输入密码";
        else if (userMapper.getByName(name) != null) return "用户名已存在";
        else if (password1.equals(password2)) {
            String password = DigestUtils.md5DigestAsHex(password1.getBytes());
            User newUser = new User(name, password);
            userMapper.addUser(newUser);
            return "注册成功";
        }
        else return"两次输入密码不一致";
    };

    public String login(String name, String password){
        if (name.equals("")) return "请输入用户名";
        else if (password.equals("")) return "请输入密码";
        User user = userMapper.getByName(name);
        if (user == null) return "不存在该用户";
        else if (DigestUtils.md5DigestAsHex(password.getBytes()).equals(user.getPassword()))
            return "登陆成功";
        else return "密码错误";
    };

    public User getByName(String name){
        return userMapper.getByName(name);
    };

    public int getBlogsCount(User user){
        return blogMapper.getByUserId(user.id).size();
    }

    public int getCommentsCount(User user){
        return commentMapper.getByUserId(user.id).size();
    }

}
