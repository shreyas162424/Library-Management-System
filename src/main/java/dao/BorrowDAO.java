package dao;

import model.Borrow;
import util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


import java.sql.*;
import java.util.*;

public class BorrowDAO {
    public void addBorrow(Borrow borrow) {
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "INSERT INTO borrows(book_id, librarian_id, borrow_date) VALUES (?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, borrow.getBookId());
            stmt.setInt(2, borrow.getLibrarianId());
            stmt.setDate(3, borrow.getBorrowDate());
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Borrow> getAllBorrows() {
        List<Borrow> list = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection()) {
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM borrows");
            while (rs.next()) {
                list.add(new Borrow(
                        rs.getInt("id"),
                        rs.getInt("book_id"),
                        rs.getInt("librarian_id"),
                        rs.getDate("borrow_date")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public void deleteBorrow(int id) {
        try (Connection conn = DBConnection.getConnection()) {
            PreparedStatement stmt = conn.prepareStatement("DELETE FROM borrows WHERE id=?");
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
