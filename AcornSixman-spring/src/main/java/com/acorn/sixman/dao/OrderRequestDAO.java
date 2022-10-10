package com.acorn.sixman.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.acorn.sixman.dto.OrderRequestDTO;

@Mapper
public interface OrderRequestDAO {

    int insertOrderRequest(OrderRequestDTO orderRequst);

    List<OrderRequestDTO> selectOrderRequestList(String orderStatus);

    int updateOrderRequestStatus(String requestId, String status);

    int updateOrderStatus(String requestId, String status);

    int insertDeliveryRequest(String requestId);
}
