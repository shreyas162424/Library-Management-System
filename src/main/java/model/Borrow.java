package model;

import java.sql.Date;

public class Borrow {
    private int id;
    private int bookId;
    private int librarianId;
    private Date borrowDate;

    public Borrow(int id, int bookId, int librarianId, Date borrowDate) {
        this.id = id;
        this.bookId = bookId;
        this.librarianId = librarianId;
        this.borrowDate = borrowDate;
    }

    public int getId() { return id; }
    public int getBookId() { return bookId; }
    public int getLibrarianId() { return librarianId; }
    public Date getBorrowDate() { return borrowDate; }
}

