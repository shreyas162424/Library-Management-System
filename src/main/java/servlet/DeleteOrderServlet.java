package servlet;

import dao.BookDAO;
import dao.BorrowDAO;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/DeleteBorrowServlet")

public class DeleteOrderServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int borrowId = Integer.parseInt(request.getParameter("id"));
        int bookId = Integer.parseInt(request.getParameter("bookId"));

        BorrowDAO borrowDAO = new BorrowDAO();
        borrowDAO.deleteBorrow(borrowId);

        BookDAO bookDAO = new BookDAO();
        bookDAO.updateAvailability(bookId, true);

        response.sendRedirect("borrows.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}

