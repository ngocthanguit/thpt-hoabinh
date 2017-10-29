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
	private static int START_ID = 11;
	@Autowired
	private SessionFactory sessionFactory;
	
	/*
	 * SINGLE
	 * */
	
	@Override
	public Post get(int postId) {
		if(postId >= START_ID) {
			try {			
				return sessionFactory
						.getCurrentSession()
							.get(Post.class,Integer.valueOf(postId));			
			}
			catch(Exception ex) {		
				ex.printStackTrace();			
			}
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
					.createQuery("FROM Post WHERE Id >= :id")
					.setParameter("id", START_ID)
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
	public boolean deActive(Post post) {
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
	public boolean delete(Post post) {
		try {
			sessionFactory
			.getCurrentSession()
				.delete(post);
			return true;
		}
		catch(Exception ex) {		
			ex.printStackTrace();			
		}		
		return false;			
	}

	@Override
	public List<Post> listActivePosts() {
		String selectActivePosts = "FROM Post WHERE Active = :active AND Id >= :id";
		return sessionFactory
				.getCurrentSession()
					.createQuery(selectActivePosts)
						.setParameter("active", true)
						.setParameter("id", START_ID)
							.list();
	}

	@Override
	public List<Post> listActivePostsByCategory(int categoryId) {
		String selectActiveProductsByCategory = "FROM Post WHERE Active = :active AND CategoryId = :categoryId AND Id >= :id ORDER BY Id DESC";
		return sessionFactory
				.getCurrentSession()
					.createQuery(selectActiveProductsByCategory)
						.setParameter("active", true)
						.setParameter("categoryId",categoryId)
						.setParameter("id", START_ID)
							.list();
	}

	@Override
	public List<Post> getLatestActivePosts(int categoryId, int pos, int count) {
		return sessionFactory
				.getCurrentSession()
					.createQuery("FROM Post WHERE Active = :active AND CategoryId = :categoryId AND Id >= :id ORDER BY Id DESC")
						.setParameter("active", true)
						.setParameter("categoryId",categoryId)
							.setFirstResult(pos)
							.setMaxResults(count)
							.setParameter("id", START_ID)
								.list();
	}

	@Override
	public List<Post> getPostsByParam(String param, int count) {
		
		String query = "FROM Post WHERE Active = true AND Id >= :id ORDER BY " + param + " DESC";
		
		return sessionFactory
					.getCurrentSession()
					.createQuery(query)
					.setParameter("id", START_ID)
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

	@Override
	public Post getPage(String page) {
		String selectActiveProductsByCategory = "FROM Post WHERE Slug = :page AND Id < :id";
		List<Post> listPosts = sessionFactory
				.getCurrentSession()
					.createQuery(selectActiveProductsByCategory)
						.setParameter("page", page)
						.setParameter("id", START_ID)
							.list();
		if(listPosts != null && listPosts.size() > 0) {
			return listPosts.get(0);
		}
		return null;
	}

	@Override
	public List<Post> searchPosts(String key, int pos, int count) {
		return sessionFactory
				.getCurrentSession()
					.createQuery("FROM Post WHERE Active = :active AND Title LIKE :key AND Id >= :id ORDER BY Id DESC")
						.setParameter("active", true)
						.setParameter("key","%"+key+"%")
							.setFirstResult(pos)
							.setMaxResults(count)
							.setParameter("id", START_ID)
								.list();
	}
	@Override
	public Long getCount(String key) {
		String query = "SELECT COUNT(*) from Post WHERE Active = :active AND Title LIKE :key AND Id >= :id";
		return (Long)sessionFactory
				.getCurrentSession()
				.createQuery(query)
				.setParameter("active", true)
				.setString("key","%"+key+"%")
				.setParameter("id", START_ID)
				.uniqueResult();
	}
}
