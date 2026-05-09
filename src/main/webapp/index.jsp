<%
    if (session.getAttribute("adminLoggedIn") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Master Dashboard | Vehicle Rental System</title>
    <style>
        :root {
            --bg: #f3f4f6;
            --white: #ffffff;
            --primary: #6366f1; /* Indigo */
            --secondary: #10b981; /* Emerald */
            --accent: #f59e0b; /* Amber */
            --text-dark: #1f2937;
            --text-muted: #6b7280;
        }

        body {
            font-family: 'Inter', system-ui, -apple-system, sans-serif;
            background-color: var(--bg);
            margin: 0; padding: 0;
            color: var(--text-dark);
        }

        .container { max-width: 1100px; margin: 0 auto; padding: 50px 20px; }

        /* Welcome Section */
        .header { text-align: center; margin-bottom: 50px; }
        .header h1 { font-size: 2.5rem; margin: 0; font-weight: 800; letter-spacing: -1px; }
        .header p { color: var(--text-muted); font-size: 1.1rem; margin-top: 10px; }

        /* The 3-Column Grid */
        .pillar-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
            gap: 30px;
        }

        .pillar {
            background: var(--white);
            border-radius: 20px;
            padding: 30px;
            box-shadow: 0 10px 25px -5px rgba(0,0,0,0.05);
            border: 1px solid rgba(0,0,0,0.03);
            display: flex;
            flex-direction: column;
        }

        .pillar-title {
            font-size: 0.8rem;
            text-transform: uppercase;
            letter-spacing: 1.5px;
            font-weight: 700;
            margin-bottom: 25px;
            padding: 5px 12px;
            border-radius: 50px;
            display: inline-block;
            width: fit-content;
        }

        /* Color Themes for Pillars */
        .pillar.blue { border-top: 5px solid var(--primary); }
        .pillar.blue .pillar-title { background: #e0e7ff; color: var(--primary); }

        .pillar.green { border-top: 5px solid var(--secondary); }
        .pillar.green .pillar-title { background: #d1fae5; color: var(--secondary); }

        .pillar.orange { border-top: 5px solid var(--accent); }
        .pillar.orange .pillar-title { background: #fef3c7; color: var(--accent); }

        /* Topic Rows */
        .topic-group { margin-bottom: 25px; }
        .topic-name { font-size: 1.1rem; font-weight: 700; margin-bottom: 12px; display: block; }
        .member-badge {
            font-size: 0.7rem;
            background: #f9fafb;
            color: #9ca3af;
            padding: 2px 8px;
            border-radius: 4px;
            border: 1px solid #e5e7eb;
            margin-left: 8px;
            font-weight: 400;
        }

        .btn-link {
            display: block;
            padding: 12px 15px;
            background: #ffffff;
            border: 1px solid #f3f4f6;
            border-radius: 10px;
            text-decoration: none;
            color: var(--text-dark);
            font-size: 0.9rem;
            margin-bottom: 8px;
            transition: all 0.2s ease;
            font-weight: 500;
        }

        .btn-link:hover {
            background: #f9fafb;
            transform: translateX(5px);
            border-color: #d1d5db;
        }

        .footer { text-align: center; margin-top: 60px; }
        .logout { color: #ef4444; text-decoration: none; font-weight: 600; font-size: 0.9rem; }
    </style>
</head>
<body>

<div class="container">
    <div class="header">
        <h1>Vehicle Rental System</h1>
        <p>Project Dashboard & Management Console</p>
    </div>

    <div class="pillar-grid">

        <div class="pillar blue">
            <span class="pillar-title">User Management</span>

            <div class="topic-group">
                <span class="topic-name">Customers <span class="member-badge">Member 1</span></span>
                <a href="registerCustomer.jsp" class="btn-link">📝 Register New</a>
                <a href="viewCustomers.jsp" class="btn-link">📋 View Directory</a>
            </div>

            <div class="topic-group">
                <span class="topic-name">Drivers <span class="member-badge">Member 2</span></span>
                <a href="addDriver.jsp" class="btn-link">
                    ➕ Add Driver
                </a>

                <a href="manageDriver.jsp" class="btn-link">
                    ⚙️ Manage Driver
                </a>

                <a href="viewDrivers.jsp" class="btn-link">
                    📋 View Drivers
                </a>
            </div>
        </div>

        <div class="pillar green">
            <span class="pillar-title">Inventory & Fleet</span>

            <div class="topic-group">
                <span class="topic-name">Vehicles <span class="member-badge">Member 3</span></span>
                <a href="registerVehicle.jsp" class="btn-link">➕ Add Vehicle</a>
                <a href="viewVehicles.jsp" class="btn-link">🔍 View Inventory</a>
            </div>

            <div class="topic-group">
                <span class="topic-name">Rental Packages <span class="member-badge">Member 4</span></span>
                <a href="addPackage.jsp" class="btn-link">🎁 Create Package</a>
                <a href="viewPackages.jsp" class="btn-link">📦 View Packages</a>
            </div>
        </div>

        <div class="pillar orange">
            <span class="pillar-title">Operations</span>

            <div class="topic-group">
                <span class="topic-name">Bookings <span class="member-badge">Member 5</span></span>
                <a href="registerBooking.jsp" class="btn-link">🗓️ New Booking</a>
                <a href="viewBookings.jsp" class="btn-link">📂 Booking History</a>
            </div>

            <div class="topic-group">
                <span class="topic-name">Payments <span class="member-badge">Member 6</span></span>
                <a href="makePayment.jsp" class="btn-link">💳 Process Payment</a>
                <a href="viewPayments.jsp" class="btn-link">📊 Financial Ledger</a>
            </div>
        </div>

    </div>

    <div class="footer">
        <a href="login.jsp" class="logout">🔒 Secure System Logout</a>
    </div>
</div>

</body>
</html>