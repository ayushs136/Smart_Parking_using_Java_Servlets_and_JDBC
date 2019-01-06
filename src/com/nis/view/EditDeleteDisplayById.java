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
 * Servlet implementation class EditDeleteDisplayById
 */
@WebServlet("/EditDeleteDisplayById")
public class EditDeleteDisplayById extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditDeleteDisplayById() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		out.println("<html>");
		HttpSession ses = request.getSession();
		try {
			String nv = "Admin Id: "+ses.getValue("ADMINID").toString()+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "+ses.getValue("ADMINNAME").toString()+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Login Time: "+ses.getAttribute("LTIME").toString()+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img src='/images/"+ses.getValue("APICTURE")+"' width=30 height=30> <hr>";
		
			out.println("<h2>Admin "+ses.getValue("ADMINNAME")+" is online</h2>");
		}catch(Exception e) {
			response.sendRedirect("AdminLogin");
		}
		Employees E = EmployeesController.displayById(Integer.parseInt(request.getParameter("eid")));
	if(E!=null) {
		
out.println("<script src='/asset/jquery-3.3.1.min.js'></script>");
		
		out.println("<script src='/asset/statecity.js'></script>");
		out.println("	<html><body bgcolor='#47535E' text='#EAF0F1'></body><hr><center><h1>Employee Edit</h1></center><hr><form action='FinalEditDeleteEmployees' method='post' enctype='multipart/form-data'>\r\n"); 
			
		out.println("<table><td>");
		out.println(
				"		<table>\r\n" + 
//				"			<caption>\r\n" + 
//				"				<b><i>Employee Register</i></b>\r\n" + 
//				"			</caption>\r\n" + 
//				"\r\n" + 
				"				<tr>\r\n" + 
				"					<td><b><i>Employee Id</i></b></td>\r\n" + 
				"					<td><input type=\"text\" name=\"eid\" value='"+E.getEmployeeid()+"' readonly></td>\r\n" + 
				"				</tr>\r\n" + 
				"				<tr>\r\n" + 
				"					<td><b><i>Name</i></b></td>\r\n" + 
				"					<td><input type=\"text\" name=\"en\"value='"+E.getEmployeename()+"'></td>\r\n" + 
				"				</tr>\r\n" ); 
		
				
				out.println("<tr>\r\n" + 
				"					<td><b><i>Gender</i></b></td>\r\n" ); 
				if(E.getGender().equalsIgnoreCase("male")) {
				out.println("<td><input type=\"radio\" name=\"eg\" value=\"male\"checked >Male<input type=\"radio\" name=\"eg\" value=\"female\">Female</td></tr>");
				}else {
					out.println("<td><input type=\"radio\" name=\"eg\" value=\"male\" >Male<input type=\"radio\" name=\"eg\" value=\"female\" checked>Female</td></tr>");
				}
				
				out.println("<tr>\r\n" + 
				"					<td><b><i>Birth Date</i></b></td>\r\n" + 
				"					<td><input type=\"date\" name=\"edob\" value='"+E.getDob()+"'></td>\r\n" + 
				"				</tr>\r\n" + 
				"				<tr>\r\n" + 
				"					<td><b><i>Address</i></b></td>\r\n" + 
				"					<td><textarea rows='3' cols='30' name='eadd' >"+E.getAddress()+"</textarea> </td>\r\n" + 
				"				</tr>\r\n" + 
				"				<tr>\r\n" );
				String st[] = E.getState().split(",");
				System.out.println(st[0]+st[1]);
				out.print("<input type='hidden' name='stateid' value='"+st[0]+"'>");
			
				out.println(
				"					<td><b><i>State</i></b></td>\r\n" + 
				"					<td><select id=\"estate\" name=\"estate\" ></select>"+st[1]+"</td>\r\n" + 
				"				</tr>\r\n" + 
				"				<tr>\r\n" );
				String ci[] = E.getCity().split(",");
				out.print("<input type='hidden' name='cityid' value='"+ci[0]+"'>");
				out.println(
				"					<td><b><i>City</i></b></td>\r\n" + 
				"					<td><select id=\"ecity\" name=\"ecity\"><option>-select-</option></select>"+ci[1]+"</td>\r\n" + 
				"				</tr>\r\n" + 
				"				<tr>\r\n" + 
				"					<td><b><i>Designation</i></b></td>\r\n" + 
				"					<td><input type=\"text\" name=\"edes\" value='"+E.getDesignation()+"'></td>\r\n" + 
				"				</tr>\r\n" + 
				"				<tr>\r\n" + 
				"					<td><b><i>Salary </i></b></td>\r\n" + 
				"					<td><input type=\"text\" name=\"esal\" value='"+E.getSalary()+"'></td>\r\n" + 
				"				</tr>\r\n" + 
				"\r\n" + 
				"				<tr>\r\n" + 
				"					<td><b><i>Email: </i></b></td>\r\n" + 
				"					<td><input type=\"text\" name=\"email\" value='"+E.getEmail()+"'></td>\r\n" + 
				"				</tr>\r\n" + 
				"				<tr>\r\n" + 
				"					<td><b><i>Mobile no.:</i></b></td>\r\n" + 
				"					<td><input type=\"text\" name=\"emobile\" value='"+E.getMobileno()+"'></td>\r\n" + 
				"				</tr>\r\n" + 
//				"\r\n" + 
//				"				<tr>\r\n" + 
//				"					<td><b><i>Picture: </i></b></td>\r\n" + 
//				"					<td>\r\n" + 
//				"				</tr>\r\n" + 
//				"				<tr>\r\n" + 
				"					<td><b><i>Password </i></b></td>\r\n" + 
				"					<td><input type=\"text\" name=\"epwd\" value='"+E.getPassword()+"'></td>\r\n" + 
				"				</tr>\r\n" + 
				"\r\n" + 
				"		</table>\r\n" );
				out.println("</td><td valign='top'>");
				out.println("<img src='/images/"+E.getPicture()+"' width=200 height=200>"
						+ "<br>Upload New Picture...<br><input type=\"file\" name=\"epic\"><br><input type='submit' value='Save Changes' name='btn'></td></td></table>");
				out.println(
				"		<input type=\"submit\" value='Edit' name='btn'>\r\n" + 
				"		<input type=\"submit\" value='Delete' name='btn' ></form>\r\n" + 
				"</html>\r\n" + 
				"");
				
		
	}else {
		out.println("<h1>Record Not Found</h1>");
	}
	}

}
