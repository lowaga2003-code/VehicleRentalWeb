<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.rental.customer.Customer, com.rental.customer.CustomerFileManager, com.rental.utils.CustomerList" %>
<html>
<head>
    <title>Customer Directory</title>
    <style>
        body { font-family: 'Inter', sans-serif; background: #f8fafc; padding: 40px; }
        .customer-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(250px, 1fr)); gap: 20px; margin-top: 20px;}
        .card { background: white; padding: 20px; border-radius: 12px; box-shadow: 0 4px 6px rgba(0,0,0,0.05); border: 1px solid #edf2f7; }
        .avatar { width: 40px; height: 40px; background: #e0e7ff; color: #4f46e5; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-weight: bold; margin-bottom: 10px;}
    </style>
</head>
<body>
    <h1>👥 Customer Directory</h1>
    <div class="customer-grid">
        <%
            try {
                CustomerFileManager manager = new CustomerFileManager();
                CustomerList list = manager.getAllCustomers();

                for (int i = 0; i < list.size(); i++) {
                    com.rental.customer.Customer c = list.get(i);
                    String name = (c.getName() != null) ? c.getName() : "Unknown";
                    String initial = name.isEmpty() ? "?" : name.substring(0,1).toUpperCase();
        %>
        <div class="card">
            <div class="avatar"><%= initial %></div>
            <h3 style="margin:0;"><%= name %></h3>
            <p style="font-size:0.8rem; color:#64748b;">ID: <%= c.getCustomerId() %></p>
            <p style="font-size:0.9rem;">
                📧 <%= c.getEmail() %><br>
                📱 <%= c.getPhone() %>
            </p>
        </div>
        <%
                }
            } catch (Exception e) {
                out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
            }
        %>
    </div>
    <br><a href="index.jsp">← Back to Dashboard</a>
</body>
</html>