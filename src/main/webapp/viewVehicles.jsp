<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.rental.VehicleInventoryManagement.*" %>
<%@ page import="java.util.List" %>

<html>
<head>
    <title>Vehicle Inventory</title>
    <style>
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background-color: #f4f7f6; padding: 40px; }
        .container { background: white; padding: 30px; border-radius: 12px; box-shadow: 0 4px 20px rgba(0,0,0,0.08); max-width: 1000px; margin: auto; }
        h2 { color: #2c3e50; border-bottom: 2px solid #3498db; padding-bottom: 10px; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th { background-color: #3498db; color: white; padding: 12px; text-align: left; }
        td { padding: 12px; border-bottom: 1px solid #eee; }
        .type-tag { padding: 4px 8px; border-radius: 4px; font-size: 12px; font-weight: bold; color: white; }
        .tag-car { background-color: #27ae60; }
        .tag-van { background-color: #f39c12; }
        .tag-suv { background-color: #8e44ad; }
        .btn { padding: 6px 12px; border-radius: 4px; text-decoration: none; color: white; font-size: 13px; }
        .btn-delete { background-color: #e74c3c; }
        .btn-add { background-color: #3498db; display: inline-block; margin-bottom: 20px; }
    </style>
</head>
<body>

<div class="container">
    <h2>🚚 Vehicle Inventory Management</h2>
    <a href="registerVehicle.jsp" class="btn btn-add">+ Register New Vehicle</a>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Brand & Model</th>
                <th>Plate</th>
                <th>Type</th>
                <th>Details</th>
                <th>Daily Rate</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
                VehicleFileManager fm = new VehicleFileManager();
                List<Vehicle> inventory = fm.getAllVehicles();

                for (Vehicle v : inventory) {
                    String typeClass = "";
                    String details = "";
                    String typeName = "";

                    // POLYMORPHISM: Check which child class we are dealing with
                    if (v instanceof Car) {
                        typeName = "Car";
                        typeClass = "tag-car";
                        details = "Fuel: " + ((Car)v).getFuelType();
                    } else if (v instanceof Van) {
                        typeName = "Van";
                        typeClass = "tag-van";
                        details = "Capacity: " + ((Van)v).getLoadCapacity() + "kg";
                    } else if (v instanceof SUV) {
                        typeName = "SUV";
                        typeClass = "tag-suv";
                        details = "AWD: " + (((SUV)v).isAWD() ? "Yes" : "No");
                    }
            %>
            <tr>
                <td><%= v.getVehicleId() %></td>
                <td><%= v.getBrand() %> <%= v.getModel() %></td>
                <td><%= v.getLicensePlate() %></td>
                <td><span class="type-tag <%= typeClass %>"><%= typeName %></span></td>
                <td><i><%= details %></i></td>
                <td>LKR <%= v.getDailyRate() %></td>
                <td>
                    <a href="#" class="btn btn-delete">Delete</a>
                </td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
    <br>
    <a href="index.jsp" style="color: #7f8c8d; text-decoration: none;">← Back to Dashboard</a>
</div>

</body>
</html>