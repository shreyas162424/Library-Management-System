<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Place Borrow</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f8f9fa; padding: 40px; }
        form { background: white; padding: 20px; border-radius: 10px; width: 300px; margin: auto; box-shadow: 0 0 15px rgba(0,0,0,0.1); }
        h2 { text-align: center; color: #2c3e50; }
        input[type="text"] { width: 100%; padding: 10px; margin: 10px 0; border: 1px solid #ccc; border-radius: 6px; }
        button { width: 100%; padding: 10px; background: #2980b9; color: white; border: none; border-radius: 6px; font-size: 16px; }
        button:hover { background: #1f6391; cursor: pointer; }
    </style>
</head>
<body>
    <form action="PlaceOrderServlet" method="post">
        <h2>Borrow a Book</h2>
        <input type="text" name="bookId" placeholder="Enter Book ID" required />
        <button type="submit">Place Borrow</button>
    </form>
    <br/><br/>
    <a href="librarianhome.jsp" class="btn btn-outline-primary">Back to Librarian Home</a>
</body>
</html>