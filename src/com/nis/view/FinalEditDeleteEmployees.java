package com.nis.view;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.softech.FileUpload;

import com.nis.controller.EmployeesController;
import com.nis.model.Employees;

/**
 * Servlet implementation class FinalEditDeleteEmployees
 */
@WebServlet("/FinalEditDeleteEmployees")
@MultipartConfig(fileSizeThreshold=1024*1024*2,//2mb
maxFileSize=1024*1024*2,//10mb
maxRequestSize=1024*1024*50 )//50mb
public class FinalEditDeleteEmployees extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FinalEditDeleteEmployees() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		out.println("<body bgcolor='#1287A5' text='green'></body>");
		String eid = request.getParameter("eid");
		String  btn = request.getParameter("btn");
		
		if(btn.equals("Delete")) {
			boolean st = EmployeesController.deleteRecord(Integer.parseInt(eid));
			if(st) {
			response.sendRedirect("DisplayAllEmployees");
			}
		}
			else if(btn.equals("Edit")) {
				Employees E = new Employees();
				E.setEmployeeid(request.getParameter("eid"));
				E.setEmployeename(request.getParameter("en"));
				E.setGender(request.getParameter("eg"));	
				E.setDob(request.getParameter("edob"));
				E.setAddress(request.getParameter("eadd"));
				
if(request.getParameter("estate").equals("-select-")&&request.getParameter("ecity").equals("-select-")) {
					
				E.setState(request.getParameter("stateid"));
				E.setCity(request.getParameter("cityid"));
}else {
	E.setState(request.getParameter("estate"));
	E.setCity(request.getParameter("ecity"));
}
				E.setDesignation(request.getParameter("edes"));
				E.setSalary(Long.parseLong(request.getParameter("esal")));
				E.setEmail(request.getParameter("email"));
				E.setMobileno(request.getParameter("emobile"));
				E.setPassword(request.getParameter("epwd"));
				
				boolean st = EmployeesController.editRecord(E);
				
			response.sendRedirect("DisplayAllEmployees");
			}
		
		else if(btn.equals("Save Changes"))	{
			 
			Part P = request.getPart("epic");
			FileUpload F = new FileUpload(P, "F:/JAVA  ADV SAPPAL SIR/Project/WebContent/images");
			
			System.out.println(F.filename);
			
			boolean st = EmployeesController.editPicture(Integer.parseInt(eid), F.filename);
			response.sendRedirect("DisplayAllEmployees");
		}
		
	}

}
