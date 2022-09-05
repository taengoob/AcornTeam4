package com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.dto.ImageDTO;
import com.dto.ProductDTO_Temp;
import com.dto.ProductPageDTO;

public class ProductDAO
{

	public List<ProductDTO_Temp> selectProductByOption(SqlSession session, HashMap<String, String> searchOption)
	{
		return session.selectList("com.mapper.product.selectProductByOption", searchOption);
	}

	public ProductDTO_Temp selectProductByProductId(SqlSession session, String productId)
	{
		return session.selectOne("com.mapper.product.selectProductByProductId", productId);
	}

	public List<ImageDTO> selectImagesByProductId(SqlSession session, String productId)
	{
		return session.selectList("com.mapper.product.selectImagesByProductId", productId);
	}

	public int insertProduct(SqlSession session, HashMap<String, Object> productData)
	{
		return session.insert("com.mapper.product.insertProduct", productData);
	}

	public List<ProductDTO_Temp> goodsRetrieve(SqlSession session, String category) {
		List<ProductDTO_Temp> list = null;
		list = session.selectList("com.mapper.product.goodsRetrieve",category);
		return list;
	}

	public List<ProductDTO_Temp> selectProductBySellerId(SqlSession session, String sellerId)
	{
		return session.selectList("com.mapper.product.selectProductBySellerId", sellerId);
	}
	
	public int totalCount(SqlSession session,HashMap<String, String> map) {
		return session.selectOne("com.mapper.product.totalCount",map);
	}
	
	public ProductPageDTO select(SqlSession session, HashMap<String, String> map, int curPage) {
		ProductPageDTO pDTO = new ProductPageDTO();
		int perPage = pDTO.getPerPage();   //한페이지 2개씩 
		int offset = (curPage - 1) * perPage;
		
		List<ProductDTO_Temp> list =  session.selectList("com.mapper.product.selectProductAll", map, new RowBounds(offset, perPage));
		
		pDTO.setCurPage(curPage);//현재 페이지번호
		pDTO.setList(list);//페이지 에 해당 데이터
		pDTO.setTotalCount(totalCount(session,map));//전체 레코드 갯수 저장 
		
		return pDTO;
	}
	public int delete(SqlSession session, String ProductId) {
		
		int n = session.delete("com.mapper.product.deleteByProductid", ProductId);
		return n;
	}
public int deleteAll(SqlSession session, List<String> list) {
		
		int n = session.delete("com.mapper.product.deleteByAllProdId", list);
		return n;
	}

public ProductPageDTO select1(SqlSession session, HashMap<String, String> map, int curPage) {
	ProductPageDTO pDTO = new ProductPageDTO();
	int perPage = pDTO.getPerPage();   //한페이지 2개씩 
	int offset = (curPage - 1) * perPage;
	
	List<ProductDTO_Temp> list =  session.selectList("com.mapper.product.searchSelect", map, new RowBounds(offset, perPage));
	
	pDTO.setCurPage(curPage);//현재 페이지번호
	pDTO.setList(list);//페이지 에 해당 데이터
	//pDTO.setTotalCount(totalCount(session,map));//전체 레코드 갯수 저장 
	
	return pDTO;
}
	
}
