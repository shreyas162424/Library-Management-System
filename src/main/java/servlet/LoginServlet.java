package servlet;
import dao.LibrarianDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;


import java.io.IOException;




import jakarta.servlet.*;
import jakarta.servlet.http.*;
import model.Librarian;


public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        LibrarianDAO dao = new LibrarianDAO();
        Librarian librarian = dao.validate(username, password);

        if (librarian != null) {
            HttpSession session = request.getSession();
            session.setAttribute("librarian", librarian);
            response.sendRedirect("librarianhome.jsp");
        } else {
            request.setAttribute("error", "Invalid username or password.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }}

