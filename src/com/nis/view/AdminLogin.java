package com.nis.view;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AdminLogin
 */
@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLogin() {
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
				"	<title>Administrator</title>\r\n" + 
				"	<body bgcolor='#47535E' text='#EAF0F1'></body>\r\n" + 
				"	<hr><h1><center>Administrator</center></h1><hr>" + 
				"<form action='CheckAdminLogin' method='post'>\r\n" + 
				"	<table align='center'>\r\n" + 
				"		<tr>\r\n" + 
				"			<td><i><b>Admin Id:</b></i></td>\r\n" + 
				"			<td><input type='number' name='id' placeholder='Admin id'></td>\r\n" + 
				"		</tr>\r\n" + 
				"		<tr>\r\n" + 
				"			<td><i><b>Password id: </b></i></td>\r\n" + 
				"			<td><input type='password' name='password' placeholder='Password'></td>\r\n"+
				"	</table>\r\n" + 
				"	<center><input type='submit' value='Login'>\r\n" + 
				"</form>\r\n" + 
				"\r\n" + 
				"</html>");
		
	}

}
