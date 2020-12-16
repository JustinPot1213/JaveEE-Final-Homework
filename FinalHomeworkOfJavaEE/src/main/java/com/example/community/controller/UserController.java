package com.example.community.controller;

import com.example.community.domain.User;
import com.example.community.service.UserService;
import org.apache.cxf.transport.http.HTTPSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.net.http.HttpRequest;

@Controller
@SessionAttributes(value = {"loginUser","name", "author", "text", "detail"},
        types = {User.class, String.class, String.class, String.class, String.class})
public class UserController {

    @Autowired
    UserService userService;

    @RequestMapping("/logout")
    public String logout(SessionStatus sessionStatus){
        sessionStatus.setComplete();
        return "redirect:/login";
    }

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
            redirectAttributes.addFlashAttribute("successMessage", "登陆成功");
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

    @RequestMapping(value = "edit_password" , method = RequestMethod.POST, consumes = "application/x-www-form-urlencoded;charset=UTF-8")
    public ModelAndView changePassword(
            @RequestParam(value="oldPassword") String oldPassword,
            @RequestParam(value="password1") String password1,
            @RequestParam(value="password2") String password2,
            RedirectAttributes redirectAttributes,
            @ModelAttribute("loginUser")User loginUser){

        ModelAndView mv = new ModelAndView();

        if (loginUser != null) {
            String message = userService.changePassword(oldPassword,password1,password2, loginUser.name);
            if (message.equals("修改成功")) {
                redirectAttributes.addFlashAttribute("message", message);
                mv.setViewName("redirect:/my_information");
            }
            else {
                mv.setViewName("edit_password");
                mv.addObject("message", message);
            }
        }
        else mv.setViewName("redirect:/login");
        return mv;

    }

    @RequestMapping("/edit_password")
    public String ShowChangePassword(@ModelAttribute("loginUser")User loginUser){
        if (loginUser != null){
            return "edit_password";
        }
        else return "redirect:/login";
    }

    @ModelAttribute("loginUser")
    public User getUser() {
        return null;
    };

    @RequestMapping("/about_me")
    public String showProgrammer(){ return "about_me"; }

}
