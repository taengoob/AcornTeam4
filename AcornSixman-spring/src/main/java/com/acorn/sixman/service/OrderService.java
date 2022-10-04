package com.acorn.sixman.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acorn.sixman.dao.OrderDAO;
import com.acorn.sixman.dto.OrderDTO;
import com.acorn.sixman.dto.PayMethodDTO;

@Service
public class OrderService implements OrderDAO {

    @Autowired
    OrderDAO dao;

    @Override
    public int insertOrder(OrderDTO order) {
        return dao.insertOrder(order);
    }

    @Override
    public List<OrderDTO> selectOrderByUserId(String userId) {
        return dao.selectOrderByUserId(userId);
    }

    @Override
    public List<PayMethodDTO> selectPayMethodList() {
        return dao.selectPayMethodList();
    }

    @Override
    public String selectPayMethodIdByDesc(String payMethodDesc) {
        return dao.selectPayMethodIdByDesc(payMethodDesc);
    }

    @Override
    public OrderDTO selectOrderByOrderId(String orderId) {
        return dao.selectOrderByOrderId(orderId);
    }

}
