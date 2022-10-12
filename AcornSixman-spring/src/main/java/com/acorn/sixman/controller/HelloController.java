package com.acorn.sixman.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.acorn.sixman.service.CommonService;

@Controller
public class HelloController {

    @Autowired
    CommonService service;

    @RequestMapping("/hello")
    public String SayHello(@RequestParam(name = "name", required = false, defaultValue = "World") String name,
            Model model) {
        List<String> list = service.testDBConnection();
        System.out.println(list);
        list.add(name);
        model.addAttribute("nameList", list);
        model.addAttribute("currentTime", service.selectDbTime());
        return "home";
    }

    @RequestMapping("/hello2")
    public String SayHello2(@RequestParam(name = "name", required = false, defaultValue = "World") String name,
            Model model) {
        List<String> list = new ArrayList<>();
        list.add(name);
        model.addAttribute("nameList", list);
        return "home";
    }

    @RequestMapping("/imageUploadFormTest")
    public String imageUploadForm() {
        return "/imageTest/imageUploadFormTest";
    }

    @RequestMapping(value = "/imageUploadTest", method = RequestMethod.POST)
    public String uploadFile(@RequestParam Map<String, Object> map, @RequestParam("file") MultipartFile file,
            @RequestParam("files") List<MultipartFile> files)
            throws IOException {
        // System.out.println(map);
        // System.out.println(file);
        return "redirect:hello";
    }
}