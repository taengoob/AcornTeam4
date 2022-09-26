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
    public int insertOrderRequest() {
        return dao.insertOrderRequest();
    }

    @Override
    public List<OrderRequestDTO> selectOrderRequestList(String orderStatus) {
        return dao.selectOrderRequestList(orderStatus);
    }

    @Override
    public int UpdateOrderRequestStatus(String requestId, String status) {
        return dao.UpdateOrderRequestStatus(requestId, status);
    }

    @Override
    public int UpdateOrderStatus(String requestId, String status) {
        return dao.UpdateOrderStatus(requestId, status);
    }

    @Override
    public int InsertDeliveryRequest(String requestId) {
        return dao.InsertDeliveryRequest(requestId);
    }

}
