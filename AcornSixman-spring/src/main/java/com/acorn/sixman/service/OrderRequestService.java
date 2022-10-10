package com.acorn.sixman.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.acorn.sixman.dao.OrderRequestDAO;
import com.acorn.sixman.dto.OrderRequestDTO;

@Service
public class OrderRequestService implements OrderRequestDAO {
    @Autowired
    private OrderRequestDAO dao;

    @Override
    public int insertOrderRequest(OrderRequestDTO orderRequst) {
        return dao.insertOrderRequest(orderRequst);
    }

    @Override
    public List<OrderRequestDTO> selectOrderRequestList(String orderStatus) {
        return dao.selectOrderRequestList(orderStatus);
    }

    @Override
    public int updateOrderRequestStatus(String requestId, String status) {
        return dao.updateOrderRequestStatus(requestId, status);
    }

    @Override
    public int updateOrderStatus(String requestId, String status) {
        return dao.updateOrderStatus(requestId, status);
    }

    @Override
    public int insertDeliveryRequest(String requestId) {
        return dao.insertDeliveryRequest(requestId);
    }

}
