package com.nis.view;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nis.controller.EmployeesController;
import com.nis.model.Employees;

/**
 * Servlet implementation class SearchEmployeeById
 */
@WebServlet("/SearchEmployeeById")
public class SearchEmployeeById extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchEmployeeById() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		HttpSession ses = request.getSession();
		out.print("<html>");
		try {
			String nv = "Admin Id: "+ses.getValue("ADMINID").toString()+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "+ses.getValue("ADMINNAME").toString()+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Login Time: "+ses.getAttribute("LTIME").toString()+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img src='/Parking/images/"+ses.getValue("APICTURE")+"' width=30 height=30> <hr>";
		
			out.println("<h2>Admin "+ses.getValue("ADMINNAME")+" is online</h2>");
		}catch(Exception e) {
			response.sendRedirect("AdminLogin");
		}
		out.println("<body bgcolor='#47535E' text='#EAF0F1'></body>");
		out.println("<form action='EditDeleteDisplayById?eid='>");
		
		out.println("<table><tr><h2>Search by Id:<h/2></tr>");
		out.println("<tr><td><b><i>Employee ID: </i></b></td><td><input type='number' name='eid' size=30><input type='submit'>Search");
		
		out.println("</table></form></html>");
		out.flush();
	
	}

}
