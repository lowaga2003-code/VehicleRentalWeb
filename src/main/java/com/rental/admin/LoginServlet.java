package com.rental.admin;

import com.rental.customer.*;
import com.rental.utils.CustomerList;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String user = request.getParameter("username");
        String pass = request.getParameter("password");

        HttpSession session = request.getSession();

        // 1. ADMIN CHECK (admin / 1234)
        if ("admin".equals(user) && "1234".equals(pass)) {
            session.setAttribute("adminLoggedIn", true);
            session.setAttribute("userRole", "ADMIN");
            response.sendRedirect("index.jsp");
            return;
        }

        // 2. CUSTOMER CHECK
        CustomerFileManager cfm = new CustomerFileManager();
        CustomerList allCustomers = cfm.getAllCustomers();

        for (int i = 0; i < allCustomers.size(); i++) {
            Customer c = allCustomers.get(i);
            if (c.getEmail().equalsIgnoreCase(user) && c.getPhone().equals(pass)) {
                session.setAttribute("customerUser", c);
                session.setAttribute("userRole", "CUSTOMER");
                response.sendRedirect("customerHome.jsp");
                return;
            }
        }

        // 3. FAIL
        response.sendRedirect("login.jsp?error=1");
    }
}