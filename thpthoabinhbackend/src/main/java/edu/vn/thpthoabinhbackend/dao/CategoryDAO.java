package edu.vn.thpthoabinhbackend.dao;

import java.util.List;

import edu.vn.thpthoabinhbackend.dto.Category;

public interface CategoryDAO {
	Category get(int id);
	List<Category> list();
	boolean add(Category category);
	boolean update(Category category);
	boolean delete(Category category);
}
