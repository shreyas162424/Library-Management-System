<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    if (session == null || session.getAttribute("admin") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Admin Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
    <style>
        body, html {
            height: 100%;
            margin: 0;
            background: 
                linear-gradient(to bottom right, rgba(0,0,0,0.4), rgba(0,0,0,0.7)), 
                url('https://images.unsplash.com/photo-1509042239860-f550ce710b93?auto=format&fit=crop&w=1950&q=80') no-repeat center center fixed;
            background-size: cover;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .admin-card {
            background-color: rgba(255, 255, 255, 0.98);
            padding: 2rem 2.5rem;
            border-radius: 1rem;
            box-shadow: 0 10px 30px rgba(0,0,0,0.3);
            width: 350px;
            text-align: center;
        }

        .admin-title {
            font-size: 1.6rem;
            font-weight: bold;
            margin-bottom: 1.5rem;
            color: #333;
        }

        .admin-options a {
            display: flex;
            align-items: center;
            gap: 10px;
            padding: 12px 16px;
            margin-bottom: 10px;
            border-radius: 8px;
            text-decoration: none;
            color: #333;
            background-color: #f8f9fa;
            transition: background-color 0.3s ease;
        }

        .admin-options a:hover {
            background-color: #e9ecef;
        }

        .admin-options a i {
            font-size: 1.3rem;
            color: #007bff;
        }

        .admin-options a.logout {
            color: #dc3545;
            background-color: #fff3f3;
        }

        .admin-options a.logout i {
            color: #dc3545;
        }

        .admin-options a.logout:hover {
            background-color: #ffe0e0;
        }

        .center-container {
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
    </style>
</head>
<body>

<div class="center-container">
    <div class="admin-card">
        <div class="admin-title">
            <i class="fas fa-user-shield"></i> Welcome, Admin
        </div>
        <div class="admin-options d-grid gap-2">
            <a href="MenuServlet"><i class="fas fa-utensils"></i> Manage Menu</a>
            <a href="OrderServlet"><i class="fas fa-clipboard-list"></i> View Orders</a>
            <a href="PlaceOrderServlet"><i class="fas fa-cart-plus"></i> Place Order</a>
            <a href="LogoutServlet" class="logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </div>
    </div>
</div>

</body>
</html>
