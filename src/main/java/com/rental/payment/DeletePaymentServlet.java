package com.rental.payment;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/DeletePaymentServlet")
public class DeletePaymentServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String paymentId = request.getParameter("id");

        PaymentFileManager pfm = new PaymentFileManager();
        pfm.deletePayment(paymentId);

        response.sendRedirect("viewPayments.jsp");
    }
}