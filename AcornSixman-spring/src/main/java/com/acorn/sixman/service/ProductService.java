package com.acorn.sixman.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acorn.sixman.dao.ProductDAO;
import com.acorn.sixman.dto.ImageDTO;
import com.acorn.sixman.dto.ProductDTO_Temp;

@Service
public class ProductService implements ProductDAO {
    
    @Autowired
    ProductDAO dao;

    @Override
    public List<ProductDTO_Temp> selectProductByOption(HashMap<String, String> searchOption) {
        return dao.selectProductByOption(searchOption);
    }

    @Override
    public ProductDTO_Temp selectProductByProductId(String productId) {
        return dao.selectProductByProductId(productId);
    }

    @Override
    public List<ImageDTO> selectImagesByProductId(String productId) {
        return dao.selectImagesByProductId(productId);
    }

    @Override
    public int insertProduct(HashMap<String, Object> productData) {
        return dao.insertProduct(productData);
    }

}
