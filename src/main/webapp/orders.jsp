<%@ page import="java.util.List" %>
<%@ page import="model.Borrow" %>
<%@ page import="model.Order" %>
<%
    List<Order> orders = (List<Order>) request.getAttribute("orders");
%>
<!DOCTYPE html>
<html>
<head>
    <title>View Orders</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function deleteOrder(orderId, row) {
            if (!confirm("Are you sure you want to delete this order?")) return;

            fetch("DeleteOrderServlet", {
                method: "POST",
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: "id=" + orderId
            })
            .then(response => {
                if (response.ok) {
                    row.remove();
                    showToast("Order deleted successfully.");
                } else {
                    showToast("Failed to delete the order.", true);
                }
            });
        }

        function showToast(message, isError = false) {
            const toastEl = document.getElementById('liveToast');
            const toastBody = document.querySelector('.toast-body');
            toastBody.textContent = message;
            toastBody.classList.remove('text-danger', 'text-success');
            toastBody.classList.add(isError ? 'text-danger' : 'text-success');
            const toast = new bootstrap.Toast(toastEl);
            toast.show();
        }
    </script>
</head>
<body class="bg-light">

<div class="container py-5">
    <div class="card p-4 shadow-sm">
        <h2 class="mb-4">All Orders</h2>

        <table class="table table-bordered table-hover align-middle">
            <thead class="table-dark">
                <tr>
                    <th>Order ID</th>
                    <th>Item Name</th>
                    <th>Quantity</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <% if (orders != null) {
                    for (Order order : orders) { %>
                        <tr id="row-<%= order.getId() %>">
                            <td><%= order.getId() %></td>
                            <td><%= order.getItemName() %></td>
                            <td><%= order.getQuantity() %></td>
                            <td>
                                <button class="btn btn-danger btn-sm" onclick="deleteOrder(<%= order.getId() %>, document.getElementById('row-<%= order.getId() %>'))">Delete</button>
                            </td>
                        </tr>
                <%  } } %>
            </tbody>
        </table>

        <a href="admin_home.jsp" class="btn btn-outline-secondary">Back to Admin Home</a>
    </div>
</div>

<!-- Toast -->
<div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">
    <div id="liveToast" class="toast align-items-center text-white bg-dark border-0" role="alert" aria-live="assertive" aria-atomic="true">
        <div class="d-flex">
            <div class="toast-body">
                <!-- Message will be inserted here -->
            </div>
            <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
        </div>
    </div>
</div>

</body>
</html>
