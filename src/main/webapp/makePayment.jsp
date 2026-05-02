<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Process Payment</title>
    <style>
        body { font-family: sans-serif; background: #f8f9fa; padding: 40px; }
        .card { background: white; padding: 30px; border-radius: 10px; box-shadow: 0 4px 15px rgba(0,0,0,0.1); max-width: 400px; margin: auto; }
        input, select { width: 100%; padding: 10px; margin: 10px 0; border: 1px solid #ccc; border-radius: 5px; box-sizing: border-box; }
        button { width: 100%; padding: 12px; background: #27ae60; color: white; border: none; border-radius: 5px; font-weight: bold; cursor: pointer; }
    </style>
</head>
<body>
    <div class="card">
        <h2 style="color: #27ae60; text-align: center;">💳 Process Payment</h2>
        <form action="PaymentServlet" method="post">

            <label>Payment ID:</label>
            <input type="text" name="paymentId" placeholder="e.g. P001" required>

            <label>Booking ID:</label>
            <input type="text" name="bookingId" placeholder="e.g. B001" required>

            <label>Amount (LKR):</label>
            <input type="number" name="amount" required>

            <label>Payment Method:</label>
            <select name="paymentMethod">
                <option value="Cash">Cash</option>
                <option value="Credit Card">Credit Card</option>
            </select>

            <label>Status:</label>
            <select name="status">
                <option value="Paid">Paid</option>
                <option value="Pending">Pending</option>
            </select>

            <button type="submit">Submit Payment</button>
        </form>
        <a href="index.jsp" style="display: block; text-align: center; margin-top: 15px; color: #7f8c8d;">Cancel</a>
    </div>
</body>
</html>