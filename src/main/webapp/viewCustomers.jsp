<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.rental.customer.*" %>
<%@ page import="com.rental.utils.CustomerList" %>

<html>
<head>
    <title>View All Customers</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f4f9; padding: 40px; }
        .table-container { background: white; padding: 30px; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.1); max-width: 800px; margin: auto; }
        h2 { text-align: center; color: #333; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { padding: 12px; text-align: left; border-bottom: 1px solid #ddd; }
        th { background-color: #0056b3; color: white; }
        tr:hover { background-color: #f1f1f1; }
        .back-btn { display: inline-block; margin-bottom: 20px; padding: 10px 15px; background-color: #6c757d; color: white; text-decoration: none; border-radius: 4px; }
    </style>
</head>
<body>

    <div class="table-container">
        <a href="registerCustomer.jsp" class="back-btn">&larr; Back to Registration</a>

        <h2>Registered Customers Dashboard</h2>

        <table>
            <thead>
                <tr>
                    <th>Customer ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Type</th>
                </tr>
            </thead>
            <tbody>
                <%
                    // 1. Wake up the File Manager
                    CustomerFileManager fileManager = new CustomerFileManager();

                    // 2. Load the data using your custom DSA array!
                    CustomerList list = fileManager.getAllCustomers();

                    // 3. Loop through your custom array and print HTML rows
                    for (int i = 0; i < list.size(); i++) {
                        Customer currentCustomer = list.get(i);

                        // Check if it's a Local or Foreign customer using Polymorphism
                        String type = (currentCustomer instanceof LocalCustomer) ? "Local" : "Foreign";
                %>
                        <tr>
                            <td><%= currentCustomer.getCustomerId() %></td>
                            <td><%= currentCustomer.getName() %></td>
                            <td><%= currentCustomer.getEmail() %></td>
                            <td><%= currentCustomer.getPhone() %></td>
                            <td><%= type %></td>
                        </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>

</body>
</html>