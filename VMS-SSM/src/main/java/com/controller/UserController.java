package com.controller;

import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpServletRequest;

/**
 * 用户登录控制类
 * @author hzf 2021/12/11
 */
@Controller
@SessionAttributes({"user"})
public class UserController {

    @Autowired
    private UserService userService;



    @RequestMapping( "/UserLogin")

    public String login(@RequestParam("username") String username,
                        @RequestParam("password") String password,
                        @RequestParam("usertype") int usertype, Model model){
        boolean result= userService.login(username, password,usertype);
        if(result){
            model.addAttribute("user",username);
            return "redirect:/Surveyor/index";
        }else{
            model.addAttribute("loginFailTip","用户名或密码错误!");
            return "forward:/login.jsp";
        }
    }



}
