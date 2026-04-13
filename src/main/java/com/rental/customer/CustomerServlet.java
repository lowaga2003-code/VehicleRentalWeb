package com.rental.customer;

// NOTE: If these 'javax' imports turn red, change the word 'javax' to 'jakarta'
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

// This annotation MUST match the "action" in your HTML form!
@WebServlet("/CustomerServlet")
public class CustomerServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // 1. GRAB THE DATA FROM THE WEB FORM
        // The strings inside getParameter() must match the "name" attributes in your JSP file
        String customerId = request.getParameter("customerId");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String customerType = request.getParameter("customerType");
        String idNumber = request.getParameter("idNumber");

        // 2. CREATE THE CORRECT OBJECT (Polymorphism!)
        Customer newCustomer;
        if (customerType.equals("Local")) {
            newCustomer = new LocalCustomer(customerId, name, email, phone, idNumber);
        } else {
            newCustomer = new ForeignTourist(customerId, name, email, phone, idNumber);
        }

        // 3. SAVE TO THE TEXT FILE
        CustomerFileManager fileManager = new CustomerFileManager();
        fileManager.saveCustomer(newCustomer);

        // 4. REFRESH THE PAGE (You can add a success message here later)
        System.out.println("Customer saved successfully: " + name);
        response.sendRedirect("registerCustomer.jsp");
    }
}