<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Vehicle Rental System - Dashboard</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f4f9; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; }
        .dashboard { background: white; padding: 40px; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.1); text-align: center; width: 400px; }
        h1 { color: #333; margin-bottom: 30px; }
        .menu-btn { display: block; width: 100%; padding: 15px; margin: 10px 0; background-color: #0056b3; color: white; text-decoration: none; border-radius: 5px; font-size: 18px; font-weight: bold; }
        .menu-btn:hover { background-color: #004494; }
        .vehicle-btn { background-color: #28a745; }
        .vehicle-btn:hover { background-color: #218838; }
    </style>
</head>
<body>

    <div class="dashboard">
        <h1>Vehicle Rental System</h1>

        <a href="registerCustomer.jsp" class="menu-btn">Register New Customer</a>
        <a href="viewCustomers.jsp" class="menu-btn">View All Customers</a>
        <a href="/driver" class="menu-btn">Driver Management</a>



        <br><hr><br>

        <a href="#" class="menu-btn vehicle-btn">Register New Vehicle</a>
        <a href="#" class="menu-btn vehicle-btn">View All Vehicles</a>
    </div>

</body>
</html>