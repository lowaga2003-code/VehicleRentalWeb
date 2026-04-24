<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.rental.customer.CustomerFileManager" %>

<%
    // 1. Grab the ID from the URL (e.g., ?id=C001)
    String idToDelete = request.getParameter("id");

    // 2. If the ID exists, wake up the File Manager and delete them
    if (idToDelete != null && !idToDelete.isEmpty()) {
        CustomerFileManager fileManager = new CustomerFileManager();
        fileManager.deleteCustomer(idToDelete);
    }

    // 3. Instantly redirect the user back to the updated table
    response.sendRedirect("viewCustomers.jsp");
%>