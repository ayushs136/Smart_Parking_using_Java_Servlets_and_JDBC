package com.nis.view;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nis.controller.ExitVehicalsController;
import com.nis.controller.VehicalController;
import com.nis.model.ExitVehical;

/**
 * Servlet implementation class ExitVehicalServlet
 */
@WebServlet("/ExitVehicalServlet")
public class ExitVehicalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExitVehicalServlet() {
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
		out.println("<body bgcolor='#1287A5' text='green'></body>");
		HttpSession ses = request.getSession();
		try{
//			String nv = "Employee Id: "+ses.getValue("EMPLOYEEID").toString()+"<br>Name: "+ses.getValue("EMPLOYEENAME").toString()+"<br><img src='/Parking/images/"+ses.getValue("PICTURE").toString()+"' width=30 height=30 title='"+ses.getValue("EMPLOYEENAME").toString()+"'>";
//			out.println(nv);
			ExitVehical V = new ExitVehical();
			
			V.setEmployeeid(Integer.parseInt(ses.getValue("EMPLOYEEID").toString()));
			V.setVehicalid(Integer.parseInt(request.getParameter("vid")));
			V.setExitdate(request.getParameter("exitdate"));
			V.setExittime(request.getParameter("exittime"));
			boolean st = ExitVehicalsController.addNewVehical(V);
			if(st) {
				boolean r = VehicalController.removeRFID();
					st = VehicalController.UpdateStatus(V.getVehicalid());
					st = VehicalController.deleteVehicalOut(V.getVehicalid());
				response.sendRedirect("SearchByRfid");
			}else {
				out.println("Failed to exit...");
				response.sendRedirect("SearchByRfid");
			}
			
			
		}
		catch(Exception e) {
			System.out.println(e);
			response.sendRedirect("EmployeeLogin");
		}
		
		
		
		
	}

}
