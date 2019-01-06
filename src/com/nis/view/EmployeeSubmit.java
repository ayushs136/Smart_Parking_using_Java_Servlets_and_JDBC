package com.nis.view;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.softech.FileUpload;

import com.nis.controller.EmployeesController;
import com.nis.model.Employees;

/**
 * Servlet implementation class EmployeeSubmit
 */
@WebServlet("/EmployeeSubmit")
@MultipartConfig(fileSizeThreshold=1024*1024*2,//2mb
maxFileSize=1024*1024*2,//10mb
maxRequestSize=1024*1024*50 )//50mb

public class EmployeeSubmit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeeSubmit() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		HttpSession ses = request.getSession();
		try {
			String nv = "Admin Id: "+ses.getValue("ADMINID").toString()+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "+ses.getValue("ADMINNAME").toString()+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Login Time: "+ses.getAttribute("LTIME").toString()+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img src='/Parking/images/"+ses.getValue("APICTURE")+"' width=30 height=30> <hr>";
		
			out.println("<h2>Admin's online</h2>");
		}catch(Exception e) {
			response.sendRedirect("AdminLogin");
		}
		Employees E = new Employees();
		//E.setEmployeeid(request.getParameter("eid"));
		E.setEmployeename(request.getParameter("en"));
		E.setGender(request.getParameter("eg"));	
		E.setDob(request.getParameter("edob"));
		E.setAddress(request.getParameter("eadd"));
		E.setState(request.getParameter("estate"));
		E.setCity(request.getParameter("ecity"));
		E.setDesignation(request.getParameter("edes"));
		E.setSalary(Long.parseLong(request.getParameter("esal")));
		E.setEmail(request.getParameter("email"));
		E.setMobileno(request.getParameter("emobile"));
		E.setPassword(request.getParameter("epwd"));
		Part P = request.getPart("epic");
		FileUpload F = new FileUpload(P, "F:/JAVA  ADV SAPPAL SIR/Project/WebContent/images");
		E.setPicture(F.filename);
		System.out.println(F.filename);
		boolean status = EmployeesController.addNewRecord(E);
		out.println("<html> <body bgcolor='#1287A5' text='#EAF0F1'></body>");
		if(status) {
			
			out.println("<h1 align='center'>Record Submitted...</h1><form action=\"DisplayAllEmployees\">\r\n" + 
					"    <input type=\"submit\" value=\"Show all Employees\" />\r\n" + 
					"</form><form action=\"EmployeeView\">\r\n" + 
					"    <input type=\"submit\" value=\"Add New Record...\" />\r\n" + 
					"</form>");
		}else {
			out.println("Fail to submit record");
		}
		out.println("</html>");
		
		out.flush();
		
		
		
	}

}
