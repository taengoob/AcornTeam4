package com.acorn.sixman.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.acorn.sixman.service.commonService;

@RestController
public class ChatController {

    @Autowired
    commonService service;

    @RequestMapping("/chat/addMessage")
    public String addMessage(@RequestParam(name = "name", required = false, defaultValue = "World") String name, Model model) {
        //db 작업



        return "{\"result\" : \"success\" }";
    }
}