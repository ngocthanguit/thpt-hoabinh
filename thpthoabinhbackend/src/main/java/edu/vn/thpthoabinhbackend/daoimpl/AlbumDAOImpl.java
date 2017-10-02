package edu.vn.thpthoabinhbackend.daoimpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;

import edu.vn.thpthoabinhbackend.dao.AlbumDAO;
import edu.vn.thpthoabinhbackend.dto.Album;
import edu.vn.thpthoabinhbackend.dto.Category;

public class AlbumDAOImpl implements AlbumDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public Album get(int id) {
		return sessionFactory.getCurrentSession().get(Album.class, Integer.valueOf(id));
	}

	@Override
	public List<Album> list() {
		String selectActiveCategory = "FROM Album WHERE Active = :active";
		Query query = sessionFactory.getCurrentSession().createQuery(selectActiveCategory);
		query.setParameter("active", true);
		return query.getResultList();
	}

	@Override
	public boolean add(Album album) {
		try{
			// add the category to the database table
			sessionFactory.getCurrentSession().persist(album);
			return true;
		}
		catch(Exception ex){
			ex.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean update(Album album) {
		try{
			// update the category to the database table
			sessionFactory.getCurrentSession().update(album);
			return true;
		}
		catch(Exception ex){
			ex.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean delete(Album album) {
		album.setActive(false);
		try{
			// update the category to the database table
			sessionFactory.getCurrentSession().update(album);
			return true;
		}
		catch(Exception ex){
			ex.printStackTrace();
			return false;
		}
	}

}
