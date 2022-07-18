package com.controller.emp;

import java.io.IOException;

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
@WebServlet("/EmpUpdateServlet")
public class EmpUpdateServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String empno = request.getParameter("empno");
		String job = request.getParameter("job");
		String sal = request.getParameter("sal");

			EmpDTO dto = new EmpDTO();
			dto.setEmpno(Integer.parseInt(empno));
			dto.setJob(job);
			dto.setSal(Integer.parseInt(sal));
			
			EmpService service = new EmpService();
			service.update(dto);

		    response.sendRedirect("EmpListServlet");
		    
	}//end doPost
}//end class
