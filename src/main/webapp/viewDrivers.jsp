<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.rental.driver.Driver" %>

<%
    Driver[] drivers = (Driver[]) request.getAttribute("drivers");

    Integer countObj = (Integer) request.getAttribute("count");

    int count = 0;

    if (countObj != null) {
        count = countObj;
    }
%>

<html>
<head>

    <title>Driver Directory</title>

    <style>

        body{
            font-family: Arial, sans-serif;
            background:#f3f4f6;
            margin:0;
            padding:20px;
            color:#111827;
        }

        h1{
            font-size:28px;
            margin-bottom:20px;
            font-weight:bold;
        }

        .driver-grid{
            display:grid;
            grid-template-columns:repeat(auto-fit,minmax(210px,1fr));
            gap:16px;
        }

        .driver-card{
            background:white;
            border-radius:14px;
            padding:16px;
            box-shadow:0 3px 10px rgba(0,0,0,0.08);
            transition:0.2s ease;
        }

        .driver-card:hover{
            transform:translateY(-4px);
        }

        .avatar{
            width:40px;
            height:40px;
            border-radius:50%;
            background:#e0e7ff;
            color:#4f46e5;
            display:flex;
            align-items:center;
            justify-content:center;
            font-size:18px;
            font-weight:bold;
            margin-bottom:12px;
        }

        .driver-name{
            font-size:18px;
            font-weight:bold;
            margin-bottom:6px;
        }

        .driver-id{
            color:#6b7280;
            margin-bottom:12px;
            font-size:14px;
        }

        .info{
            margin-bottom:8px;
            font-size:14px;
        }

        .status{
            display:inline-block;
            margin-top:10px;
            padding:6px 12px;
            border-radius:30px;
            font-size:13px;
            font-weight:bold;
        }

        .available{
            background:#dcfce7;
            color:#166534;
        }

        .not-available{
            background:#fee2e2;
            color:#991b1b;
        }

        .payment{
            margin-top:10px;
            font-weight:bold;
            color:#111827;
            font-size:14px;
        }

        .empty{
            text-align:center;
            padding:40px;
            background:white;
            border-radius:12px;
            color:gray;
            font-size:18px;
        }

        .back-btn{
            display:inline-block;
            margin-top:25px;
            text-decoration:none;
            color:#4f46e5;
            font-weight:bold;
            font-size:15px;
        }

    </style>

</head>

<body>

<h1>👨‍✈️ Driver Directory</h1>

<div class="driver-grid">

    <%
        boolean hasDrivers = false;

        if (drivers != null) {

            for (int i = 0; i < count; i++) {

                if (drivers[i] != null) {

                    hasDrivers = true;

                    String firstLetter =
                            drivers[i].getName().substring(0,1).toUpperCase();
    %>

    <div class="driver-card">

        <div class="avatar">
            <%= firstLetter %>
        </div>

        <div class="driver-name">
            <%= drivers[i].getName() %>
        </div>

        <div class="driver-id">
            ID: <%= drivers[i].getDriverId() %>
        </div>

        <div class="info">
            🚘 License: <%= drivers[i].getLicenseNumber() %>
        </div>

        <div class="info">
            👤 Type: <%= drivers[i].getDriverType() %>
        </div>

        <div class="info">
            📞 <%= drivers[i].getPhone() %>
        </div>

        <div class="info">
            🆔 NIC: <%= drivers[i].getNic() %>
        </div>

        <div class="payment">
            💰 Payment: Rs. <%= drivers[i].calculatePayment() %>
        </div>

        <div class="status <%= drivers[i].isAvailable() ? "available" : "not-available" %>">

            <%= drivers[i].isAvailable() ? "Available" : "Not Available" %>

        </div>

    </div>

    <%
                }
            }
        }

        if (!hasDrivers) {
    %>

    <div class="empty">
        No drivers available
    </div>

    <%
        }
    %>

</div>

<a href="index.jsp" class="back-btn">
    ← Back to Dashboard
</a>

</body>
</html>