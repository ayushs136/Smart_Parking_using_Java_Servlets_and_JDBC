package com.nis.view;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.nis.controller.VehicalController;
import com.nis.dao.DbHelper;
import com.nis.model.Vehical;

/**
 * Servlet implementation class FetchVehicalByRFID
 */
@WebServlet("/FetchVehicalByRFID")
public class FetchVehicalByRFID extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FetchVehicalByRFID() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		try {
			ResultSet rs = VehicalController.displayVehicalByRfid(request.getParameter("rfid"));
//			
//			if(!rs.isBeforeFirst()) {
//					JSONObject obj = new JSONObject();
//					obj.put("Message", "Vehical Not Exist");out.println(obj);
//			}else {
			ArrayList<JSONObject> F = DbHelper.JsonEngine(rs);
			out.println(F);
//			}
		
		}catch(Exception e) {
			System.out.println(e);
		}
		
	}

}
