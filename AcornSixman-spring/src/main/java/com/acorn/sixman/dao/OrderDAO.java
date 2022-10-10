package com.acorn.sixman.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.acorn.sixman.dto.OrderDTO;
import com.acorn.sixman.dto.PayMethodDTO;

@Mapper
public interface OrderDAO {

    int insertOrder(OrderDTO order);

    int deleteCart(String cartId);

    List<OrderDTO> selectOrderByUserId(String userId);

    List<PayMethodDTO> selectPayMethodList();

    String selectPayMethodIdByDesc(String payMethodDesc);

    OrderDTO selectOrderByOrderId(String orderId);

    // List<ProcessListDTO> processList(String sellerId);
}
