package edu.vn.thpthoabinhbackend.dto;


import java.io.Serializable;
import java.util.Date;
import java.util.UUID;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Transient;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;
@Component
@Entity
public class Post implements Serializable {

	private static final long serialVersionUID = 1L;
	
	// private fields
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int Id;
	@NotBlank(message = "Please enter post title!")
	private String Title;
	@NotBlank(message = "Please enter post content!")
	private String PContent;
	@JsonIgnore
	private int AuthorId;
	private boolean Active;
	@JsonIgnore
	private int CategoryId;
	private int ViewCount;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss:SSSS")
	private Date DateCreated;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss:SSSS")
	private Date DateModified;
	private String Slug;
	private String Image;
	@Transient
	private MultipartFile file;
			
	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	// default constructor
	public Post() {
		this.Image = "IMG" + UUID.randomUUID().toString().substring(26).toUpperCase();
		this.Active = true;
		this.ViewCount = 0;
		this.DateCreated = new Date();
		this.DateModified = new Date();
	}

	public int getId() {
		return Id;
	}

	public void setId(int id) {
		Id = id;
	}

	public String getTitle() {
		return Title;
	}

	public void setTitle(String title) {
		Title = title;
	}

	public String getPContent() {
		return PContent;
	}

	public void setPContent(String pContent) {
		PContent = pContent;
	}

	public int getAuthorId() {
		return AuthorId;
	}

	public void setAuthorId(int authorId) {
		AuthorId = authorId;
	}

	public boolean isActive() {
		return Active;
	}

	public void setActive(boolean isActive) {
		Active = isActive;
	}

	public int getCategoryId() {
		return CategoryId;
	}

	public void setCategoryId(int categoryId) {
		CategoryId = categoryId;
	}

	public int getViewCount() {
		return ViewCount;
	}

	public void setViewCount(int viewCount) {
		ViewCount = viewCount;
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

	public String getSlug() {
		return Slug;
	}

	public void setSlug(String slug) {
		Slug = slug;
	}

	public String getImage() {
		return Image;
	}

	public void setImage(String image) {
		Image = image;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Post [Id=" + Id + ", Title=" + Title + ", PContent=" + PContent + ", AuthorId=" + AuthorId + ", Active="
				+ Active + ", CategoryId=" + CategoryId + ", ViewCount=" + ViewCount + ", DateCreated=" + DateCreated
				+ ", DateModified=" + DateModified + ", Slug=" + Slug + ", Image=" + Image + ", file=" + file + "]";
	}

}
