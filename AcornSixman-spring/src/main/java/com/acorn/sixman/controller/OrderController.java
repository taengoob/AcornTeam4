package com.acorn.sixman.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.acorn.sixman.service.OrderService;

@Controller
public class OrderController {
    @Autowired
    OrderService service;

    @RequestMapping("/orderList")
    public String OrderList() {
        return "";
    }
}
