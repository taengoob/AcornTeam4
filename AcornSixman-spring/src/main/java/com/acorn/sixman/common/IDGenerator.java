package com.acorn.sixman.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.acorn.sixman.service.CommonService;

@Component
public class IDGenerator {
    @Autowired
    private CommonService service;

    public String getNewProductId() {
        return service.getNewProductId();
    }

    public String getNewOrderId() {
        return service.getNewOrderId();
    }

    public String getNewCouponId() {
        return service.getNewCouponId();
    }

    public String getNewImageId() {
        return service.getNewImageId();
    }

    public String getNewCartId() {
        return service.getNewCartId();
    }

    public String getNewBoardContentId() {
        return service.getNewBoardContentId();
    }

    public String getNewBoardFileId() {
        return service.getNewBoardFileId();
    }

    public String getNewBoardReplyId() {
        return service.getNewBoardReplyId();
    }

    public String getNewOrderRequestId(String orderId, OrderRequestType type) {
        return type.toString() + orderId;
    }
}
