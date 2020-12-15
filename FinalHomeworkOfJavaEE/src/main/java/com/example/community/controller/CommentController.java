package com.example.community.controller;

import com.example.community.domain.Blog;
import com.example.community.domain.Comment;
import com.example.community.domain.User;
import com.example.community.service.BlogService;
import com.example.community.service.CommentService;
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
public class CommentController {

    @Autowired
    CommentService commentService;
    @Autowired
    BlogService blogService;

    @RequestMapping(value = "/detail", method = RequestMethod.POST)
    public ModelAndView makeComment(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo,
                                    @RequestParam(value = "toCommentId",defaultValue = "*") String toCommentId,
                                    @RequestParam(value = "commentText") String commentText,
                                    @ModelAttribute("loginUser") User loginUser,
                                    @ModelAttribute("detail")String detail){

        ModelAndView mv = new ModelAndView();

        if (loginUser != null) {
            mv.setViewName("detail");

            if (toCommentId.equals("*"))
                commentService.makeComment(loginUser.name, Integer.parseInt(detail), commentText);
            else
                commentService.replyComment(loginUser.name, Integer.parseInt(detail), Integer.parseInt(toCommentId), commentText);
            Blog thisBlog = blogService.getById(Integer.parseInt(detail));

            PageHelper.startPage(pageNo, 4);
            List<Comment> itsComments = blogService.getItsCommentsById(Integer.parseInt(detail));
            PageInfo<Comment> pageInfo = new PageInfo<>(itsComments, 3);

            List<Comment> thisPageComments = pageInfo.getList();
            mv.addObject("pageInfo", pageInfo);
            mv.addObject("thisPageComments", thisPageComments);
            mv.addObject("thisBlog", thisBlog);
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
