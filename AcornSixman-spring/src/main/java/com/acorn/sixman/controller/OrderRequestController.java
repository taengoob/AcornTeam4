package com.acorn.sixman.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.acorn.sixman.common.OrderRequestType;
import com.acorn.sixman.dto.OrderRequestDTO;
import com.acorn.sixman.service.OrderRequestService;

@Controller
public class OrderRequestController {
    @Autowired
    OrderRequestService service;

    @RequestMapping("/paymentRequests")
    public String PaymentRequests(Model model) {
        List<OrderRequestDTO> orderRequestWPList = service.selectOrderRequestList("WP");
        List<OrderRequestDTO> orderRequestCPList = service.selectOrderRequestList("CP");

        model.addAttribute("orderRequestWPList", orderRequestWPList);
        model.addAttribute("orderRequestCPList", orderRequestCPList);

        return "/orderRequest/paymentRquestList";
    }

    @RequestMapping("/deliveryRequests")
    public String DeliveryRequests(Model model) {
        List<OrderRequestDTO> orderRequestPDList = service.selectOrderRequestList("PD");
        List<OrderRequestDTO> orderRequestBDList = service.selectOrderRequestList("BD");
        List<OrderRequestDTO> orderRequestCDList = service.selectOrderRequestList("CD");

        model.addAttribute("orderRequestPDList", orderRequestPDList);
        model.addAttribute("orderRequestBDList", orderRequestBDList);
        model.addAttribute("orderRequestCDList", orderRequestCDList);

        return "/orderRequest/deliveryRequestList";
    }

    @RequestMapping("/addDelivery")
    public String AddDeliveryRequest(@RequestParam(name = "requestId", required = true) String requestId, Model model) {
        service.InsertDeliveryRequest(requestId);
        service.UpdateOrderStatus(requestId, "PD");

        return "redirect:paymentRequests";
        // return "forward:paymentRequests";
    }

    @RequestMapping("/updateOrderRequest")
    public String UpdateOrderRequest(@RequestParam(name = "requestType", required = true) String requestType,
            @RequestParam(name = "requestId", required = true) String requestId,
            @RequestParam(name = "status", required = true) String status, Model model) {

        service.UpdateOrderRequestStatus(requestId, status);

        String nextPage = "paymentRequests";
        if (requestType.equals(OrderRequestType.PAYMENT.toString()))
            nextPage = "paymentRequests";
        else if (requestType.equals(OrderRequestType.DELIVERY.toString()))
            nextPage = "deliveryRequests";

        return "redirect:" + nextPage;
    }
}
