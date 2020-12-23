package com.example.community.controller;

import com.example.community.domain.Comment;
import com.example.community.domain.Record;
import com.example.community.domain.User;
import com.example.community.service.RecordService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@SessionAttributes(value = {"loginUser","name", "author", "text", "detail"},
        types = {User.class, String.class, String.class, String.class, String.class})
public class RecordController {

    @Autowired
    RecordService recordService;

    @RequestMapping(value = "/record", method = RequestMethod.GET)
    public ModelAndView showRecords(
            @RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo,
            @ModelAttribute("loginUser")User loginUser){
        ModelAndView mv = new ModelAndView();
        if (loginUser != null){
            mv.setViewName("records");
            PageHelper.startPage(pageNo, 7);
            List<Record> myRecords = recordService.getMyRecords(loginUser);
            PageInfo<Record> pageInfo = new PageInfo<>(myRecords,2);

            List<Record> thisPageRecords = pageInfo.getList();
            mv.addObject("pageInfo",pageInfo);
            mv.addObject("thisPageRecords", thisPageRecords);
//            mv.addObject("my_records",myRecords);
        }
        else mv.setViewName("redirect:/login");
        return mv;
    }

    @ModelAttribute("name")
    public String getName() {
        return null;
    };

    @ModelAttribute("author")
    public String getAuthor() {
        return null;
    };

    @ModelAttribute("text")
    public String getText() {
        return null;
    };

    @ModelAttribute("detail")
    public String getDetail() {
        return null;
    };

    @ModelAttribute("loginUser")
    public User getUser() {
        return null;
    };
}
