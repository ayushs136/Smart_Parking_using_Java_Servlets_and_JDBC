package com.nis.view;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class SearchByEmployee
 */
@WebServlet("/SearchByEmployee")
public class SearchByEmployee extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchByEmployee() {
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
		out.println("<html>");
		try{
			String nv = "Admin Id: "+ses.getValue("ADMINID").toString()+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "+ses.getValue("ADMINNAME").toString()+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Login Time: "+ses.getAttribute("LTIME").toString()+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img src='/Parking/images/"+ses.getValue("APICTURE")+"' width=30 height=30> <hr>";

			out.println("<h2>Admin "+ses.getValue("ADMINNAME")+" is online</h2>");
		}catch(Exception e) {
			response.sendRedirect("AdminHome");
		}
		
		out.println("<html><body bgcolor='#2B2B52' text='#10A881'></body>");
	
		out.println("<script src='/asset/jquery-3.3.1.min.js'></script>");
		out.println("<script src='/asset/search.js'></script>");
		out.println("<table><tr><h2>Search by Id:<h/2></tr>");
		out.println("<script src='/asset/employeeid.js'></script>");

		out.println("<tr><td><b><i>Employee Id:  </i></b></td><td><select name='eid' id='eid'><option>-select-</option></select></tr>"
				+ "<tr><td><b><i>Date 1:  </i></b></td><td><input type='date' name='d1' id='d1' size=30></tr>"
				+ "<tr><td><b><i>Date 2:  </i></b></td><td><input type='date' name='d2' id='d2' size=30></tr>"
				+ "<tr><td><input type='button' name='btn' id='btn' value='Search'></td></tr></table>");
		out.println("<div id='rfiddiv' name='rfiddiv'><br><hr></div>");
		out.println("</html>");
		out.flush();
	}

}
