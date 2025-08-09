package servlet;

import dao.BookDAO;
import dao.BorrowDAO;
import jakarta.servlet.http.HttpServlet;
import model.Borrow;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import model.Librarian;


import java.io.IOException;




//import javax.servlet.*;
//import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;

public class PlaceOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int bookId = Integer.parseInt(request.getParameter("bookId"));
        HttpSession session = request.getSession();
        Librarian librarian = (Librarian) session.getAttribute("librarian");

        Borrow borrow = new Borrow(0, bookId, librarian.getId(), Date.valueOf(LocalDate.now()));
        BorrowDAO borrowDAO = new BorrowDAO();
        borrowDAO.addBorrow(borrow);

        BookDAO bookDAO = new BookDAO();
        bookDAO.updateAvailability(bookId, false);

        response.sendRedirect("borrows.jsp");
    }
}