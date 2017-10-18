package edu.vn.thpthoabinhbackend.daoimpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import edu.vn.thpthoabinhbackend.dao.AlbumDAO;
import edu.vn.thpthoabinhbackend.dto.Album;

@Repository("albumDAO")
@Transactional
public class AlbumDAOImpl implements AlbumDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public Album get(int id) {
		return sessionFactory.getCurrentSession().get(Album.class, Integer.valueOf(id));
	}

	@Override
	public List<Album> list(String type) {
		String selectActiveCategory = "FROM Album WHERE Type = :type";
		return sessionFactory.getCurrentSession().createQuery(selectActiveCategory)
		.setParameter("type", type)
		 .list();
	}
	@Override
	public List<Album> getAllAlbum(String type) {
		String selectActiveCategory = "FROM Album WHERE Active = :active AND Type = :type";
		return sessionFactory.getCurrentSession().createQuery(selectActiveCategory)
		.setParameter("active", true)
		.setParameter("type", type)
		 .list();
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
