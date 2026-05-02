package com.rental.payment;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/UpdatePaymentServlet")
public class UpdatePaymentServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String paymentId = request.getParameter("id");
        String newStatus = request.getParameter("status"); // We pass "Paid" from the URL

        PaymentFileManager pfm = new PaymentFileManager();
        pfm.updatePaymentStatus(paymentId, newStatus);

        response.sendRedirect("viewPayments.jsp");
    }
}