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
 * Servlet implementation class EmployeeHome
 */
@WebServlet("/EmployeeHome")
public class EmployeeHome extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeeHome() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
//		out.println("<link rel='shortcut icon'  type='image/png'  href='/GEO.png' >");
		out.println("<body bgcolor='#DDDDDD' text='#000'></body>");
		HttpSession ses = request.getSession();
		try{
			String nv = "Employee Id: "+ses.getValue("EMPLOYEEID").toString()+"<br>Name: "+ses.getValue("EMPLOYEENAME").toString()+"<br><img src='/images/"+ses.getValue("PICTURE").toString()+"' width=30 height=30 title='"+ses.getValue("EMPLOYEENAME").toString()+"'>";
		out.println(nv);
		out.println("<center><h1>Welcome to Parking Entry </h1></center><table>");
		out.println("<tr><td valign='top'>");
		out.println("<span><a href='VehicalView' target='mw'>Add Vehical</a></span>");

		out.println("<span><a href='DisplayAllVehical' target='mw'>Display All Vehical</a></span>");

		out.println("<span><a href='SearchVehicalByRegistrationNo' target='mw'>Search</a></span>");
		out.println("<span><a href='SearchByRfid' target='mw'>Exit Vehical</a></span>");
//		out.println("<span><a href='SearchByEmployee' target='mw'>Vehical By Employee</a></span>");

		out.println("<span><a href='LogoutEmployee'>Logout</a></SPAN></td></tr></table>");
		
		out.println("<table><tr><td valign='top'><iframe frameborder=0 width=1360  height=700 name='mw'>");
		out.println("</td></tr></table>");
		
		
		}catch(Exception e) {
			response.sendRedirect("EmployeeLogin");
		}
	}



}
