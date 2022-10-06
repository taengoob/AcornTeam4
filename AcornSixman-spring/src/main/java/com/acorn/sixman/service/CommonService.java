package com.acorn.sixman.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import com.acorn.sixman.dao.CommonDAO;
import com.acorn.sixman.dto.CategoryDTO;
import com.acorn.sixman.dto.MemberDTO;

@Primary
@Service
public class CommonService implements CommonDAO {

    @Autowired
    CommonDAO dao;

    public MemberDTO testLogin() {
        return dao.testLogin();
    }

    @Override
    public List<String> testDBConnection() {
        return dao.testDBConnection();
    }

    @Override
    public String selectDbTime() {
        return dao.selectDbTime();
    }

    @Override
    public String getNewProductId() {
        return dao.getNewProductId();
    }

    @Override
    public String getNewOrderId() {
        return dao.getNewOrderId();
    }

    @Override
    public String getNewCouponId() {
        return dao.getNewCouponId();
    }

    @Override
    public String getNewImageId() {
        return dao.getNewImageId();
    }

    @Override
    public String getNewCartId() {
        return dao.getNewCartId();
    }

    @Override
    public String getNewBoardContentId() {
        System.out.println("게시글 번호 생성 : "+dao);
        return dao.getNewBoardContentId();
    }

    @Override
    public String getNewBoardFileId() {
        return dao.getNewBoardFileId();
    }

    @Override
    public String getNewBoardReplyId() {
        return dao.getNewBoardReplyId();
    }

    @Override
    public int uploadImageFile(HashMap<String, Object> map) {
        return dao.uploadImageFile(map);
    }

    @Override
    public List<CategoryDTO> selectCategories() {
        return dao.selectCategories();
    }

    @Override
    public List<CategoryDTO> selectCategoriesExceptAll() {
        return dao.selectCategoriesExceptAll();
    }

}