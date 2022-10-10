package com.acorn.sixman.service;

import java.util.List;

//import org.springframework.transaction.support.TransactionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acorn.sixman.dao.OrderDAO;
import com.acorn.sixman.dao.ProductDAO;
import com.acorn.sixman.dto.OrderDTO;
import com.acorn.sixman.dto.PayMethodDTO;
import com.acorn.sixman.dto.ProductDTO_Temp;

@Service
public class OrderService implements OrderDAO {

    @Autowired
    OrderDAO dao;

    @Autowired
    ProductDAO pDao;

    // @Autowired
    // TransactionTemplate transaction;
    //
    // @Override
    // public int insertOrder(OrderDTO order) {
    // int result = 0;
    // try {
    // result = transaction.execute((status) -> dao.insertOrder(order));
    // } catch (Exception e) {
    // result = -1;
    // }
    // return result;
    // }

    @Override
    public int insertOrder(OrderDTO order) {
        return dao.insertOrder(order);
    }

    public int insertOrder(OrderDTO order, String cartId) {
        int result = insertOrder(order);
        if (result > 0)
            deleteCart(cartId);
        return result;
    }

    public int deleteCart(String cartId) {
        return dao.deleteCart(cartId);
    }

    @Override
    public List<OrderDTO> selectOrderByUserId(String userId) {
        List<OrderDTO> list = dao.selectOrderByUserId(userId);
        for (OrderDTO orderDTO : list) {
            ProductDTO_Temp product = pDao.selectProductByProductId(orderDTO.getOrderProductId());
            orderDTO.setProduct(product);
        }
        return list;
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
        OrderDTO order = dao.selectOrderByOrderId(orderId);
        ProductDTO_Temp product = pDao.selectProductByProductId(order.getOrderProductId());
        order.setProduct(product);
        return order;
    }

}
