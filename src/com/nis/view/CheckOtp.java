package com.nis.view;

import com.nis.controller.EmployeesController;
import com.nis.model.Employees;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

@WebServlet("/CheckOtp")
public class CheckOtp extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String otp = request.getParameter("otp");
        String uotp = request.getParameter("uotp");
        System.out.println(otp + " " + uotp);
        if (otp.equals(uotp)) {
            Employees E = EmployeesController.displayById(Integer.parseInt(request.getParameter("id")));
            HttpSession ses = request.getSession();
            ses.putValue("EMPLOYEEID", E.getEmployeeid());
            ses.putValue("EMPLOYEENAME", E.getEmployeename());
            ses.putValue("PICTURE", E.getPicture());
            ses.putValue("LTIME", new Date());
            response.sendRedirect("EmployeeHome");

        }
        else{
            out.println("<html><h1>Wrong OTP</h1><html>");
        }
    }

}
