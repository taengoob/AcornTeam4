package com.controller.emp;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.EmpDTO;
import com.service.EmpService;

/**
 * Servlet implementation class EMPInsertServlet
 */
@WebServlet("/emp/EmpRetrieveServlet")
public class EmpRetrieveServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		//용희 실험 ㅋㅋㅋ
		String empno = request.getParameter("empno");

		EmpDTO dto = null;

			EmpService service = new EmpService();

			    dto = service.retrieve(Integer.parseInt(empno));
			    request.setAttribute("dto", dto);


		RequestDispatcher dis = request.getRequestDispatcher("retrieve.jsp");
		dis.forward(request, response);
	}//end doPost
}//end class
