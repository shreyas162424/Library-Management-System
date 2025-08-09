<%@ page contentType="text/html;charset=UTF-8" language="java" session="true" %>
<%@ page import="model.Librarian" %>
<%
    Librarian librarian = (Librarian) session.getAttribute("librarian");
    if (librarian == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Librarian Home</title>
    <style>
        body { font-family: Arial, sans-serif; background: #fdfdfd; padding: 40px; }
        h1 { color: #2c3e50; }
        .nav { margin-top: 20px; }
        .nav a {
            margin-right: 15px; text-decoration: none; color: #ffffff;
            background: #27ae60; padding: 10px 15px; border-radius: 6px;
        }
        .nav a:hover { background: #219150; }
    </style>
</head>
<body>
    <h1>Welcome, <%= librarian.getUsername() %></h1>
    <div class="nav">
        <a href="BookServlet">Manage Books</a>
        <a href="BorrowServlet">View Borrows</a>
        <a href="placeborrow.jsp">Place Borrow</a>
        <a href="LogoutServlet" style="background:#e74c3c;">Logout</a>
    </div>
</body>
</html>
