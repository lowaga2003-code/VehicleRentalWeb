<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register New Customer</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f4f9; padding: 50px; display: flex; justify-content: center; }
        .form-container { background: white; padding: 30px; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.1); width: 400px; }
        h2 { text-align: center; color: #333; }
        label { font-weight: bold; margin-top: 10px; display: block; color: #555; }
        input, select { width: 100%; padding: 10px; margin-top: 5px; margin-bottom: 15px; border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box; }
        button { width: 100%; padding: 12px; background-color: #0056b3; color: white; border: none; border-radius: 4px; font-size: 16px; cursor: pointer; }
        button:hover { background-color: #004494; }
    </style>
</head>
<body>

    <div class="form-container">
        <h2>Register Customer</h2>

        <form action="CustomerServlet" method="POST">

            <label>Customer ID:</label>
            <input type="text" name="customerId" required placeholder="e.g. C001">

            <label>Full Name:</label>
            <input type="text" name="name" required placeholder="e.g. Kamal Perera">

            <label>Email Address:</label>
            <input type="email" name="email" required placeholder="e.g. kamal@email.com">

            <label>Phone Number:</label>
            <input type="text" name="phone" required placeholder="e.g. 0712345678">

            <label>Customer Type:</label>
            <select name="customerType" required>
                <option value="Local">Local (Sri Lankan)</option>
                <option value="Foreign">Foreign Tourist</option>
            </select>

            <label>NIC or Passport Number:</label>
            <input type="text" name="idNumber" required placeholder="e.g. 981234567V">

            <button type="submit">Register Customer</button>
        </form>
    </div>

</body>
</html>