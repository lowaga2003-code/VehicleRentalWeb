<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.rental.customer.Customer" %>
<%-- Import only what is ready --%>
<%@ page import="com.rental.VehicleInventoryManagement.Vehicle" %>
<%@ page import="com.rental.VehicleInventoryManagement.VehicleFileManager" %>
<%@ page import="com.rental.rentalpackages.RentalPackage" %>
<%@ page import="com.rental.rentalpackages.PackageManager" %>

<%
    // Security Gate
    Customer user = (Customer) session.getAttribute("customerUser");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<html>
<head>
    <title>Explore Luxury Fleet | RentalDrive</title>
    <style>
        :root {
            --primary: #6366f1;
            --secondary: #10b981;
            --dark: #0f172a;
            --glass: rgba(255, 255, 255, 0.9);
        }

        body {
            font-family: 'Plus Jakarta Sans', sans-serif;
            background: #f8fafc;
            margin: 0; padding: 0;
            color: var(--dark);
        }

        /* 1. MODERN HERO SECTION */
        .hero {
            background: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)),
                        url('https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?auto=format&fit=crop&w=1600&q=80');
            background-size: cover;
            background-position: center;
            height: 450px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            color: white;
            text-align: center;
            border-radius: 0 0 40px 40px;
        }

        .hero h1 { font-size: 3.5rem; margin: 0; font-weight: 800; letter-spacing: -2px; }
        .hero p { font-size: 1.2rem; opacity: 0.9; margin-top: 10px; }

        /* 2. NAVIGATION BAR */
        .nav {
            padding: 20px 50px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: white;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            position: sticky; top: 0; z-index: 1000;
        }

        .container { max-width: 1200px; margin: -50px auto 100px; padding: 0 20px; }

        /* 3. SEARCH BOX */
        .search-bar {
            background: white;
            padding: 20px;
            border-radius: 20px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.1);
            display: flex;
            gap: 15px;
            margin-bottom: 50px;
        }

        .search-bar input { flex: 1; border: 1px solid #e2e8f0; padding: 15px; border-radius: 12px; font-size: 1rem; }

        /* 4. CARDS LAYOUT */
        .section-title { font-size: 1.8rem; margin: 40px 0 25px; font-weight: 700; display: flex; align-items: center; gap: 10px; }

        .grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(320px, 1fr)); gap: 30px; }

        .card {
            background: white;
            border-radius: 24px;
            overflow: hidden;
            border: 1px solid #f1f5f9;
            transition: all 0.3s ease;
        }

        .card:hover { transform: translateY(-10px); box-shadow: 0 30px 60px -12px rgba(50, 50, 93, 0.25); }

        .card-img { height: 200px; background: #e2e8f0; position: relative; }
        .card-img img { width: 100%; height: 100%; object-fit: cover; }

        .price-badge {
            position: absolute; bottom: 15px; right: 15px;
            background: var(--dark); color: white;
            padding: 6px 14px; border-radius: 10px; font-weight: 700;
        }

        .card-body { padding: 25px; }
        .card-body h3 { margin: 0 0 10px; font-size: 1.3rem; }

        .btn {
            background: var(--primary); color: white; text-align: center;
            display: block; padding: 14px; border-radius: 12px;
            text-decoration: none; font-weight: 700; margin-top: 20px;
        }

        .btn-pkg { background: #f59e0b; }
    </style>
</head>
<body>

    <div class="nav">
        <h2 style="color: var(--primary); margin:0;">RentalDrive</h2>
        <div>
            <span>Welcome, <b><%= user.getName() %></b></span>
            <a href="LogoutServlet" style="margin-left:20px; color:red; text-decoration:none;">Logout</a>
        </div>
    </div>

    <div class="hero">
        <h1>Move with Style</h1>
        <p>Premium cars and travel packages at your fingertips.</p>
    </div>

    <div class="container">
        <div class="search-bar">
            <input type="text" placeholder="Search by brand (Toyota, Honda, Tesla...)">
            <button style="background:var(--primary); color:white; border:none; padding:0 30px; border-radius:12px; cursor:pointer; font-weight:bold;">Find Ride</button>
        </div>

        <div class="section-title">🚗 Our Premium Fleet</div>
        <div class="grid">
            <%
                try {
                    VehicleFileManager vfm = new VehicleFileManager();
                    for (Vehicle v : vfm.getAllVehicles()) {
                        // Dynamic Photo Logic based on Brand
                        String photo = "https://images.unsplash.com/photo-1533473359331-0135ef1b58bf?q=80&w=500"; // Default
                        if(v.getBrand().toLowerCase().contains("toyota")) photo = "https://images.unsplash.com/photo-1621007947382-bb3c3994e3fb?q=80&w=500";
                        if(v.getBrand().toLowerCase().contains("honda")) photo = "https://images.unsplash.com/photo-1599912027806-cfec9f5944b6?q=80&w=500";
            %>
                <div class="card">
                    <div class="card-img">
                        <img src="<%= photo %>" alt="Car Photo">
                        <div class="price-badge">LKR <%= v.getDailyRate() %></div>
                    </div>
                    <div class="card-body">
                        <h3><%= v.getBrand() %> <%= v.getModel() %></h3>
                        <p style="color:#64748b; font-size:0.9rem;">Automatic • AC • Unlimited KM</p>
                        <a href="bookVehicle.jsp?id=<%= v.getVehicleId() %>" class="btn">Reserve This Car</a>
                    </div>
                </div>
            <%
                    }
                } catch (Exception e) { out.print("Check your Vehicle Manager."); }
            %>
        </div>

        <div class="section-title">📦 Special Travel Packages</div>
        <div class="grid">
            <%
                try {
                    PackageManager pm = new PackageManager();
                    for (RentalPackage p : pm.getAllPackages()) {
            %>
                <div class="card" style="border-top: 5px solid #f59e0b;">
                    <div class="card-img">
                        <img src="https://images.unsplash.com/photo-1469854523086-cc02fe5d8800?q=80&w=500" alt="Package Photo">
                    </div>
                    <div class="card-body">
                        <h3><%= p.getPackageName() %></h3>
                        <p style="color:#64748b;"><b>Duration:</b> <%= p.getDuration() %></p>
                        <p style="font-size:1.4rem; color:#f59e0b; font-weight:800;">LKR <%= p.getPrice() %></p>
                        <a href="bookPkg.jsp?id=<%= p.getPackageId() %>" class="btn btn-pkg">View Package Deal</a>
                    </div>
                </div>
            <%
                    }
                } catch (Exception e) { out.print("Check your Package Manager."); }
            %>
        </div>
    </div>

</body>
</html>