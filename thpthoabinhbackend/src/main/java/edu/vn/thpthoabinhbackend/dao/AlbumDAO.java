package edu.vn.thpthoabinhbackend.dao;

import java.util.List;

import edu.vn.thpthoabinhbackend.dto.Album;

public interface AlbumDAO {
	Album get(int id);
	List<Album> list();
	boolean add(Album album);
	boolean update(Album album);
	boolean delete(Album album);
}
