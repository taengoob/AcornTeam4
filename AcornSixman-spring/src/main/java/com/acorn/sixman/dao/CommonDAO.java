package com.acorn.sixman.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.acorn.sixman.dto.CategoryDTO;
import com.acorn.sixman.dto.MemberDTO;

@Mapper
public interface CommonDAO {
    MemberDTO testLogin();

    List<String> testDBConnection();

    String selectDbTime();

    String getNewProductId();

    String getNewOrderId();

    String getNewCouponId();

    String getNewImageId();

    String getNewCartId();

    String getNewBoardContentId();

    String getNewBoardFileId();

    String getNewBoardReplyId();

    int uploadImageFile(HashMap<String, Object> map);

    List<CategoryDTO> selectCategories();

    List<CategoryDTO> selectCategoriesExceptAll();
}