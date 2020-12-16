package com.example.community.service;

import com.example.community.dao.BlogMapper;
import com.example.community.dao.RecordMapper;
import com.example.community.domain.Blog;
import com.example.community.domain.Record;
import com.example.community.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RecordService {

    @Autowired
    RecordMapper recordMapper;
    @Autowired
    BlogMapper blogMapper;

    public List<Record> getMyRecords(User user){
        return recordMapper.getByUserId(user.id);
    };

    public void record(User user, int blogId){
        Blog blog = blogMapper.getById(blogId);
        Record record = new Record(user,blog);
        recordMapper.addRecord(record);
    }
}
