package com.example.community.controller;

import com.example.community.domain.Blog;
import com.example.community.domain.User;
import com.example.community.service.BlogService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@SessionAttributes(value = {"name", "author", "text"}, types = {String.class, String.class, String.class})
public class BlogController {

    @Autowired
    BlogService blogService;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public ModelAndView InitIndex(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo,
                                  @ModelAttribute("name") String name,
                                  @ModelAttribute("author") String author,
                                  @ModelAttribute("text") String text,
                                  @ModelAttribute("loginUser")User loginUser){
        ModelAndView mv = new ModelAndView();

        List<Blog> blogs;
        if (name == null) { //随便一个为null即为需要初始化
            PageHelper.startPage(pageNo, 1);
            blogs = blogService.getAllBlogs(); //查询全部数据
        }
        else {
            PageHelper.startPage(pageNo, 1);
            blogs = blogService.queryByConditions(name, author, text);
        }
        PageInfo<Blog> pageInfo = new PageInfo<>(blogs,5);

        List<Blog> thisPageBlogs = pageInfo.getList();
        List<Blog> favorites = blogService.getMyFavorites(loginUser.id);
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("thisPageBlogs", thisPageBlogs);
        mv.addObject("favorites", favorites);
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
            PageHelper.startPage(pageNo, 1);
            blogs = blogService.getAllBlogs(); //查询全部数据
        }
        else {
            PageHelper.startPage(pageNo, 1);
            blogs = blogService.queryByConditions(name, author, text);
        }
        PageInfo<Blog> pageInfo = new PageInfo<>(blogs,5);

        List<Blog> thisPageBlogs = pageInfo.getList();
        List<Blog> favorites = blogService.getMyFavorites(loginUser.id);
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("thisPageBlogs", thisPageBlogs);
        mv.addObject("favorites", favorites);
        mv.setViewName("index");
        map.addAttribute("name", name);
        map.addAttribute("author", author);
        map.addAttribute("text", text);
        return mv;
    };

    @RequestMapping("/write_blog")
    public String ShoeWriteBlog(){
        return "write_blog";
    };

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


}
