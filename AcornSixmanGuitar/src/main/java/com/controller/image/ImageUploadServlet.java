package com.controller.image;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.ibatis.session.SqlSession;

import com.common.IDGenerator;
import com.dbconfig.MySqlSessionFactory;
import com.service.CommonService;
import com.service.ProductService;

/**
 * Servlet implementation class ImageUploadServlet
 */

@WebServlet("/image/ImageUploadServlet")
@MultipartConfig(
	    fileSizeThreshold = 1024*1024,
	    maxFileSize = 1024*1024*50, //50메가
	    maxRequestSize = 1024*1024*50*5 // 50메가 5개까지
	)
public class ImageUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ImageUploadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		request.setCharacterEncoding("utf-8");
		
		String productId = IDGenerator.getNewProductId();
		
		HashMap<String, Object> productData = getProductData(productId, request);
		
		List<byte[]> images = getImageDataList(request.getParts());
		
		byte[] preview = (images != null && images.size() > 0) ? images.get(0) : null;
		productData.put("previewImage", preview);
		
		//product 부터 insert 해야함
		insertProduct(productData);
		
		//product insert 후에 image insert
		if (images != null && images.size() > 0)
			insertImages(productId, images);
		
		response.sendRedirect("ImageUploadFormServlet");
	}
	
	private void insertImages(String productId, List<byte[]> images)
	{
		CommonService service = new CommonService();
		for (byte[] data : images)
		{
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("IMAGE_ID", IDGenerator.getNewImageId());
			map.put("PRODUCT_ID", productId);
			map.put("IMAGE_DATA", data);
			
			int result = service.insertImage(map);
		}
	}

	private void insertProduct(HashMap<String, Object> productData)
	{
		ProductService service = new ProductService();
		service.insertProduct(productData);
	}

	private HashMap<String, Object> getProductData(String productId, HttpServletRequest request)
	{
		HashMap<String, Object> productData = new HashMap<String, Object>();
		productData.put("productId", productId);
		
		Enumeration<String> params = request.getParameterNames();
		while (params.hasMoreElements())
		{
			String key = params.nextElement();
			String val = request.getParameter(key);
			System.out.println(key + " : " + val);
			productData.put(key, val);
		}
		return productData;
	}

	private List<byte[]> getImageDataList(Collection<Part> parts)
	{
		List<byte[]> images = new ArrayList<byte[]>();
		byte[] previewData = null;
		
		try
		{
			for (Part part : parts)
			{
				String partName = part.getName();
				if (partName.equals("previewImage"))
				{
					//프리뷰 이미지 처리
					System.out.println(partName);
					previewData = part.getInputStream().readAllBytes();
				}
				else if (partName.equals("productImages"))
				{
					//나머지 이미지 처리
					if (images.size() == 4)
						break;
					
					System.out.println(partName);
					byte[] image = part.getInputStream().readAllBytes();
					if (image != null)
						images.add(image);
				}
			}
			
			if (previewData != null)
				images.add(0, previewData);
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		
		return images;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
