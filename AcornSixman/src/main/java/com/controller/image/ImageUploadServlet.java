package com.controller.image;

import java.io.IOException;
import java.util.Collection;
import java.util.HashMap;

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
		String productId = "tempProduct001";
		Collection<Part> parts = request.getParts();
		for (Part part : parts)
		{
			if(!part.getName().equals("f")) continue; //f로 들어온 Part가 아니면 스킵
			if(part.getSubmittedFileName().equals("")) continue; //업로드 된 파일 이름이 없으면 스킵
			
			byte[] data = part.getInputStream().readAllBytes();
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("IMAGE_ID", IDGenerator.getNewImageId());
			map.put("PRODUCT_ID", productId);
			map.put("IMAGE_DATA", data);
			
			SqlSession session = MySqlSessionFactory.getSession();
			try
			{
				session.insert("com.mapper.common.uploadImageFiles", map);
				session.commit();
			}
			finally
			{
				session.close();
			}
		}
		
		response.sendRedirect("ImageListServlet");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
