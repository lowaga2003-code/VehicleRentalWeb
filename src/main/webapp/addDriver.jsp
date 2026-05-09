<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Driver</title>

    <style>
        body{
            font-family: Arial, sans-serif;
            background:#f4f6f8;
            padding:20px;
        }

        .container{
            max-width:700px;
            margin:auto;
        }

        .card{
            background:white;
            padding:20px;
            border-radius:12px;
            box-shadow:0 4px 12px rgba(0,0,0,0.08);
        }

        input,select,button{
            width:100%;
            padding:10px;
            margin:6px 0;
            box-sizing:border-box;
        }

        button{
            background:#111827;
            color:white;
            border:none;
            border-radius:8px;
        }
    </style>

    <script>
        function toggleFields() {
            let type = document.getElementById("driverType").value;

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

            <input type="text" name="assignedVehicleId"
                   placeholder="Assigned Vehicle ID" value="none">

            <select name="driverType" id="driverType"
                    onchange="toggleFields()">

                <option value="FullTime">FullTime</option>
                <option value="Freelance">Freelance</option>

            </select>

            <div id="salaryField">
                <input type="number"
                       name="monthlySalary"
                       placeholder="Monthly Salary"
                       value="0">
            </div>

            <div id="tripField" style="display:none;">
                <input type="number"
                       name="tripsCompleted"
                       placeholder="Trips Completed"
                       value="0">
            </div>

            <div id="commissionField" style="display:none;">
                <input type="number"
                       name="commissionPerTrip"
                       placeholder="Commission Per Trip"
                       value="0">
            </div>

            <button type="submit">Add Driver</button>

        </form>

    </div>

</div>

</body>
</html>