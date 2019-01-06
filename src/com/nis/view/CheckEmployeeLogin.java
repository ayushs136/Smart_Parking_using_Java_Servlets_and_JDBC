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
 * Servlet implementation class CheckEmployeeLogin
 */
@WebServlet("/CheckEmployeeLogin")
public class CheckEmployeeLogin extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckEmployeeLogin() {
        super();
        // TODO Auto-generated constructor stub
    }


    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        PrintWriter out = response.getWriter();
        out.println("<html>");
		String btn = request.getParameter("btn");
		if(btn.equals("Login")) {
            int id = Integer.parseInt(request.getParameter("id"));
            String password = request.getParameter("password");

            System.out.println(id + ", " + password);
            Employees E = EmployeesController.checkEmployeeLogin(id, password);

            if (E != null) {

                HttpSession ses = request.getSession();
                ses.putValue("EMPLOYEEID", E.getEmployeeid());
                ses.putValue("EMPLOYEENAME", E.getEmployeename());
                ses.putValue("GENDER", E.getGender());
                ses.putValue("DOB", E.getDob());
                ses.putValue("ADDRESS", E.getAddress());
                ses.putValue("STATE", E.getState());
                ses.putValue("CITY", E.getCity());
                ses.putValue("DESIGNATION", E.getDesignation());
                ses.putValue("SALARY", E.getSalary());
                ses.putValue("EMAIL", E.getEmail());
                ses.putValue("MOBILENO", E.getMobileno());
                ses.putValue("PICTURE", E.getPicture());
                ses.putValue("PASSWORD", E.getPassword());


                response.sendRedirect("EmployeeHome");
            } else {
                out.println("<body bgcolor='#1287A5' text='green'></body>");
                out.println("<h1><font color='red'>Invalid EmployeeId/Password</font></h1>");

            }
        }

        else if(btn.equals("Login With OTP")){
            Employees E = EmployeesController.displayById(Integer.parseInt(request.getParameter("id")));
           if(E==null){
                out.println("Incorrect Id");
           }else{
               String name = E.getEmployeename();
               String mob = E.getMobileno();
               out.println("<html><body bgcolor='#000' text='#EAF0F1' ></body>");
               out.println("<form action='CheckOtp' method=post> " );
               int otp = (int)((Math.random()*8999)+1000);
               System.out.println("otp: "+otp);
               out.println("<input type='hidden' name='otp' value='"+otp+"'>");
               out.println("<input type='hidden' name='id' value='"+request.getParameter("id")+"'>");
               out.println("<table align='center'>");
               out.println("<tr><td><b><i>Name: "+name+"</i></b></td></tr>");
               String num = "xxxxxxxx"+mob.substring(8);
               out.println("<tr><td><b><i>Moblie No.: "+num+"</i></b></td></tr>");
               out.println("<tr><td><b><i>Otp: <input type='password' name='uotp' ></i></b></td></tr>");
               out.println("</table>");
               out.println("<center><input type='submit' ></center>");

               SMSServlet S= new SMSServlet();
               S.SendSms("COM7", mob+"" , otp+"");

           }
        }


    }

}
