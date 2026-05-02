<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.rental.customer.*" %>
<%@ page import="com.rental.VehicleInventoryManagement.*" %>
<%@ page import="com.rental.utils.CustomerList" %>
<%@ page import="java.util.List" %>

<html>
<head>
    <title>Make a Booking</title>
    <style>
        body { font-family: 'Segoe UI', sans-serif; background-color: #f8f9fa; padding: 50px; }
        .booking-card { background: white; padding: 30px; border-radius: 15px; box-shadow: 0 10px 30px rgba(0,0,0,0.1); max-width: 500px; margin: auto; }
        h2 { color: #2c3e50; text-align: center; margin-bottom: 30px; }
        label { font-weight: bold; display: block; margin-top: 15px; color: #555; }
        select, input { width: 100%; padding: 12px; margin-top: 5px; border: 1px solid #ddd; border-radius: 8px; box-sizing: border-box; }
        .btn-book { width: 100%; background: #007bff; color: white; padding: 15px; border: none; border-radius: 8px; margin-top: 25px; font-size: 16px; cursor: pointer; transition: 0.3s; }
        .btn-book:hover { background: #0056b3; }
        .back-link { display: block; text-align: center; margin-top: 15px; color: #666; text-decoration: none; }
    </style>
</head>
<body>

<div class="booking-card">
    <h2>📅 New Booking</h2>

    <form action="BookingServlet" method="post">
        <label>Booking ID:</label>
        <input type="text" name="bookingId" placeholder="e.g. B001" required>

        <label>Select Customer:</label>
        <select name="customerId" required>
            <option value="">-- Choose Customer --</option>
            <%
                CustomerFileManager cfm = new CustomerFileManager();
                // 1. Fetch your custom CustomerList
                CustomerList customerList = cfm.getAllCustomers();

                // 2. Loop manually using your .size() and .get(i) methods
                if(customerList != null) {
                    for (int i = 0; i < customerList.size(); i++) {
                        Customer c = customerList.get(i);
            %>
                <option value="<%= c.getCustomerId() %>">
                    <%= c.getName() %> (<%= c.getCustomerId() %>)
                </option>
            <%
                    }
                }
            %>
        </select>

        <label>Select Vehicle:</label>
        <select name="vehicleId" required>
            <option value="">-- Choose Vehicle --</option>
            <%
                VehicleFileManager vfm = new VehicleFileManager();
                // Vehicles still use the standard Java List
                List<Vehicle> vehicleList = vfm.getAllVehicles();
                if(vehicleList != null) {
                    for (Vehicle v : vehicleList) {
            %>
                <option value="<%= v.getVehicleId() %>">
                    <%= v.getBrand() %> <%= v.getModel() %> - LKR <%= v.getDailyRate() %>/day
                </option>
            <%
                    }
                }
            %>
        </select>

        <label>Number of Days:</label>
        <input type="number" name="days" min="1" required>

        <button type="submit" class="btn-book">Confirm Booking</button>
    </form>
    <a href="index.jsp" class="back-link">Cancel</a>
</div>

</body>
</html>