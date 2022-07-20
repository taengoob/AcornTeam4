package com.controller.image;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.dbconfig.MySqlSessionFactory;
import com.dto.ImageDTO;

/**
 * Servlet implementation class ImageListServlet
 */
@WebServlet("/image/ImageListServlet")
public class ImageListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ImageListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String PRODUCT_ID = "tempProduct001";
		List<ImageDTO> list = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try
		{
			list = session.selectList("com.mapper.common.selectImageByProductId", PRODUCT_ID);
		}
		finally
		{
			session.close();
		}
		request.setAttribute("Images", list);
		RequestDispatcher dis = request.getRequestDispatcher("imageList.jsp");
		dis.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
