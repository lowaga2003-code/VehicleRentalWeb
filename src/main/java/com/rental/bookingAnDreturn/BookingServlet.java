package com.rental.bookingAnDreturn;

import com.rental.VehicleInventoryManagement.Vehicle;
import com.rental.VehicleInventoryManagement.VehicleFileManager;
import com.rental.customer.Customer;
import com.rental.customer.CustomerFileManager;
import java.util.List; // Essential for Fix 1

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // 1. Capture all 4 inputs from the form
            String bId = request.getParameter("bookingId");
            String cId = request.getParameter("customerId");
            String vId = request.getParameter("vehicleId");
            String daysStr = request.getParameter("days");

            if (daysStr == null || daysStr.isEmpty()) {
                response.sendRedirect("registerBooking.jsp?error=missingDays");
                return;
            }
            int days = Integer.parseInt(daysStr);

            // 2. Load the Vehicle List from the other module
            VehicleFileManager vfm = new VehicleFileManager();
            List<Vehicle> allVehicles = vfm.getAllVehicles();

            double dailyRate = 0;

            // 3. Search the List to find the price
            for (Vehicle v : allVehicles) {
                if (v.getVehicleId().equals(vId)) {
                    dailyRate = v.getDailyRate();
                    break;
                }
            }

            // 4. Calculate Total
            double totalCost = dailyRate * days;

            // 5. Save the Booking
            Booking newBooking = new Booking(bId, cId, vId, days, totalCost);
            BookingFileManager bfm = new BookingFileManager();
            bfm.saveBooking(newBooking);

            // 6. Redirect back to the main dashboard
            response.sendRedirect("index.jsp?status=booked");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("registerBooking.jsp?error=1");
        }
    }
}