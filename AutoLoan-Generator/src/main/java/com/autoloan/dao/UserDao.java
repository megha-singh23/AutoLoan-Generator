package com.autoloan.dao;

import com.autoloan.model.User;

public interface UserDao {

	boolean saveUser(User user);
	User getUserByEmail(String email);
	User getUserByUsername(String username);
}
