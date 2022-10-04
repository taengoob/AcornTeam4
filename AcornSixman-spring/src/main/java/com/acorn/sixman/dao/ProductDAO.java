package com.acorn.sixman.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.context.annotation.Primary;

import com.acorn.sixman.dto.ImageDTO;
import com.acorn.sixman.dto.ProductDTO_Temp;

@Primary
@Mapper
public interface ProductDAO {
    
    List<ProductDTO_Temp> selectProductByOption(HashMap<String, String> searchOption);

	ProductDTO_Temp selectProductByProductId(String productId);

	List<ImageDTO> selectImagesByProductId(String productId);

	int insertProduct(HashMap<String, Object> productData);

}
