package gui;


import model.Borrow;


import java.util.List;

public class BorrowUI {
    public static String renderBorrows(List<Borrow> borrows) {
        StringBuilder html = new StringBuilder();
        html.append("<style>"
                + ".styled-table { border-collapse: collapse; margin: 25px 0; font-size: 1em; min-width: 700px; box-shadow: 0 0 20px rgba(0, 0, 0, 0.15); }"
                + ".styled-table thread tr { background-color: #2c3e50; color: #ecf0f1; text-align: left; }"
                + ".styled-table th, .styled-table td { padding: 12px 15px; }"
                + ".styled-table body tr { border-bottom: 1px solid #dddddd; }"
                + ".styled-table body tr:nth-of-type(even) { background-color: #f9f9f9; }"
                + ".styled-table body tr:last-of-type { border-bottom: 2px solid #2c3e50; }"
                + ".btn-danger { background-color: #e74c3c; color: white; padding: 5px 10px; border-radius: 5px; text-decoration: none; }"
                + ".btn-danger:hover { background-color: #c0392b; }"
                + "</style>");

        html.append("<table class='styled-table'>");
        html.append("<thread><tr><th>ID</th><th>Book ID</th><th>Librarian ID</th><th>Borrow Date</th><th>Action</th></tr></thead><tbody>");
        for (Borrow borrow : borrows) {
            html.append("<tr>")
                    .append("<td>").append(borrow.getId()).append("</td>")
                    .append("<td>").append(borrow.getBookId()).append("</td>")
                    .append("<td>").append(borrow.getLibrarianId()).append("</td>")
                    .append("<td>").append(borrow.getBorrowDate()).append("</td>")
                    .append("<td><a href='DeleteBorrowServlet?id=").append(borrow.getId())
                    .append("&bookId=").append(borrow.getBookId())
                    .append("' class='btn-danger'>Delete</a></td>")
                    .append("</tr>");
        }
        html.append("</body></table>");
        return html.toString();
    }
}
