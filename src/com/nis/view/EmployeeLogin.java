package com.nis.view;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EmployeeLogin
 */
@WebServlet("/EmployeeLogin")
public class EmployeeLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeeLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		out.println("<html>\r\n" + 
				"	<title>Employee Login</title>\r\n" + 
				"	<body bgcolor='#333945' text='#EAF0F1' ></body>\r\n" + 
				"	<hr><h1><center>Employee Login</center></h1><hr>" + 
				"<form action='CheckEmployeeLogin' method='post'>\r\n" + 
				"	<table align='center'>\r\n" + 
				"		<tr>\r\n" + 
				"			<td><i><b>Employee Id:</b></i></td>\r\n" + 
				"			<td><input type='number' name='id' placeholder='Employee id'></td>\r\n" + 
				"		</tr>\r\n" + 
				"		<tr>\r\n" + 
				"			<td><i><b>Password: </b></i></td>\r\n" + 
				"			<td><input type='password' name='password' placeholder='Password'></td>\r\n"+
				"	</table>\r\n" + 
				"	<center><input type='submit' value='Login' name='btn'><input type='submit' value='Login With OTP' name='btn'>\r\n" +
				"</form>\r\n" + 
				"\r\n" + 
				"</html>");
		

	}

}
