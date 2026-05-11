<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- This matches your exact packages --%>
<%@ page import="com.rental.customer.Customer, com.rental.customer.CustomerFileManager, com.rental.utils.CustomerList" %>

<html>
<head>
    <title>Manage Customers</title>
    <style>
        body { font-family: 'Inter', sans-serif; background: #f3f4f6; padding: 40px; }
        .card { background: white; padding: 30px; border-radius: 15px; box-shadow: 0 10px 15px rgba(0,0,0,0.1); max-width: 1100px; margin: auto; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th { background: #4f46e5; color: white; padding: 12px; text-align: left; }
        td { padding: 12px; border-bottom: 1px solid #eee; }
        .btn-edit { background: #10b981; color: white; padding: 5px 10px; border-radius: 4px; text-decoration: none; margin-right: 5px;}
        .btn-delete { background: #ef4444; color: white; padding: 5px 10px; border-radius: 4px; text-decoration: none;}
    </style>
</head>
<body>
    <div class="card">
        <h2>⚙️ Customer Management Dashboard</h2>
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Actions</th>
            </tr>
            <%
                try {
                    CustomerFileManager manager = new CustomerFileManager();
                    // Using your existing CustomerList class
                    CustomerList list = manager.getAllCustomers();

                    // Traditional loop because CustomerList is not a standard java.util.List
                    for (int i = 0; i < list.size(); i++) {
                        com.rental.customer.Customer c = list.get(i);
            %>
            <tr>
                <td><%= c.getCustomerId() %></td>
                <td><%= c.getName() %></td>
                <td><%= c.getEmail() %></td>
                <td><%= c.getPhone() %></td>
                <td>
                    <a href="editCustomer.jsp?id=<%= c.getCustomerId() %>" class="btn-edit">Edit</a>
                    <a href="deleteCustomerProcess.jsp?id=<%= c.getCustomerId() %>" class="btn-delete" onclick="return confirm('Delete this customer?')">Delete</a>
                </td>
            </tr>
            <%
                    }
                } catch (Exception e) {
                    out.println("<tr><td colspan='5' style='color:red;'>Error: " + e.getMessage() + "</td></tr>");
                }
            %>
        </table>
        <br><a href="index.jsp">← Back to Dashboard</a>
    </div>
</body>
</html>