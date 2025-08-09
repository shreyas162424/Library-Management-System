<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Borrow" %>
<%@ page import="gui.BorrowUI" %>
<%@ page import="java.util.List" %>

<%
    List<Borrow> borrows = (List<Borrow>) request.getAttribute("borrows");
%>

<html>
<head><title>Borrow Records</title></head>
<body>
<h2>Borrowed Books</h2>

<%
    if (borrows != null) {
        out.print(BorrowUI.renderBorrows(borrows));
    } else {
        out.print("Thank You.");
    }
%>
<br/><br/>
<a href="librarianhome.jsp" class="btn btn-outline-primary">Back to Librarian Home</a>
</body>
</html>