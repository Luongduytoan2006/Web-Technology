package util;
import java.sql.*;

public class DatabaseConnection {
    public static Connection getConnection() throws Exception {
        String url = "jdbc:mysql://localhost:3306/qlns_jsp_mvc_db?useUnicode=true&characterEncoding=UTF-8&useSSL=false&allowPublicKeyRetrieval=true";
        String userName = "root";
        String password = ""; // Để trống nếu XAMPP không có mật khẩu, hoặc nhập password MySQL của bạn

        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(url, userName, password);
    }
}