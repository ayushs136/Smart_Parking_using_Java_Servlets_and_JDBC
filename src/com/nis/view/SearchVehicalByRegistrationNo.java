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
 * Servlet implementation class SearchVehicalByRegistrationNo
 */
@WebServlet("/SearchVehicalByRegistrationNo")
public class SearchVehicalByRegistrationNo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchVehicalByRegistrationNo() {
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
			String nv = "Employee Id: "+ses.getValue("EMPLOYEEID").toString()+"<br>Name: "+ses.getValue("EMPLOYEENAME").toString()+"<br><img src='/Parking/images/"+ses.getValue("PICTURE").toString()+"' width=30 height=30 title='"+ses.getValue("EMPLOYEENAME").toString()+"'>";
		out.println("Employee: "+ses.getValue("EMPLOYEENAME")+" Online");
		}catch(Exception e) {
			response.sendRedirect("EmployeeLogin");
		}
		
		out.println("<html><body bgcolor='#000' text='#10A881'></body>");
		out.println("<form action='VehicalEdit?vid='>");
		
		out.println("<table><tr><h2>Search by Id:<h/2></tr>");
		out.println("<tr><td><b><i>Registration ID/Vehical ID/Mobile No.:  </i></b></td><td><input type='text' name='vid' size=30><input type='submit'>");
		
		out.println("</table></form></html>");
		out.flush();
	}

}
