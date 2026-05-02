package com.rental.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user = request.getParameter("username");
        String pass = request.getParameter("password");

        // QUICK CHECK: Hardcoded admin credentials
        if ("admin".equals(user) && "1234".equals(pass)) {
            // Success! Give them the Session Key
            HttpSession session = request.getSession();
            session.setAttribute("adminLoggedIn", true);
            response.sendRedirect("index.jsp");
        } else {
            // Fail! Send back to login.jsp
            response.sendRedirect("login.jsp.jsp?error=1");
        }
    }
}