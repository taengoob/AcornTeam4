package com.controller.emp;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.EmpDTO;
import com.service.EmpService;

/**
 * Servlet implementation class EmpListServlet
 */
@WebServlet("/emp/EmpListServlet")
public class EmpListServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String searchName = request.getParameter("searchName");
		String searchValue = request.getParameter("searchValue");
		System.out.println(searchName+"\t"+searchValue);
		EmpService service = new EmpService();
		List<EmpDTO> list = service.select(searchName, searchValue);
		
		request.setAttribute("list", list);
		getServletContext().setAttribute("list", list);
		
		RequestDispatcher dis = request.getRequestDispatcher("list.jsp");
		dis.forward(request, response);
	}

}
