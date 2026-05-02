package com.rental.bookingAnDreturn;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/DeleteBookingServlet")
public class DeleteBookingServlet extends HttpServlet {

    // We use doGet because a simple link click is a GET request
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Get the ID passed in the URL (e.g. ?id=B001)
        String id = request.getParameter("id");

        // 2. Tell the File Manager to remove it
        BookingFileManager bfm = new BookingFileManager();
        bfm.deleteBooking(id);

        // 3. Go back to the table to show it's gone
        response.sendRedirect("viewBookings.jsp?msg=returned");
    }
}