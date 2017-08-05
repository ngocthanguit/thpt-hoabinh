package edu.vn.thpthoabinhbackend.dao;

import java.util.ArrayList;

import edu.vn.thpthoabinhbackend.dto.Category;

public interface CategoryDAO {
	public ArrayList<Category> list();
	public Category get(int id);
}
