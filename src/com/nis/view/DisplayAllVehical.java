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

import com.nis.controller.VehicalController;

/**
 * Servlet implementation class DisplayAllVehical
 */
@WebServlet("/DisplayAllVehical")
public class DisplayAllVehical extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DisplayAllVehical() {
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
		 ResultSet rs = VehicalController.displayAllVehicals();
		try {
		
			if(rs.next()) {
				out.println("<hr><center><h1>All Vehicals</h1></center><hr><body bgcolor='#000' text='#10A881'></body>");
				out.println("<table align='center' border=1><tr>" + 
						"	<th>Vehical ID</th><th>Employee id</th>" + 
						"	<th>RFID</th><th>REGISTRATION No.</th><th>Entry date</th><th>Entry time</th><th>Amount</th><th>No. of Hours</th><th>Status</th><th>Floor </th><th>Mobile No</th><th>Change Status</th>" + 
						"	</tr>");
				
				do {
				out.println("<td>"+rs.getString(1)+"</td>"+"<td>"+rs.getString(2)+"</td>"+"<td>"+rs.getString(3)+"</td>"+"<td>"+rs.getString(4)+"</td>"+"<td>"+rs.getString(5)+"</td>"+"<td>"+rs.getString(11)+"</td>"+"<td>"+rs.getString(6)+"</td>"+"<td>"+rs.getString(7)+"</td>"+"<td>"+rs.getString(8)+"</td>"+"<td>"+rs.getString(12)+"</td>"+"<td>"+rs.getString(10)+"</td><td><a name='btn' href=VehicalEdit?vid="+rs.getString(1)+" name='btn' >EDIT/DELETE</a></td></tr>");
			
				}while(rs.next());
				
				out.println("</table></html>");
			}else {
				System.out.println("<h1>No Record Found</h1>");
			}
			
			
			
			
		}catch(Exception e) {
			System.out.println("Error: DisplayAllVehical()" +e);
		}
	}

}
