package edu.vn.thpthoabinhbackend.daoimpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import edu.vn.thpthoabinhbackend.dao.UserDAO;
import edu.vn.thpthoabinhbackend.dto.Post;
import edu.vn.thpthoabinhbackend.dto.User;


@Repository("userDAO")
@Transactional
public class UserDAOImpl implements UserDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public User getByEmail(String email) {
		String selectQuery = "FROM User WHERE Email = :email";
		try {
			List<User> listUsers = sessionFactory
					.getCurrentSession()
						.createQuery(selectQuery)
							.setParameter("email",email)
								.list();
			if(listUsers != null && listUsers.size() > 0) {
				return listUsers.get(0);
			}
		}
		catch(Exception ex) {
			return null;
		}
		return null;			
	}

	@Override
	public boolean add(User user) {
		try {			
			sessionFactory.getCurrentSession().persist(user);			
			return true;
		}
		catch(Exception ex) {
			return false;
		}
	}

	/*
	 * UPDATE
	 * */
	@Override
	public boolean update(User user) {
		try {			
			sessionFactory
					.getCurrentSession()
						.update(user);
			return true;
		}
		catch(Exception ex) {		
			ex.printStackTrace();			
		}		
		return false;		
	}

	@Override
	public User get(int id) {
		try {			
			return sessionFactory.getCurrentSession().get(User.class, id);			
		}
		catch(Exception ex) {
			System.out.println(ex.getMessage());
			return null;
		}
	}

	@Override
	public User getByUsername(String username) {
		String selectQuery = "FROM User WHERE Username = :username";
		try {
			List<User> listUsers = sessionFactory
					.getCurrentSession()
						.createQuery(selectQuery)
							.setParameter("username",username)
								.list();
			if(listUsers != null && listUsers.size() > 0) {
				return listUsers.get(0);
			}
		}
		catch(Exception ex) {
			return null;
		}
		return null;
	}

	@Override
	public List<User> list() {
		return sessionFactory
				.getCurrentSession()
					.createQuery("FROM User WHERE Id > :id ")
					.setParameter("id", 2)
						.list();
	}

}
