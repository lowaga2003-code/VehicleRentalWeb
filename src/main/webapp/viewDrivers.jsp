<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.rental.driver.Driver" %>

<html>
<head>

    <title>All Drivers</title>

    <style>

        body{
            font-family: Arial, sans-serif;
            background:#f4f6f8;
            padding:20px;
        }

        .container{
            max-width:1000px;
            margin:auto;
        }

        .card{
            background:white;
            padding:20px;
            border-radius:12px;
            box-shadow:0 4px 12px rgba(0,0,0,0.08);
        }

        table{
            width:100%;
            border-collapse:collapse;
        }

        th,td{
            padding:10px;
            border-bottom:1px solid #ddd;
            text-align:left;
        }

    </style>

</head>

<body>

<div class="container">

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

                Integer countObj =
                        (Integer) request.getAttribute("count");

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