package edu.vn.thpthoabinhbackend.dto;

import java.io.Serializable;
import java.util.UUID;

import javax.persistence.Entity;
import javax.persistence.Id;

import org.springframework.stereotype.Component;

@Component
@Entity
public class FileUpload implements Serializable{
	private static final long serialVersionUID = 1L;
	@Id
	private String Name;
	private int AlbumId;
	
	public FileUpload() {
		this.Name = "FLE" + UUID.randomUUID().toString();
	}
	public FileUpload(int albumId) {
		this.Name = "FLE" + UUID.randomUUID().toString();
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
