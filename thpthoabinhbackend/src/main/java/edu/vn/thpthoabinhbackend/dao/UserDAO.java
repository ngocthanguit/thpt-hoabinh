package edu.vn.thpthoabinhbackend.dao;

import java.util.List;

import edu.vn.thpthoabinhbackend.dto.User;

public interface UserDAO {

	// user related operation
	List<User> list();
	User getByEmail(String email);
	User getByUsername(String username);
	User get(int id);

	boolean add(User user);
	public boolean update(User user);
}
