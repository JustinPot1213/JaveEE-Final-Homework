package com.example.community.dao;

import com.example.community.domain.Record;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RecordMapper {

    List<Record> getByUserId(int userId);

    int addRecord(Record record); //返回插入记录条数
}
