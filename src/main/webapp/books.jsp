<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Book" %>

<%
    List<Book> books = (List<Book>) request.getAttribute("books");
    String message = (String) request.getAttribute("message");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Manage Books</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body class="bg-light">

<div class="container py-5">
    <h2 class="mb-4">Manage Books</h2>



    <% if (message != null) { %>
        <div class="alert alert-info"><%= message %></div>
    <% } %>

    <!-- Books Table -->
    <table class="table table-bordered table-striped">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Author</th>
                <th>Available</th>
            </tr>
        </thead>
        <tbody>
            <% if (books != null && !books.isEmpty()) {
                for (Book book : books) { %>
                    <tr>
                        <td><%= book.getId() %></td>
                        <td><%= book.getTitle() %></td>
                        <td><%= book.getAuthor() %></td>
                        <td><%= book.isAvailable() ? "Yes" : "No" %></td>
                    </tr>
            <%  }
            } else { %>
                <tr><td colspan="4" class="text-center">No books found.</td></tr>
            <% } %>
        </tbody>
    </table>

    <a href="librarianhome.jsp" class="btn btn-outline-secondary mt-3">Back to Home</a>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
