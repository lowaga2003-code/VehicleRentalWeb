<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.rental.bookingAnDreturn.*" %>
<%@ page import="java.util.List" %>

<html>
<head>
    <title>All Bookings | Admin Dashboard</title>
    <style>
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background-color: #f4f7f6; padding: 40px; }
        .container { background: white; padding: 30px; border-radius: 12px; box-shadow: 0 4px 20px rgba(0,0,0,0.08); max-width: 1000px; margin: auto; }
        h2 { color: #f39c12; border-bottom: 2px solid #f39c12; padding-bottom: 10px; margin-bottom: 20px; }

        table { width: 100%; border-collapse: collapse; background: white; }
        th { background-color: #f39c12; color: white; padding: 15px; text-align: left; font-size: 14px; font-weight: bold; }
        td { padding: 15px; border-bottom: 1px solid #eee; color: #333; }
        tr:hover { background-color: #fff9f0; }

        .id-badge { font-weight: bold; color: #333; }
        .price-tag { color: #27ae60; font-weight: bold; }
        .btn-return { color: #e74c3c; font-weight: bold; text-decoration: none; }
        .btn-return:hover { text-decoration: underline; color: #c0392b; }
        .btn-back { display: inline-block; margin-top: 30px; text-decoration: none; color: #7f8c8d; font-weight: bold; transition: 0.3s; }
        .btn-back:hover { color: #2c3e50; }
    </style>
</head>
<body>

<div class="container">
    <h2>📋 Booking Records</h2>

    <table>
        <thead>
            <tr>
                <th>Booking ID</th>
                <th>Customer ID</th>
                <th>Vehicle ID</th>
                <th>Duration (Days)</th>
                <th>Total Cost</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <%
                BookingFileManager bfm = new BookingFileManager();
                List<Booking> allBookings = bfm.getAllBookings();

                if (allBookings != null && !allBookings.isEmpty()) {
                    for (Booking b : allBookings) {
            %>
            <tr>
                <td><span class="id-badge"><%= b.getBookingId() %></span></td>
                <td><%= b.getCustomerId() %></td>
                <td><%= b.getVehicleId() %></td>
                <td><%= b.getNumberOfDays() %> Days</td>
                <td class="price-tag">LKR <%= b.getTotalCost() %>0</td>
                <td>
                    <a href="DeleteBookingServlet?id=<%= b.getBookingId() %>"
                       class="btn-return"
                       onclick="return confirm('Are you sure you want to return this car?')">
                       Return Car
                    </a>
                </td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="6" style="text-align: center; padding: 40px; color: #999;">
                    No active bookings found.
                </td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>

    <a href="index.jsp" class="btn-back">← Back to Dashboard</a>
</div>

</body>
</html>