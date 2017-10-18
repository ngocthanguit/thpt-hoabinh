package edu.vn.thpthoabinhbackend.daoimpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import edu.vn.thpthoabinhbackend.dao.SubjectDAO;
import edu.vn.thpthoabinhbackend.dto.Subject;


@Repository("subjectDAO")
@Transactional
public class SubjectDAOImpl implements SubjectDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
//	private static List<Subject> categories = new ArrayList<>();
//	static{
//		Subject subject = new Subject(1, "Television", "This is some description for television", "CAT_1.png", true);
//		categories.add(subject);
//		subject = new Subject(2, "Mobile", "This is some description for telephone", "CAT_2.png", true);
//		categories.add(subject);
//		subject = new Subject(3, "Laptop", "This is some description for mobile", "CAT_3.png", true);
//		categories.add(subject);
//	}
	@Override
	public List<Subject> list() {
		String selectActiveSubject = "FROM Subject";
		return sessionFactory.getCurrentSession().createQuery(selectActiveSubject)
		 .list();
	}
	@Override
	public Subject get(int id) {
		
		return sessionFactory.getCurrentSession().get(Subject.class, Integer.valueOf(id));
	}
	@Override
	
	public boolean add(Subject subject) {
		try{
			// add the subject to the database table
			sessionFactory.getCurrentSession().persist(subject);
			return true;
		}
		catch(Exception ex){
			ex.printStackTrace();
			return false;
		}
	}
	@Override
	public boolean update(Subject subject) {
		try{
			// update the subject to the database table
			sessionFactory.getCurrentSession().update(subject);
			return true;
		}
		catch(Exception ex){
			ex.printStackTrace();
			return false;
		}
	}
//	@Override
//	public boolean delete(Subject subject) {
//		subject.setActive(false);
//		try{
//			// update the subject to the database table
//			sessionFactory.getCurrentSession().update(subject);
//			return true;
//		}
//		catch(Exception ex){
//			ex.printStackTrace();
//			return false;
//		}
//	}

}

