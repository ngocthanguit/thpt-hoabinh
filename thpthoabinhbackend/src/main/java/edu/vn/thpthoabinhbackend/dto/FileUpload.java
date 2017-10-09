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
	private String DisplayName;
	
	public FileUpload() {
		this.Name = "FLE" + UUID.randomUUID().toString();
	}
	public FileUpload(int albumId, String displayname) {
		this.Name = "FLE" + UUID.randomUUID().toString();
		AlbumId = albumId;
		DisplayName = displayname;
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
	public String getDisplayName() {
		return DisplayName;
	}
	public void setDisplayName(String displayName) {
		DisplayName = displayName;
	}
	
	
}
