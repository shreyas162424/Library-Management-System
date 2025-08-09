<%@ page import="model.MenuItem" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Menu</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body class="bg-light">

<div class="container py-5">
    <div class="card p-4 shadow-sm">
        <h2 class="mb-4">Manage Menu Items</h2>

        <form action="MenuServlet" method="post" class="row g-3 mb-4">
            <input type="hidden" name="action" value="add" />
            <div class="col-md-5">
                <input type="text" name="name" class="form-control" placeholder="Item Name" required />
            </div>
            <div class="col-md-3">
                <input type="text" name="price" class="form-control" placeholder="Price" required />
            </div>
            <div class="col-md-2">
                <button type="submit" class="btn btn-success w-100">Add Item</button>
            </div>
        </form>

        <table class="table table-hover table-bordered align-middle">
            <thead class="table-dark">
                <tr><th>ID</th><th>Name</th><th>Price</th><th>Actions</th></tr>
            </thead>
            <tbody>
                <%
                    List<MenuItem> items = (List<MenuItem>) request.getAttribute("menuItems");
                    for (MenuItem item : items) {
                %>
                <tr>
                    <form action="MenuServlet" method="post" class="d-flex">
                        <td>
                            <%= item.getId() %>
                            <input type="hidden" name="id" value="<%= item.getId() %>" />
                        </td>
                        <td><input type="text" name="name" value="<%= item.getName() %>" class="form-control" /></td>
                        <td><input type="text" name="price" value="<%= item.getPrice() %>" class="form-control" /></td>
                        <td>
                            <div class="d-flex gap-2">
                                <button type="submit" name="action" value="update" class="btn btn-sm btn-primary">Update</button>
                                <button type="submit" name="action" value="delete" class="btn btn-sm btn-danger">Delete</button>
                            </div>
                        </td>
                    </form>
                </tr>
                <% } %>
            </tbody>
        </table>

        <a href="admin_home.jsp" class="btn btn-outline-secondary">Back to Admin Home</a>
    </div>
</div>

</body>
</html>
