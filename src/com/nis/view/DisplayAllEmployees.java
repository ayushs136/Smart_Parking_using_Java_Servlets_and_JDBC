package com.nis.view;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nis.controller.EmployeesController;

/**
 * Servlet implementation class DisplayAllEmployees
 */
@WebServlet("/DisplayAllEmployees")
public class DisplayAllEmployees extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DisplayAllEmployees() {
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
	try {
//		out.println("<html>");
		ResultSet rs = EmployeesController.displayAll();
		
		if(rs.next()) {
			out.println("<hr><h1 align='center'><b><i>List Of Employees</i></b></h1><hr><body bgcolor='#47535E' text='#EAF0F1'></body><table  border=1 align='center'>" + 
//					"	<caption><b><i>List of Employee</i></b></caption>\r\n" + 
//					"\r\n" + 
					"	<tr>\r\n" + 
					"		<th>Picture</th><th>Employee ID</th><th>Employee Name</th>\r\n" + 
					"		<th>DOB</th><th>Gender</th><th>Address</th><th>State</th><th>City</th><th>Email</th><th>Mobile NO.</th><th>Designation</th><th>Salary</th><th>Update</th>\r\n" + 
					"	</tr>\r\n"); 
					
			
			
			do {
				out.println("<tr><td><img src='/images/"+rs.getString(12)+"' width=50 height=50><br></td><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(5)+"</td><td>"+rs.getString(13)+"</td><td>"+rs.getString(14)+"</td><td>"+rs.getString(10)+" </th><th>+91"+rs.getString(11)+"</td><td>"+rs.getString(8)+"</td><td>"+rs.getString(9)+"</td><td><a href=EditDeleteDisplayById?eid="+rs.getString(1)+" >Edit/Delete</td></tr>");
			}while(rs.next());
			out.println("</table>");
		}else {
			out.println("<h1>Record not found</h1>");
		}
		
		
	}catch(Exception e) {
		System.out.println(e);
	}
	out.println("</html>");
	
	}

}
