package me.lexik.webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
public class MainController {

    @RequestMapping
    public String main(@RequestParam(required = false, defaultValue = "GOD") String name,
                       Map<String, Object> model) {
        model.put("name", name);
        return "index";
    }
}
