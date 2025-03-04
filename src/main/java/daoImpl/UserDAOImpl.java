package daoImpl;

import dao.UserDAO;
import models.User;
import utility.DBConnection;
import java.sql.*;

public class UserDAOImpl implements UserDAO {
    @Override
    public User getUserByUsername(String username) {
        String sql = "SELECT * FROM users WHERE username = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new User(
                        rs.getInt("id"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("role")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public void registerUser(User user) {
        String sql = "INSERT INTO users (username, password, role) VALUES (?, ?, 'user')";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword()); // Use hashing for security
            ps.executeUpdate();
            System.out.println("User registered successfully: " + user.getUsername());
        } catch (SQLException e) {
            e.printStackTrace(); // This will help you see any SQL errors
        }
    }

}
