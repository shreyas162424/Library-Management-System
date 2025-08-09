<%@ page import="java.util.List" %>
<%@ page import="model.MenuItem" %>
<%@ page import="dao.MenuItemDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    MenuItemDAO menuItemDAO = new MenuItemDAO();
    List<MenuItem> menuList = menuItemDAO.getAllMenuItems();
%>
<!DOCTYPE html>
<html>
<head>
    <title>Place Order</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <style>
        select option {
            font-family: monospace; /* Use monospace font for alignment */
        }
    </style>
</head>
<body class="bg-light">

<div class="container py-5">
    <div class="card p-4 shadow-sm">
        <h2 class="mb-4">Place Order</h2>

        <% String message = (String) request.getAttribute("message"); %>
        <% if (message != null) { %>
            <div class="alert alert-success"><%= message %></div>
        <% } %>

        <form action="PlaceOrderServlet" method="post">
            <div class="mb-3">
                <label for="item" class="form-label">Menu Item</label>
                <select name="itemId" id="item" class="form-select" required>
    <% for(MenuItem item : menuList) { %>
        <option value="<%= item.getId() %>"><%= item.getName() %> - &#8377;<%= String.format("%.2f", item.getPrice()) %></option>
    <% } %>
</select>

            </div>

            <div class="mb-3">
                <label for="quantity" class="form-label">Quantity</label>
                <input type="number" name="quantity" id="quantity" class="form-control" min="1" required>
            </div>

            <button type="submit" class="btn btn-primary">Place Order</button>
            <a href="admin_home.jsp" class="btn btn-outline-secondary ms-2">Back</a>
        </form>
    </div>
</div>

</body>
</html>
