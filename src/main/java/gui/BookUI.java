package gui;

import dao.BookDAO;
import model.Book;

import javax.swing.*;
import java.awt.*;

import java.util.List;

public class BookUI {
    public static String renderBooks(List<Book> books) {
        StringBuilder html = new StringBuilder();
        html.append("<style>"
                + ".styled-table { border-collapse: collapse; margin: 25px 0; font-size: 1em; min-width: 600px; box-shadow: 0 0 20px rgba(0, 0, 0, 0.15); }"
                + ".styled-table thead tr { background-color: #009879; color: #ffffff; text-align: left; }"
                + ".styled-table th, .styled-table td { padding: 12px 15px; }"
                + ".styled-table tbody tr { border-bottom: 1px solid #dddddd; }"
                + ".styled-table tbody tr:nth-of-type(even) { background-color: #f3f3f3; }"
                + ".styled-table tbody tr:last-of-type { border-bottom: 2px solid #009879; }"
                + ".btn-danger { background-color: #e74c3c; color: white; padding: 5px 10px; border-radius: 5px; text-decoration: none; }"
                + ".btn-danger:hover { background-color: #c0392b; }"
                + "</style>");

        html.append("<table class='styled-table'>");
        html.append("<thead><tr><th>ID</th><th>Title</th><th>Author</th><th>Available</th></tr></thead><tbody>");
        for (Book book : books) {
            html.append("<tr>")
                    .append("<td>").append(book.getId()).append("</td>")
                    .append("<td>").append(book.getTitle()).append("</td>")
                    .append("<td>").append(book.getAuthor()).append("</td>")
                    .append("<td>").append(book.isAvailable() ? "Yes" : "No").append("</td>")
                    .append("</tr>");
        }
        html.append("</tbody></table>");
        return html.toString();
    }
}