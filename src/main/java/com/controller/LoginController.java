package com.controller;

import com.entity.User;
import com.mapper.UsersMapper;
import org.springframework.boot.web.servlet.server.Session;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import javax.annotation.Resource;
import java.util.Objects;

@Controller
public class LoginController {

    @Resource
    private UsersMapper usersMapper;

    @RequestMapping(value = "/user/login", method = RequestMethod.POST)
    @ResponseBody
    public boolean Login(User user, @SessionAttribute("check_code") String check_code) {
        if (usersMapper.queryUser(user) != null && user.getCheck_code().equalsIgnoreCase(check_code)) {
            return true;
        }

        return false;
    }

    @RequestMapping(value = "/user/register", method = RequestMethod.POST)
    @ResponseBody
    public boolean Register(User user) {
        usersMapper.addUser(user);

        return true;
    }
}
