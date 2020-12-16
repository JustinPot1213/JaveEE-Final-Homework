package com.example.community.controller;

import com.example.community.domain.Blog;
import com.example.community.domain.Comment;
import com.example.community.domain.User;
import com.example.community.service.BlogService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.awt.print.PrinterGraphics;
import java.util.List;

@Controller
@SessionAttributes(value = {"loginUser","name", "author", "text", "detail"},
        types = {User.class, String.class, String.class, String.class, String.class})
public class BlogController {

    @Autowired
    BlogService blogService;

    @RequestMapping("")
    public String redirect(){
        return "redirect:/index";
    };

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public ModelAndView InitIndex(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo,
                                  @ModelAttribute("name") String name,
                                  @ModelAttribute("author") String author,
                                  @ModelAttribute("text") String text,
                                  @ModelAttribute("loginUser")User loginUser){
        ModelAndView mv = new ModelAndView();

        List<Blog> blogs;
        if (name == null) { //随便一个为null即为需要初始化
            PageHelper.startPage(pageNo, 10);
            blogs = blogService.getAllBlogs(); //查询全部数据
        }
        else {
            PageHelper.startPage(pageNo, 10);
            blogs = blogService.queryByConditions(name, author, text);
        }
        PageInfo<Blog> pageInfo = new PageInfo<>(blogs,5);

        List<Blog> thisPageBlogs = pageInfo.getList();
//        List<Blog> favorites = blogService.getMyFavorites(loginUser.id);
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("thisPageBlogs", thisPageBlogs);
//        mv.addObject("favorites", favorites);
        mv.setViewName("index");
        return mv;

    };


    @RequestMapping(value = "/index", method = RequestMethod.POST)
    public ModelAndView ShowResults(
            @RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo,
            @RequestParam(value = "blog_text") String text,
            @RequestParam(value = "blog_author") String author,
            @RequestParam(value = "blog_name") String name,
            ModelMap map,
            @ModelAttribute("loginUser")User loginUser){
        ModelAndView mv = new ModelAndView();
        List<Blog> blogs;

        if ( (text.equals("")&&author.equals("")&&name.equals("")) ) {
            PageHelper.startPage(pageNo, 10);
            blogs = blogService.getAllBlogs(); //查询全部数据
        }
        else {
            PageHelper.startPage(pageNo, 10);
            blogs = blogService.queryByConditions(name, author, text);
        }
        PageInfo<Blog> pageInfo = new PageInfo<>(blogs,5);

        List<Blog> thisPageBlogs = pageInfo.getList();
//        List<Blog> favorites = blogService.getMyFavorites(loginUser.id);
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("thisPageBlogs", thisPageBlogs);
//        mv.addObject("favorites", favorites);
        mv.setViewName("index");
        map.addAttribute("name", name);
        map.addAttribute("author", author);
        map.addAttribute("text", text);
        return mv;
    };

//    @RequestMapping("/write_blog")
//    public String ShowWriteBlog(){
//        return "write_blog";
//    };

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

    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    public  ModelAndView showDetailedBlog(
            @RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo,
            @RequestParam(value = "detail_id",defaultValue = "0") String detailId,
            @ModelAttribute("loginUser")User loginUser,
            @ModelAttribute("detail")String detail,
            Model model) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("detail");
        Blog thisBlog;
        int intId = Integer.parseInt(detailId);
        if (intId != 0){
            thisBlog = blogService.getById(Integer.parseInt(detailId));
            detail = detailId;
            model.addAttribute("detail",detailId);
        }
        else {
            thisBlog = blogService.getById(Integer.parseInt(detail));
        }

        PageHelper.startPage(pageNo, 4);
        List<Comment> itsComments = blogService.getItsCommentsById(Integer.parseInt(detail));
        PageInfo<Comment> pageInfo = new PageInfo<>(itsComments,3);

        List<Comment> thisPageComments = pageInfo.getList();
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("thisPageComments", thisPageComments);
        mv.addObject("thisBlog", thisBlog);
        return mv;
    };

    @RequestMapping("my_blogs")
    public ModelAndView showMyBlogs(
            @RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo,
            @ModelAttribute("loginUser") User loginUser){
        ModelAndView mv = new ModelAndView();

        if (loginUser != null) {
            PageHelper.startPage(pageNo, 10);
            List<Blog> myBlogs = blogService.getMyBlogs(loginUser);

            PageInfo<Blog> pageInfo = new PageInfo<>(myBlogs, 5);

            List<Blog> thisPageBlogs = pageInfo.getList();
            mv.addObject("pageInfo", pageInfo);
            mv.addObject("thisPageBlogs", thisPageBlogs);
            mv.setViewName("my_blogs");
        }
        else mv.setViewName("redirect:/login");
        return mv;

    };

    @RequestMapping(value = "write_blog", method = RequestMethod.GET)
    public ModelAndView showWriteBlog(@ModelAttribute("loginUser") User loginUser){

        ModelAndView mv = new ModelAndView();

        if (loginUser != null){
            mv.setViewName("write_blog");
        }
        else mv.setViewName("redirect:/login");
        return mv;
    }

    @RequestMapping(value = "write_blog", method = RequestMethod.POST)
    public ModelAndView addBlog(
            @ModelAttribute("loginUser") User loginUser,
            @RequestParam(value = "text") String text,
            @RequestParam(value = "header") String header){
        ModelAndView mv = new ModelAndView();
        if (loginUser != null){
            blogService.writeBlog(loginUser.name,header,text);
            mv.setViewName("redirect:/index");
        }
        else mv.setViewName("redirect:/login");
        return mv;
    }
}
