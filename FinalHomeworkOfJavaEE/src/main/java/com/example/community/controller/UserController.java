package com.example.community.controller;

import com.example.community.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class UserController {

    @Autowired
    UserService userService;

    @RequestMapping("/my_information")
    public String ShowMyInfo(){
        return "my_info";
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
                                   RedirectAttributes redirectAttributes){
        String message = userService.login(userName, password);
        ModelAndView mv = new ModelAndView();
        if (message.equals("登陆成功")) {
            redirectAttributes.addFlashAttribute("message", message);
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

}
