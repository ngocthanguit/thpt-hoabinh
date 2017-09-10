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
					.createQuery("FROM Post" , Post.class)
						.getResultList();
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
					.createQuery(selectActivePosts, Post.class)
						.setParameter("active", true)
							.getResultList();
	}

	@Override
	public List<Post> listActivePostsByCategory(int categoryId) {
		String selectActiveProductsByCategory = "FROM Post WHERE Active = :active AND CategoryId = :categoryId";
		return sessionFactory
				.getCurrentSession()
					.createQuery(selectActiveProductsByCategory, Post.class)
						.setParameter("active", true)
						.setParameter("categoryId",categoryId)
							.getResultList();
	}

	@Override
	public List<Post> getLatestActivePosts(int count) {
		return sessionFactory
				.getCurrentSession()
					.createQuery("FROM Post WHERE Active = :active ORDER BY Id", Post.class)
						.setParameter("active", true)
//							.setFirstResult(0)
//							.setMaxResults(count)
								.getResultList();
	}

	@Override
	public List<Post> getPostsByParam(String param, int count) {
		
		String query = "FROM Post WHERE Active = true ORDER BY " + param + " DESC";
		
		return sessionFactory
					.getCurrentSession()
					.createQuery(query,Post.class)
					.setFirstResult(0)
					.setMaxResults(count)
					.getResultList();
					
		
	}

}