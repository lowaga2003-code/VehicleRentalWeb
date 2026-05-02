<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.rental.payment.*" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>Payment Ledger</title>
    <style>
        body { font-family: sans-serif; background: #f8f9fa; padding: 40px; }
        table { width: 100%; border-collapse: collapse; background: white; box-shadow: 0 4px 15px rgba(0,0,0,0.1); }
        th { background: #27ae60; color: white; padding: 12px; text-align: left; }
        td { padding: 12px; border-bottom: 1px solid #eee; }
        .btn-update { color: #2980b9; text-decoration: none; font-weight: bold; margin-right: 15px; }
        .btn-delete { color: #e74c3c; text-decoration: none; font-weight: bold; }
    </style>
</head>
<body>
    <h2 style="color: #27ae60;">💰 Financial Ledger</h2>

    <table>
        <tr>
            <th>Payment ID</th>
            <th>Booking ID</th>
            <th>Amount</th>
            <th>Method</th>
            <th>Status</th>
            <th>Actions</th>
        </tr>
        <%
            // We only declare pfm ONCE here!
            PaymentFileManager pfm = new PaymentFileManager();
            List<Payment> payments = pfm.getAllPayments();

            if (payments != null && !payments.isEmpty()) {
                for(Payment p : payments) {
        %>
        <tr>
            <td><%= p.getPaymentId() %></td>
            <td><%= p.getBookingId() %></td>
            <td>LKR <%= p.getAmount() %>0</td>
            <td><%= p.getPaymentMethod() %></td>
            <td style="color: <%= p.getStatus().equals("Paid") ? "green" : "red" %>;"><b><%= p.getStatus() %></b></td>
            <td>
                <% if(p.getStatus().equals("Pending")) { %>
                    <a href="UpdatePaymentServlet?id=<%= p.getPaymentId() %>&status=Paid" class="btn-update">Mark Paid</a>
                <% } %>
                <a href="DeletePaymentServlet?id=<%= p.getPaymentId() %>" class="btn-delete" onclick="return confirm('Refund this payment?')">Refund</a>
            </td>
        </tr>
        <%
                }
            } else {
        %>
        <tr><td colspan="6" style="text-align:center; padding: 20px;">No payments found.</td></tr>
        <%  } %>
    </table>

    <br>
    <a href="index.jsp" style="color: #7f8c8d; font-weight: bold; text-decoration: none;">← Back to Dashboard</a>
</body>
</html>