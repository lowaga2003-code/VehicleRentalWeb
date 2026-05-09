<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>

    <title>Manage Driver</title>

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
            margin-bottom:20px;
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

</head>

<body>

<div class="container">

    <div class="card">

        <h2>Delete Driver</h2>

        <form action="/driver/delete" method="post">

            <input type="text"
                   name="licenseNumber"
                   placeholder="Enter License Number"
                   required>

            <button type="submit">Delete Driver</button>

        </form>

    </div>

    <div class="card">

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

            <button type="submit">
                Update Availability
            </button>

        </form>

    </div>

</div>

</body>
</html>