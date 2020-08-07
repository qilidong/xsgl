package com.at.controller;

import com.at.pojo.AjaxResult;
import com.at.pojo.SysUsers;
import com.at.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * @author qld
 * @projectName xsgl
 * @description: 用于跳转页面的
 * @date 2020/6/2414:31
 */
@Controller
public class DispatcherController {

    @Autowired
    private SysUserService sysUserService;

    @RequestMapping("/login")
    public String login() {
        return "login";
    }

    @RequestMapping("/doLogin")
    public String doLogin(SysUsers sysUsers, Model model) {
        //根据入参查询数据库查询用户存不存在
        SysUsers user = sysUserService.getUser(sysUsers);
        //经行判断
        if (user != null) {
            return "main";
        } else {
            String errorMge = "用户名或者密码错误！";
            model.addAttribute("errorMge", errorMge);
            return "redirect:/login";
        }

    }

    @ResponseBody
    @RequestMapping("/doAjaxLogin")
    public Object doAjaxLogin(SysUsers sysUsers) {
        //根据入参查询数据库查询用户存不存在
        SysUsers user = sysUserService.getUser(sysUsers);
        AjaxResult result = new AjaxResult();
        //经行判断
        if (user != null) {
            result.setSuccess(true);
        } else {
            result.setSuccess(false);
        }
        return result;
    }

    @ResponseBody
    @RequestMapping("/json")
    public Object getJoson(Model model) {
        Map map = new HashMap();
        map.put("name", "admin");
        return map;
    }

    @RequestMapping("/main")
    public Object toMain(Model model) {
        return "main";
    }
}
