package edu.vn.thpthoabinhbackend.dao;

import java.util.List;

import edu.vn.thpthoabinhbackend.dto.Subject;

public interface SubjectDAO {
	Subject get(int id);
	List<Subject> list();
	boolean add(Subject subject);
	boolean update(Subject subject);
//	boolean delete(Subject subject);
}
