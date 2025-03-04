package dao;

import models.User;

public interface UserDAO {
    User getUserByUsername(String username);
    void registerUser(User user);
}
