package edu.vn.thpthoabinhbackend.daoimpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import edu.vn.thpthoabinhbackend.dao.CategoryDAO;
import edu.vn.thpthoabinhbackend.dto.Category;


@Repository("categoryDAO")
@Transactional
public class CategoryDAOImpl implements CategoryDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
//	private static List<Category> categories = new ArrayList<>();
//	static{
//		Category category = new Category(1, "Television", "This is some description for television", "CAT_1.png", true);
//		categories.add(category);
//		category = new Category(2, "Mobile", "This is some description for telephone", "CAT_2.png", true);
//		categories.add(category);
//		category = new Category(3, "Laptop", "This is some description for mobile", "CAT_3.png", true);
//		categories.add(category);
//	}
	@Override
	public List<Category> list() {
		String selectActiveCategory = "FROM Category WHERE Active = :active";
		return sessionFactory.getCurrentSession().createQuery(selectActiveCategory)
				.setParameter("active", true)
					.list();
	}
	@Override
	public Category get(int id) {
		
		return sessionFactory.getCurrentSession().get(Category.class, Integer.valueOf(id));
	}
	@Override
	
	public boolean add(Category category) {
		try{
			// add the category to the database table
			sessionFactory.getCurrentSession().persist(category);
			return true;
		}
		catch(Exception ex){
			ex.printStackTrace();
			return false;
		}
	}
	@Override
	public boolean update(Category category) {
		try{
			// update the category to the database table
			sessionFactory.getCurrentSession().update(category);
			return true;
		}
		catch(Exception ex){
			ex.printStackTrace();
			return false;
		}
	}
	@Override
	public boolean delete(Category category) {
		category.setActive(false);
		try{
			// update the category to the database table
			sessionFactory.getCurrentSession().update(category);
			return true;
		}
		catch(Exception ex){
			ex.printStackTrace();
			return false;
		}
	}

}

