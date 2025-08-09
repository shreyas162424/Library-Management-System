# 📚 Library Book Borrowing System

## 📖 Project Overview

The **Library Book Borrowing System** is a web-based application built using **Java Servlets** and **JSP**, designed to help librarians manage books and borrowing records.  
It allows administrators to log in, view available books, and manage borrowing requests from students.

---

## 🛠️ Technologies Used

- **Java** (JDK 8+)
- **JSP (JavaServer Pages)**
- **Servlets**
- **JDBC (Java Database Connectivity)**
- **MySQL** (for database)
- **Apache Tomcat** (server)
- **IntelliJ IDEA** (IDE)

---

## 📂 Project Structure
```
src/
├── dao/ # Data Access Objects (LibrarianDAO, BookDAO, BorrowDAO)
├── model/ # Java Models (Librarian, Book, Borrow)
├── servlet/ # Servlets for request handling
├── util/ # DBConnection utility
└── webapp/ # JSP pages and static resources

```


## ⚙️ Setup Instructions

### 1️⃣ Clone or Download

Extract the ZIP file of the project into your local machine.

### 2️⃣ Database Setup

Run the following SQL commands in **MySQL**:

```sql
CREATE DATABASE library_db;

USE library_db;

CREATE TABLE librarian (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL
);

CREATE TABLE book (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    author VARCHAR(100),
    category VARCHAR(50),
    available_quantity INT DEFAULT 1,
    added_date DATE DEFAULT CURRENT_DATE
);

CREATE TABLE borrow (
    id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(100),
    book_id INT,
    quantity INT DEFAULT 1,
    borrow_date DATE DEFAULT CURRENT_DATE,
    status VARCHAR(20) DEFAULT 'Borrowed',
    FOREIGN KEY (book_id) REFERENCES book(id)
);

INSERT INTO librarian (username, password) VALUES ('admin', 'admin123');
```
### 3️⃣ Configure Database Connection
In util/DBConnection.java, update your **MySQL username, password, and database name**:

```
private static final String URL = "jdbc:mysql://localhost:3306/library_db";
private static final String USER = "root";
private static final String PASSWORD = "your_password";
```
### 4️⃣ Run the Project in IntelliJ IDEA
1.Open IntelliJ IDEA.

2.Import the project as a Maven Project.

3.Configure Apache Tomcat in IntelliJ:

    - Go to Run → Edit Configurations → Add New Configuration → Tomcat Server.

    - Set the deployment to the war file.

4.Start the server and open the browser at:
```
http://localhost:8080/LibraryManagementSystem
```
### 📸 Features
- Librarian login/logout system.

- View all available books.

- Place borrow requests for books.

- View borrowing history.

- Cancel borrowing requests.

- Simple and responsive UI with clean CSS.


### 🖼️ Sample Pages
- **Login Page** – Librarian authentication
- ![Login Page](https://github.com/shreyas162424/EMS/blob/main/add.png?raw=true)

- **Books List Page** – Shows available books
- ![Book Page](https://github.com/shreyas162424/EMS/blob/main/add.png?raw=true)

- **Borrow Requests Page** – Displays current borrowings
![Borrow Book Page](https://github.com/shreyas162424/EMS/blob/main/add.png?raw=true)

- **Place Borrow Page** – Borrow a book by entering details
![Place Borrow Page](https://github.com/shreyas162424/EMS/blob/main/add.png?raw=true)

### 📌 Notes
- Default login:

    - **Username**:``` admin```

    - **Password**:``` admin123```

- Make sure MySQL service is running before starting the project and have added all the jar files.
