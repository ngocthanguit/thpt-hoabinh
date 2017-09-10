package edu.vn.thpthoabinhbackend.dao;

import edu.vn.thpthoabinhbackend.dto.User;

public interface UserDAO {

	// user related operation
	User getByEmail(String email);
	User get(int id);

	boolean add(User user);

}
