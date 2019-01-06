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
 * Servlet implementation class AdminHome
 */
@WebServlet("/AdminHome")
public class AdminHome extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminHome() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		PrintWriter out = response.getWriter();
		out.println("<html><body bgcolor='#019031' text='#EAF0F1'></body>");
		HttpSession ses = request.getSession();
		try {
			String nv = "Admin Id: "+ses.getValue("ADMINID").toString()+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "+ses.getValue("ADMINNAME").toString()+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Login Time: "+ses.getAttribute("LTIME").toString()+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img src='/images/"+ses.getValue("APICTURE")+"' width=30 height=30> <hr>";
			out.println(nv);
			out.println("<table>");
			out.println("<tr><td valign='top'>");
			out.println("<a href='EmployeeView' target='mw'>Add Employees</a><br>");

			out.println("<a href='DisplayAllEmployees' target='mw'>DisplayAll</a><br>");

			out.println("<a href='SearchEmployeeById' target='mw'>Search</a><br>");
			
			out.println("<a href='FloorView' target='mw'>Add Floor</a><br>");
			out.println("<span><a href='SearchByEmployee' target='mw'>Vehical By Employee</a></span>");

			out.println("<a href='LogoutAdmin'>Logout</a></td>");
			
			out.println("<td valign='top'><iframe frameborder=0 width=1270  height=500 name='mw'>");
			out.println("</table>");
		}catch(Exception e) {
			response.sendRedirect("AdminLogin");
		}
		out.println("</html>");
	}

}
