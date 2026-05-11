<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.rental.customer.Customer, com.rental.VehicleInventoryManagement.*, java.util.List" %>

<%
    // Security Check: Only let Customers in
    if (session.getAttribute("customerUser") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    Customer user = (Customer) session.getAttribute("customerUser");
%>

<html>
<head>
    <title>Customer Service Portal</title>
    <style>
        :root { --primary: #6366f1; --bg: #f8fafc; --text: #1e293b; }
        body { font-family: 'Inter', sans-serif; background: var(--bg); margin: 0; color: var(--text); }

        /* Navigation Bar */
        .navbar { background: white; padding: 15px 50px; display: flex; justify-content: space-between; align-items: center; box-shadow: 0 1px 3px rgba(0,0,0,0.1); sticky; top:0; z-index: 100; }
        .logo { font-size: 1.5rem; font-weight: 800; color: var(--primary); text-decoration: none; }

        .container { max-width: 1200px; margin: 40px auto; padding: 0 20px; }

        /* Hero Section */
        .hero { background: linear-gradient(135deg, #4f46e5 0%, #7c3aed 100%); color: white; padding: 60px; border-radius: 24px; margin-bottom: 50px; }

        .section-header { display: flex; align-items: center; gap: 15px; margin-bottom: 25px; }
        .section-header h2 { font-size: 1.8rem; margin: 0; }

        /* Grid Layout */
        .service-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(300px, 1fr)); gap: 25px; }

        .service-card { background: white; border-radius: 16px; border: 1px solid #e2e8f0; overflow: hidden; transition: 0.3s; }
        .service-card:hover { transform: translateY(-5px); box-shadow: 0 20px 25px -5px rgba(0,0,0,0.1); }

        .card-body { padding: 25px; }
        .card-type { font-size: 0.75rem; font-weight: 700; text-transform: uppercase; color: var(--primary); background: #eef2ff; padding: 4px 10px; border-radius: 6px; }

        .price { font-size: 1.4rem; font-weight: 800; margin-top: 15px; }
        .btn-book { display: block; width: 100%; text-align: center; background: var(--primary); color: white; padding: 12px; border-radius: 10px; text-decoration: none; font-weight: 600; margin-top: 20px; }
    </style>
</head>
<body>

<nav class="navbar">
    <a href="#" class="logo">RentalDrive</a>
    <div>
        <span style="margin-right: 20px;">Hi, <b><%= user.getName() %></b></span>
        <a href="LogoutServlet" style="color: #ef4444; text-decoration: none; font-weight: 600;">Logout</a>
    </div>
</nav>

<div class="container">
    <div class="hero">
        <h1>Welcome back to RentalDrive!</h1>
        <p>Book your next ride, hire a driver, or choose a package for your journey.</p>
    </div>

    <section class="service-section">
        <div class="section-header">
            <span>🚗</span>
            <h2>Our Fleet</h2>
        </div>
        <div class="service-grid">
            <%
                VehicleFileManager vfm = new VehicleFileManager();
                List<Vehicle> vehicles = vfm.getAllVehicles();
                for (Vehicle v : vehicles) {
            %>
            <div class="service-card">
                <div class="card-body">
                    <span class="card-type"><%= v.getClass().getSimpleName() %></span>
                    <h3><%= v.getBrand() %> <%= v.getModel() %></h3>
                    <p style="color: #64748b;">Ready for your next trip. Unlimited mileage options available.</p>
                    <div class="price">LKR <%= v.getDailyRate() %> <small style="font-weight: 400; color: #94a3b8;">/ day</small></div>
                    <a href="bookNow.jsp?id=<%= v.getVehicleId() %>" class="btn-book">Book This Vehicle</a>
                </div>
            </div>
            <% } %>
        </div>
    </section>
</div>

</body>
</html>