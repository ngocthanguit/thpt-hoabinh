package edu.vn.thpthoabinhbackend.dto;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import net.sourceforge.jtds.jdbc.DateTime;

@Component
@Entity
public class Album implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int Id;
	private String Name;
	private String Description;
	private int AuthorId;
	private String Type;
	private Date DateCreated;
	private Date DateModified;
	private Boolean Active;
	@Transient
	private List<MultipartFile> files;

	public List<MultipartFile> getFiles() {
		return files;
	}

	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}
	
	public Album() {
		this.Active = true;
		this.DateCreated = new Date();
		this.DateModified = new Date();
	}
	public Album(int id, String name, String description, int authorId, Date dateCreated, Date dateModified,
			Boolean activate) {
		super();
		Id = id;
		Name = name;
		Description = description;
		AuthorId = authorId;
		DateCreated = dateCreated;
		DateModified = dateModified;
		Active = activate;
	}
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getDescription() {
		return Description;
	}
	public void setDescription(String description) {
		Description = description;
	}
	public int getAuthorId() {
		return AuthorId;
	}
	public void setAuthorId(int authorId) {
		AuthorId = authorId;
	}
	public Date getDateCreated() {
		return DateCreated;
	}
	public void setDateCreated(Date dateCreated) {
		DateCreated = dateCreated;
	}
	public Date getDateModified() {
		return DateModified;
	}
	public void setDateModified(Date dateModified) {
		DateModified = dateModified;
	}
	public Boolean getActive() {
		return Active;
	}
	public void setActive(Boolean active) {
		Active = active;
	}

	public String getType() {
		return Type;
	}

	public void setType(String type) {
		Type = type;
	}
	
	
}
