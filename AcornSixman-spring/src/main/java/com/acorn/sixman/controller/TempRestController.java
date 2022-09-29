package com.acorn.sixman.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TempRestController {
    
    private List<String> roomList = new ArrayList<>();

    @RequestMapping("/test")
    public Map<String, Object> test(@RequestParam(name = "roomId", required = true, defaultValue = "") String roomId)
    {
        if (roomId.equals("") == false)
            roomList.add(roomId);
        Map<String, Object> map = new HashMap<>();
        map.put("roomList", roomList);
        return map;
    }

}
