package edu.vn.thpthoabinhbackend.dto;

import java.io.Serializable;

import net.sourceforge.jtds.jdbc.DateTime;

public class Album implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private int Id;
	private String Name;
	private String Description;
	private int AuthorId;
	private DateTime DateCreated;
	private DateTime DateModified;
	private Boolean Active;
	public Album() {
		super();
	}
	public Album(int id, String name, String description, int authorId, DateTime dateCreated, DateTime dateModified,
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
	public DateTime getDateCreated() {
		return DateCreated;
	}
	public void setDateCreated(DateTime dateCreated) {
		DateCreated = dateCreated;
	}
	public DateTime getDateModified() {
		return DateModified;
	}
	public void setDateModified(DateTime dateModified) {
		DateModified = dateModified;
	}
	public Boolean getActive() {
		return Active;
	}
	public void setActive(Boolean active) {
		Active = active;
	}
	
	
}
