package edu.vn.thpthoabinhbackend.daoimpl;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import edu.vn.thpthoabinhbackend.dao.CategoryDAO;
import edu.vn.thpthoabinhbackend.dto.Category;

@Repository("categoryDAO")
@Transactional
public class CategoryDAOImpl implements CategoryDAO{

	@Override
	public ArrayList<Category> list() {
		ArrayList<Category> list = new ArrayList<Category>();
		list.add(new Category(1, "Nguyễn Văn A"));
		list.add(new Category(2, "Nguyễn Văn B"));
		list.add(new Category(3, "Nguyễn Văn C"));
		list.add(new Category(4, "Nguyễn Văn D"));
		list.add(new Category(5, "Nguyễn Văn E"));
		return list;
	}

	@Override
	public Category get(int id) {
		switch(id){
		case 1:
			return new Category(5, "Nguyễn Văn A");
		case 2:
			return new Category(5, "Nguyễn Văn B");
		case 3:
			return new Category(5, "Nguyễn Văn C");
		case 4:
			return new Category(5, "Nguyễn Văn D");
		default:
			return new Category(5, "Nguyễn Văn E");
		}
		
	}

}
