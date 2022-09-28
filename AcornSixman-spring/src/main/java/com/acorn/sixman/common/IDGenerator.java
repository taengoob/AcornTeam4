package com.acorn.sixman.common;

import org.springframework.beans.factory.annotation.Autowired;

import com.acorn.sixman.service.CommonService;

public class IDGenerator {
    @Autowired
    private static CommonService service;

    public static String getNewProductId() {
        return service.getNewProductId();
    }

    public static String getNewOrderId() {
        return service.getNewOrderId();
    }

    public static String getNewCouponId() {
        return service.getNewCouponId();
    }

    public static String getNewImageId() {
        return service.getNewImageId();
    }

    public static String getNewCartId() {
        return service.getNewCartId();
    }

    public static String getNewBoardContentId() {
        return service.getNewBoardContentId();
    }

    public static String getNewBoardFileId() {
        return service.getNewBoardFileId();
    }

    public static String getNewBoardReplyId() {
        return service.getNewBoardReplyId();
    }

    public static String getNewOrderRequestId(String orderId, OrderRequestType type) {
        return type.toString() + orderId;
    }
}
