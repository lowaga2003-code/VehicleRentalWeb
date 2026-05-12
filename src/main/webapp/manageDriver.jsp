<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>

    <title>Manage Driver</title>

    <style>

        body{
            font-family: Arial, sans-serif;
            background:#f3f4f6;
            margin:0;
            padding:30px;
            color:#111827;
        }

        h1{
            font-size:28px;
            margin-bottom:25px;
            font-weight:bold;
        }

        .container{
            display:grid;
            grid-template-columns:repeat(auto-fit,minmax(320px,1fr));
            gap:20px;
        }

        .card{
            background:white;
            padding:22px;
            border-radius:16px;
            box-shadow:0 4px 12px rgba(0,0,0,0.08);
            transition:0.2s ease;
        }

        .card:hover{
            transform:translateY(-4px);
        }

        .card-icon{
            width:45px;
            height:45px;
            border-radius:50%;
            background:#e0e7ff;
            color:#4f46e5;
            display:flex;
            align-items:center;
            justify-content:center;
            font-size:20px;
            font-weight:bold;
            margin-bottom:14px;
        }

        .card h2{
            margin-top:0;
            margin-bottom:18px;
            font-size:22px;
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
            padding:12px;
            border:none;
            border-radius:10px;
            font-size:15px;
            font-weight:bold;
            cursor:pointer;
            transition:0.2s ease;
        }

        .delete-btn{
            background:#ef4444;
            color:white;
        }

        .delete-btn:hover{
            background:#dc2626;
        }

        .update-btn{
            background:#10b981;
            color:white;
        }

        .update-btn:hover{
            background:#059669;
        }

        .back-btn{
            display:inline-block;
            margin-top:25px;
            text-decoration:none;
            color:#4f46e5;
            font-weight:bold;
            font-size:15px;
        }

        .paymentBtn{
            background:#f59e0b;
        }

        .paymentBtn:hover{
            background:#d97706;
        }

    </style>

</head>

<body>

<h1>⚙️ Manage Drivers</h1>

<div class="container">

    <!-- Delete Driver Card -->

    <div class="card">

        <div class="card-icon">
            🗑️
        </div>

        <h2>Delete Driver</h2>

        <form action="/driver/delete" method="post">

            <input type="text"
                   name="licenseNumber"
                   placeholder="Enter License Number"
                   required>

            <button type="submit" class="delete-btn">
                Delete Driver
            </button>

        </form>

    </div>

    <!-- Update Availability Card -->

    <div class="card">

        <div class="card-icon">
            🔄
        </div>

        <h2>Update Availability</h2>

        <form action="/driver/updateAvailability" method="post">

            <input type="text"
                   name="licenseNumber"
                   placeholder="Enter License Number"
                   required>

            <select name="available">
                <option value="true">Available</option>
                <option value="false">Not Available</option>
            </select>

            <button type="submit" class="update-btn">
                Update Availability
            </button>

        </form>

    </div>

    <div class="card">

        <div class="iconCircle">💰</div>

        <h2>Freelance Payment</h2>

        <form action="/driver/updateFreelancePayment" method="post">

            <input type="text"
                   name="licenseNumber"
                   placeholder="Enter License Number"
                   required>

            <input type="number"
                   name="tripsCompleted"
                   placeholder="Trips Completed"
                   required>

            <input type="number"
                   step="0.01"
                   name="commissionPerTrip"
                   placeholder="Commission Per Trip"
                   required>

            <button type="submit" class="paymentBtn">
                Calculate Payment
            </button>

        </form>

    </div>



</div>



</body>
</html>