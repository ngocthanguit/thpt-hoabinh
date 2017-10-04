package edu.vn.thpthoabinhbackend.daoimpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import edu.vn.thpthoabinhbackend.dao.FileUploadDAO;
import edu.vn.thpthoabinhbackend.dto.FileUpload;

@Repository("fileUploadDAO")
@Transactional
public class FileUploadDAOImpl implements FileUploadDAO{

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public FileUpload get(String name) {
		return sessionFactory.getCurrentSession().get(FileUpload.class, name);
	}

	@Override
	public List<FileUpload> list() {
		String selectActiveCategory = "FROM File";
		Query query = sessionFactory.getCurrentSession().createQuery(selectActiveCategory);
		return query.getResultList();
	}

	@Override
	public boolean add(FileUpload file) {
		try{
			// add the category to the database table
			sessionFactory.getCurrentSession().persist(file);
			return true;
		}
		catch(Exception ex){
			ex.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean update(FileUpload file) {
		try{
			// update the category to the database table
			sessionFactory.getCurrentSession().update(file);
			return true;
		}
		catch(Exception ex){
			ex.printStackTrace();
			return false;
		}
	}

	@Override
	public List<FileUpload> getByAlbumId(int albumId) {
		String selectFile = "FROM FileUpload WHERE AlbumId = :id";
		return sessionFactory
				.getCurrentSession()
					.createQuery(selectFile, FileUpload.class)
						.setParameter("id", albumId)
							.getResultList();
	}

//	@Override
//	public boolean delete(File file) {
//		file.setActive(false);
//		try{
//			// update the category to the database table
//			sessionFactory.getCurrentSession().update(file);
//			return true;
//		}
//		catch(Exception ex){
//			ex.printStackTrace();
//			return false;
//		}
//	}

}
