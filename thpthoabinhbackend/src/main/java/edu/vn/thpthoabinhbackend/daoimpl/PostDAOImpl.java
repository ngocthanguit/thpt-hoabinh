package edu.vn.thpthoabinhbackend.daoimpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import edu.vn.thpthoabinhbackend.dao.PostDAO;
import edu.vn.thpthoabinhbackend.dto.Post;


@Repository("postDAO")
@Transactional
public class PostDAOImpl implements PostDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	/*
	 * SINGLE
	 * */
	
	@Override
	public Post get(int postId) {
		try {			
			return sessionFactory
					.getCurrentSession()
						.get(Post.class,Integer.valueOf(postId));			
		}
		catch(Exception ex) {		
			ex.printStackTrace();			
		}
		return null;
	}

	/*
	 * LIST
	 * */
	
	@Override
	public List<Post> list() {
		return sessionFactory
				.getCurrentSession()
					.createQuery("FROM Post")
						.list();
	}

	/*
	 * INSERT
	 * */
	@Override
	public boolean add(Post post) {
		try {			
			sessionFactory
					.getCurrentSession()
						.persist(post);
			return true;
		}
		catch(Exception ex) {		
			ex.printStackTrace();			
		}		
		return false;
	}

	/*
	 * UPDATE
	 * */
	@Override
	public boolean update(Post post) {
		try {			
			sessionFactory
					.getCurrentSession()
						.update(post);
			return true;
		}
		catch(Exception ex) {		
			ex.printStackTrace();			
		}		
		return false;		
	}

	
	/*
	 * DELETE
	 * */
	@Override
	public boolean delete(Post post) {
		try {
			
			post.setActive(false);
			// call the update method
			return this.update(post);
		}
		catch(Exception ex) {		
			ex.printStackTrace();			
		}		
		return false;			
	}

	@Override
	public List<Post> listActivePosts() {
		String selectActivePosts = "FROM Post WHERE Active = :active";
		return sessionFactory
				.getCurrentSession()
					.createQuery(selectActivePosts)
						.setParameter("active", true)
							.list();
	}

	@Override
	public List<Post> listActivePostsByCategory(int categoryId) {
		String selectActiveProductsByCategory = "FROM Post WHERE Active = :active AND CategoryId = :categoryId";
		return sessionFactory
				.getCurrentSession()
					.createQuery(selectActiveProductsByCategory)
						.setParameter("active", true)
						.setParameter("categoryId",categoryId)
							.list();
	}

	@Override
	public List<Post> getLatestActivePosts(int categoryId, int pos, int count) {
		return sessionFactory
				.getCurrentSession()
					.createQuery("FROM Post WHERE Active = :active AND CategoryId = :categoryId ORDER BY Id")
						.setParameter("active", true)
						.setParameter("categoryId",categoryId)
							.setFirstResult(pos)
							.setMaxResults(count)
								.list();
	}

	@Override
	public List<Post> getPostsByParam(String param, int count) {
		
		String query = "FROM Post WHERE Active = true ORDER BY " + param + " DESC";
		
		return sessionFactory
					.getCurrentSession()
					.createQuery(query)
					.setFirstResult(0)
					.setMaxResults(count)
					.list();
					
		
	}

	@Override
	public Long getCount(int categoryId) {
		String query = "SELECT COUNT(*) from Post WHERE Active = true and CategoryId = :id";
		return (Long)sessionFactory
				.getCurrentSession()
				.createQuery(query)
				.setParameter("id",categoryId)
				.uniqueResult();
	}

}
