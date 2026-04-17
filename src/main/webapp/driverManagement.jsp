<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.rental.driver.Driver" %>
<html>
<head>
    <title>Driver Management</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f6f8;
            margin: 0;
            padding: 20px;
        }
        .container {
            width: 95%;
            max-width: 1100px;
            margin: auto;
        }
        .card {
            background: white;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.08);
        }
        h1, h2 {
            margin-top: 0;
        }
        input, select, button {
            padding: 10px;
            margin: 6px 0;
            width: 100%;
            box-sizing: border-box;
        }
        button {
            background: #111827;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 8px;
        }
        button:hover {
            background: #374151;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
            text-align: left;
        }
        .grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }
    </style>
    <script>
        function toggleFields() {
            let type = document.getElementById("driverType").value;
            document.getElementById("salaryField").style.display = type === "FullTime" ? "block" : "none";
            document.getElementById("tripField").style.display = type === "Freelance" ? "block" : "none";
            document.getElementById("commissionField").style.display = type === "Freelance" ? "block" : "none";
        }
    </script>
</head>
<body onload="toggleFields()">
<div class="container">
    <div class="card">
        <h1>Driver Management</h1>
        <p>Vehicle Rental Service - Chauffeur Management</p>
    </div>

    <div class="grid">
        <div class="card">
            <h2>Add Driver</h2>
            <form action="/driver/add" method="post">
                <input type="text" name="driverId" placeholder="Driver ID" required>
                <input type="text" name="name" placeholder="Name" required>
                <input type="text" name="nic" placeholder="NIC" required>
                <input type="text" name="licenseNumber" placeholder="License Number" required>
                <input type="text" name="phone" placeholder="Phone" required>
                <input type="text" name="address" placeholder="Address" required>

                <select name="available">
                    <option value="true">Available</option>
                    <option value="false">Not Available</option>
                </select>

                <input type="text" name="assignedVehicleId" placeholder="Assigned Vehicle ID" value="none">

                <select name="driverType" id="driverType" onchange="toggleFields()">
                    <option value="FullTime">FullTime</option>
                    <option value="Freelance">Freelance</option>
                </select>

                <div id="salaryField">
                    <input type="number" name="monthlySalary" placeholder="Monthly Salary" value="0">
                </div>

                <div id="tripField" style="display:none;">
                    <input type="number" name="tripsCompleted" placeholder="Trips Completed" value="0">
                </div>

                <div id="commissionField" style="display:none;">
                    <input type="number" name="commissionPerTrip" placeholder="Commission Per Trip" value="0">
                </div>

                <button type="submit">Add Driver</button>
            </form>
        </div>

        <div class="card">
            <h2>Delete Driver</h2>
            <form action="/driver/delete" method="post">
                <input type="text" name="licenseNumber" placeholder="Enter License Number" required>
                <button type="submit">Delete Driver</button>
            </form>

            <h2>Update Availability</h2>
            <form action="/driver/updateAvailability" method="post">
                <input type="text" name="licenseNumber" placeholder="Enter License Number" required>
                <select name="available">
                    <option value="true">Available</option>
                    <option value="false">Not Available</option>
                </select>
                <button type="submit">Update Availability</button>
            </form>
        </div>
    </div>

    <div class="card">
        <h2>All Drivers</h2>
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>License</th>
                <th>Type</th>
                <th>Available</th>
                <th>Payment</th>
            </tr>

            <%
                Driver[] drivers = (Driver[]) request.getAttribute("drivers");
                Integer countObj = (Integer) request.getAttribute("count");
                int count = 0;

                if (countObj != null) {
                    count = countObj;
                }

                if (drivers != null) {
                    for (int i = 0; i < count; i++) {
                        if (drivers[i] != null) {
            %>
            <tr>
                <td><%= drivers[i].getDriverId() %></td>
                <td><%= drivers[i].getName() %></td>
                <td><%= drivers[i].getLicenseNumber() %></td>
                <td><%= drivers[i].getDriverType() %></td>
                <td><%= drivers[i].isAvailable() %></td>
                <td><%= drivers[i].calculatePayment() %></td>
            </tr>
            <%
                        }
                    }
                }
            %>
        </table>
    </div>
</div>
</body>
</html>