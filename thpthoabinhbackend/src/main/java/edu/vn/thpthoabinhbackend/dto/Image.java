package edu.vn.thpthoabinhbackend.dto;

import java.io.Serializable;

public class Image implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private String Name;
	private int AlbumId;
	public Image(String name, int albumId) {
		super();
		Name = name;
		AlbumId = albumId;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public int getAlbumId() {
		return AlbumId;
	}
	public void setAlbumId(int albumId) {
		AlbumId = albumId;
	}
	
	
}
