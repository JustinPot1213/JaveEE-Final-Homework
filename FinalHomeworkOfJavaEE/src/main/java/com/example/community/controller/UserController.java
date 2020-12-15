package com.example.community.controller;

import com.example.community.domain.User;
import com.example.community.service.UserService;
import org.apache.cxf.transport.http.HTTPSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@SessionAttributes(value = "loginUser", types = {User.class})
public class UserController {

    @Autowired
    UserService userService;

    @RequestMapping("/my_information")
    public ModelAndView ShowMyInfo(@ModelAttribute("loginUser")User loginUser){
        ModelAndView mv = new ModelAndView();
        if (loginUser != null){
            mv.addObject("userName",loginUser.name);
            mv.addObject("blogsCount",userService.getBlogsCount(loginUser));
            mv.addObject("commentsCount",userService.getCommentsCount(loginUser));
            mv.setViewName("my_info");
        }
        else mv.setViewName("redirect:/login");
        return mv;
    }

    @RequestMapping("/login")
    public String ShowLogin(){
        return "login";
    }

    @RequestMapping("/register")
    public String ShowRegister(){
        return "register";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST, consumes = "application/x-www-form-urlencoded;charset=UTF-8")
    public ModelAndView checkLogin(@RequestParam(value="userName") String userName,
                                   @RequestParam(value="password") String password,
                                   RedirectAttributes redirectAttributes,
                                   Model model){
        String message = userService.login(userName, password);
        ModelAndView mv = new ModelAndView();
        if (message.equals("登陆成功")) {
            redirectAttributes.addFlashAttribute("message", message);
            User user = userService.getByName(userName);
            model.addAttribute("loginUser",user);
            mv.setViewName("redirect:/index");
        }
        else {
            mv.setViewName("login");
            mv.addObject("message", message);
        }
        return mv;
    };

    @RequestMapping(value = "/register", method = RequestMethod.POST, consumes = "application/x-www-form-urlencoded;charset=UTF-8")
    public ModelAndView Register(@RequestParam(value="userName") String userName,
                                 @RequestParam(value="password1") String password1,
                                 @RequestParam(value="password2") String password2,
                                 RedirectAttributes redirectAttributes){
        String message = userService.register(userName, password1, password2);
        ModelAndView mv = new ModelAndView();
        if (message.equals("注册成功")) {
            redirectAttributes.addFlashAttribute("message", message);
            mv.setViewName("redirect:/login");
        }
        else {
            mv.setViewName("register");
            mv.addObject("message", message);
        }
        return mv;
    };

    @ModelAttribute("loginUser")
    public User getUser() {
        return null;
    };

}
