package edu.vn.thpthoabinhbackend.dao;

import java.util.List;

import edu.vn.thpthoabinhbackend.dto.FileUpload;

public interface FileUploadDAO {
	FileUpload get(String name);
	List<FileUpload> getByAlbumId(int albumId);
	List<FileUpload> list();
	boolean add(FileUpload album);
	boolean update(FileUpload album);
	boolean delete(int albumId);
}
