<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>

    <title>Add Driver</title>

    <style>

        body{
            font-family: Arial, sans-serif;
            background:#f3f4f6;
            margin:0;
            padding:30px;
            color:#111827;
        }

        .container{
            max-width:650px;
            margin:auto;
        }

        .card{
            background:white;
            padding:24px;
            border-radius:18px;
            box-shadow:0 4px 12px rgba(0,0,0,0.08);
        }

        .header{
            display:flex;
            align-items:center;
            gap:14px;
            margin-bottom:24px;
        }

        .icon{
            width:50px;
            height:50px;
            border-radius:50%;
            background:#e0e7ff;
            color:#4f46e5;
            display:flex;
            align-items:center;
            justify-content:center;
            font-size:24px;
        }

        h2{
            margin:0;
            font-size:28px;
        }

        input,select{
            width:100%;
            padding:12px;
            margin-bottom:14px;
            border:1px solid #d1d5db;
            border-radius:10px;
            font-size:14px;
            box-sizing:border-box;
            outline:none;
        }

        input:focus,
        select:focus{
            border-color:#6366f1;
        }

        button{
            width:100%;
            padding:13px;
            background:#4f46e5;
            color:white;
            border:none;
            border-radius:10px;
            font-size:15px;
            font-weight:bold;
            cursor:pointer;
            transition:0.2s ease;
        }

        button:hover{
            background:#4338ca;
        }

        .back-btn{
            display:inline-block;
            margin-top:22px;
            text-decoration:none;
            color:#4f46e5;
            font-weight:bold;
            font-size:15px;
        }

    </style>

    <script>

        function toggleFields() {

            let type =
                document.getElementById("driverType").value;

            document.getElementById("salaryField").style.display =
                type === "FullTime" ? "block" : "none";

            document.getElementById("tripField").style.display =
                type === "Freelance" ? "block" : "none";

            document.getElementById("commissionField").style.display =
                type === "Freelance" ? "block" : "none";
        }

    </script>

</head>

<body onload="toggleFields()">

<div class="container">

    <div class="card">

        <div class="header">

            <div class="icon">
                👨‍✈️
            </div>

            <h2>Add Driver</h2>

        </div>

        <form action="/driver/add" method="post">

            <input type="text"
                   name="driverId"
                   placeholder="Driver ID"
                   required>

            <input type="text"
                   name="name"
                   placeholder="Driver Name"
                   required>

            <input type="text"
                   name="nic"
                   placeholder="NIC Number"
                   required>

            <input type="text"
                   name="licenseNumber"
                   placeholder="License Number"
                   required>

            <input type="text"
                   name="phone"
                   placeholder="Phone Number"
                   required>

            <input type="text"
                   name="address"
                   placeholder="Address"
                   required>

            <select name="available">

                <option value="true">
                    Available
                </option>

                <option value="false">
                    Not Available
                </option>

            </select>

            <select name="driverType"
                    id="driverType"
                    onchange="toggleFields()">

                <option value="FullTime">
                    FullTime
                </option>

                <option value="Freelance">
                    Freelance
                </option>

            </select>

            <div id="salaryField">

                <input type="number"
                       name="monthlySalary"
                       placeholder="Monthly Salary">

            </div>

            <!--<div id="tripField" style="display:none;">

                <input type="number"
                       name="tripsCompleted"
                       placeholder="Trips Completed">

            </div>-->

            <div id="commissionField" style="display:none;">

                <input type="number"
                       name="commissionPerTrip"
                       placeholder="Commission Per Trip">

            </div>

            <button type="submit">
                Add Driver
            </button>

        </form>

    </div>

    <a href="index.jsp" class="back-btn">
        ← Back to Dashboard
    </a>

</div>

</body>
</html>