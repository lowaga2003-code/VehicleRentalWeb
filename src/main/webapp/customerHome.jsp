<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.rental.customer.Customer" %>
<%@ page import="com.rental.VehicleInventoryManagement.Vehicle" %>
<%@ page import="com.rental.VehicleInventoryManagement.VehicleFileManager" %>
<%@ page import="com.rental.rentalpackages.RentalPackage" %>
<%@ page import="com.rental.rentalpackages.PackageManager" %>

<%
    Customer user = (Customer) session.getAttribute("customerUser");

    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>

    <title>RentalDrive | Luxury Fleet</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">

    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700;800&display=swap"
          rel="stylesheet">

    <style>

        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
        }

        :root{
            --primary:#c084fc;
            --secondary:#d8b4fe;
            --dark:#0f172a;
        }

        body{
            font-family:'Plus Jakarta Sans',sans-serif;
            background:
                    radial-gradient(circle at top left, #dbeafe 0%, transparent 30%),
                    radial-gradient(circle at bottom right, #bfdbfe 0%, transparent 35%),
                    linear-gradient(135deg,#dbeafe,#c7d2fe,#93c5fd,#60a5fa);

            background-attachment:fixed;
            color:var(--dark);
            overflow-x:hidden;
            min-height:100vh;
            position:relative;
        }

        body::before{
            content:"";
            position:fixed;
            width:500px;
            height:500px;
            background:rgba(255,255,255,0.18);
            border-radius:50%;
            filter:blur(120px);
            top:-100px;
            left:-100px;
            z-index:-1;
        }

        body::after{
            content:"";
            position:fixed;
            width:500px;
            height:500px;
            background:rgba(192,132,252,0.18);
            border-radius:50%;
            filter:blur(120px);
            bottom:-100px;
            right:-100px;
            z-index:-1;
        }

        /* NAVBAR */

        .navbar{
            position:sticky;
            top:0;
            z-index:1000;

            backdrop-filter:blur(14px);
            -webkit-backdrop-filter:blur(14px);

            background:rgba(255,255,255,0.28);

            border-bottom:1px solid rgba(255,255,255,0.25);
        }

        .nav-container{
            max-width:1300px;
            margin:auto;
            padding:18px 30px;

            display:flex;
            justify-content:space-between;
            align-items:center;
        }

        .logo{
            font-size:28px;
            font-weight:800;
            letter-spacing:-1px;
            color:#7c3aed;
        }

        .nav-links{
            display:flex;
            gap:35px;
            align-items:center;
        }

        .nav-links a{
            text-decoration:none;
            color:#334155;
            font-weight:600;
            transition:0.3s;
        }

        .nav-links a:hover{
            color:#7c3aed;
        }

        .welcome{
            display:flex;
            align-items:center;
            gap:15px;
            font-weight:600;
        }

        .logout-btn{
            text-decoration:none;
            padding:10px 18px;
            border-radius:14px;

            background:rgba(255,255,255,0.4);

            backdrop-filter:blur(10px);

            color:#ef4444;

            font-size:14px;
            font-weight:700;

            transition:0.3s;
        }

        .logout-btn:hover{
            transform:translateY(-2px);
        }

        /* HERO */

        .hero{
            position:relative;
            height:88vh;

            display:flex;
            align-items:center;
            justify-content:center;

            text-align:center;
            overflow:hidden;

            padding:20px;
        }

        .hero img{
            position:absolute;
            width:100%;
            height:100%;
            object-fit:cover;
            opacity:0.35;
        }

        .hero-overlay{
            position:absolute;
            inset:0;

            background:linear-gradient(to bottom,
            rgba(255,255,255,0.05),
            rgba(248,250,252,0.6));
        }

        .hero-content{
            position:relative;
            z-index:10;

            background:rgba(255,255,255,0.22);

            backdrop-filter:blur(22px);
            -webkit-backdrop-filter:blur(22px);

            padding:55px;

            border-radius:38px;

            border:1px solid rgba(255,255,255,0.35);

            box-shadow:
                    0 20px 45px rgba(0,0,0,0.12),
                    inset 0 1px 1px rgba(255,255,255,0.4);

            max-width:820px;
        }

        .hero h1{
            font-size:64px;
            font-weight:800;
            line-height:1.1;
            margin-bottom:20px;
            letter-spacing:-2px;
            color:#1e293b;
        }

        .hero p{
            font-size:18px;
            color:#475569;
            margin-bottom:35px;
            line-height:1.8;
        }

        /* SEARCH */

        .search-box{
            display:flex;
            gap:15px;

            background:rgba(255,255,255,0.35);

            backdrop-filter:blur(18px);

            padding:14px;

            border-radius:22px;

            border:1px solid rgba(255,255,255,0.25);
        }

        .search-box input{
            flex:1;

            border:none;
            outline:none;

            padding:15px;

            font-size:15px;

            border-radius:14px;

            background:rgba(255,255,255,0.6);
        }

        .search-box button{
            border:none;

            background:linear-gradient(90deg, #7735ea, #ac66fa);

            color:white;

            padding:0 28px;

            border-radius:14px;

            cursor:pointer;

            font-weight:700;

            transition:0.3s;
        }

        .search-box button:hover{
            transform:scale(1.04);
        }

        /* MAIN */

        .container{
            max-width:1300px;
            margin:auto;
            padding:40px 25px 100px;
        }

        .section-title{
            font-size:34px;
            font-weight:800;
            margin-bottom:28px;

            display:flex;
            align-items:center;
            gap:12px;

            color:#1e293b;
        }

        .grid{
            display:grid;
            grid-template-columns:repeat(auto-fit,minmax(260px,1fr));
            gap:22px;
            margin-bottom:60px;
        }

        /* CARDS */

        .card{
            position:relative;
            overflow:hidden;

            border-radius:24px;

            background:rgba(255,255,255,0.32);

            backdrop-filter:blur(18px);
            -webkit-backdrop-filter:blur(18px);

            border:1px solid rgba(255,255,255,0.35);

            transition:0.4s;

            box-shadow:
                    0 10px 25px rgba(0,0,0,0.08),
                    inset 0 1px 1px rgba(255,255,255,0.3);
        }

        .card:hover{
            transform:translateY(-10px);

            box-shadow:
                    0 20px 40px rgba(0,0,0,0.14);
        }

        .card-image{
            position:relative;
            height:190px;
            overflow:hidden;
        }

        .card-image img{
            width:100%;
            height:100%;
            object-fit:cover;
            transition:0.5s;
        }

        .card:hover .card-image img{
            transform:scale(1.08);
        }

        .price-tag{
            position:absolute;
            top:14px;
            right:14px;

            background:rgba(15,23,42,0.88);

            color:white;

            padding:8px 14px;

            border-radius:12px;

            font-size:12px;
            font-weight:700;
        }

        .card-content{
            padding:18px;
        }

        .card-content h3{
            font-size:22px;
            margin-bottom:8px;
            color:#1e293b;
        }

        .details{
            color:#64748b;
            line-height:1.6;
            margin-bottom:18px;
            font-size:14px;
        }

        .book-btn{
            display:block;
            text-align:center;
            text-decoration:none;

            padding:12px;

            border-radius:14px;

            background:linear-gradient(90deg, #7735ea, #ac66fa);

            color:white;

            font-weight:700;

            transition:0.3s;

            font-size:14px;
        }

        .book-btn:hover{
            transform:translateY(-2px);
        }

        .package-card{
            border-top:4px solid #debbfb;
        }

        .package-btn{
            background:linear-gradient(90deg, #7735ea, #ac66fa);
        }

        /* FOOTER */

        footer{
            text-align:center;
            padding:40px;
            color:#475569;
            font-weight:500;
        }

        /* MOBILE */

        @media(max-width:768px){

            .hero{
                height:auto;
                padding:80px 20px;
            }

            .hero-content{
                padding:35px 25px;
            }

            .hero h1{
                font-size:42px;
            }

            .search-box{
                flex-direction:column;
            }

            .nav-links{
                display:none;
            }
        }

    </style>

</head>

<body>

<!-- NAVBAR -->

<nav class="navbar">

    <div class="nav-container">

        <div class="logo">
            RentalDrive
        </div>

        <div class="nav-links">
            <a href="#">Home</a>
            <a href="#">Vehicles</a>
            <a href="#">Packages</a>
            <a href="#">Contact</a>
        </div>

        <div class="welcome">

            <span>
                Welcome, <b><%= user.getName() %></b>
            </span>

            <a href="LogoutServlet" class="logout-btn">
                Logout
            </a>

        </div>

    </div>

</nav>

<!-- HERO -->

<section class="hero">

    <img src="https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?auto=format&fit=crop&w=1600&q=80">

    <div class="hero-overlay"></div>

    <div class="hero-content">

        <h1>Move With Style</h1>

        <p>
            Premium vehicle rentals and exclusive travel experiences designed
            for comfort, luxury and unforgettable journeys.
        </p>

        <div class="search-box">

            <input type="text"
                   placeholder="Search your dream car...">

            <button>
                Find Ride
            </button>

        </div>

    </div>

</section>

<!-- CONTENT -->

<div class="container">

    <!-- VEHICLES -->

    <div class="section-title">
        🚘 Our Premium Fleet
    </div>

    <div class="grid">

        <%

            try {

                VehicleFileManager vfm = new VehicleFileManager();

                for (Vehicle v : vfm.getAllVehicles()) {

                    String photo = "https://images.unsplash.com/photo-1533473359331-0135ef1b58bf?q=80&w=1000";

                    if(v.getBrand().toLowerCase().contains("toyota"))
                        photo = "https://images.unsplash.com/photo-1621007947382-bb3c3994e3fb?q=80&w=1000";

                    if(v.getBrand().toLowerCase().contains("honda"))
                        photo = "https://images.unsplash.com/photo-1599912027806-cfec9f5944b6?q=80&w=1000";

                    if(v.getBrand().toLowerCase().contains("tesla"))
                        photo = "https://images.unsplash.com/photo-1560958089-b8a1929cea89?q=80&w=1000";

        %>

        <div class="card">

            <div class="card-image">

                <img src="<%= photo %>" alt="Vehicle Image">

                <div class="price-tag">
                    LKR <%= v.getDailyRate() %>/day
                </div>

            </div>

            <div class="card-content">

                <h3>
                    <%= v.getBrand() %> <%= v.getModel() %>
                </h3>

                <div class="details">

                    ✔ Automatic Transmission <br>
                    ✔ Air Conditioned <br>
                    ✔ Unlimited Mileage

                </div>

                <a href="bookVehicle.jsp?id=<%= v.getVehicleId() %>"
                   class="book-btn">

                    Reserve This Car

                </a>

            </div>

        </div>

        <%
                }

            } catch (Exception e) {

                out.print("<h3>Error loading vehicles.</h3>");
            }

        %>

    </div>

    <!-- PACKAGES -->

    <div class="section-title">
        📦 Special Travel Packages
    </div>

    <div class="grid">

        <%

            try {

                PackageManager pm = new PackageManager();

                for (RentalPackage p : pm.getAllPackages()) {

        %>

        <div class="card package-card">

            <div class="card-image">

                <img src="https://images.unsplash.com/photo-1469854523086-cc02fe5d8800?q=80&w=1000"
                     alt="Travel Package">

            </div>

            <div class="card-content">

                <h3>
                    <%= p.getPackageName() %>
                </h3>

                <div class="details">

                    🌍 Luxury Travel Experience <br>
                    ⏳ Duration: <%= p.getDuration() %> <br>
                    💎 Premium Service Included

                </div>

                <h2 style="margin-bottom:18px;color:#7735ea;font-size:24px;">
                    LKR <%= p.getPrice() %>
                </h2>

                <a href="bookPkg.jsp?id=<%= p.getPackageId() %>"
                   class="book-btn package-btn">

                    View Package Deal

                </a>

            </div>

        </div>

        <%

                }

            } catch (Exception e) {

                out.print("<h3>Error loading packages.</h3>");
            }

        %>

    </div>

</div>

<!-- FOOTER -->

<footer>
    © 2026 RentalDrive. Luxury journeys begin here.
</footer>

</body>
</html>