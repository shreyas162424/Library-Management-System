package servlet;

import dao.BorrowDAO;
import model.Borrow;


import jakarta.servlet.*;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;


//import javax.servlet.*;
//import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class BorrowServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BorrowDAO dao = new BorrowDAO();
        List<Borrow> borrows = dao.getAllBorrows();
        request.setAttribute("borrows", borrows);
        request.getRequestDispatcher("borrows.jsp").forward(request, response);
    }
}

