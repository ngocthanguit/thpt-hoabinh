package edu.vn.thpthoabinhbackend.dto;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Category {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int Id;
	
	private String Name;
	
	private String Description;
	
	private String ImageUrl;
	
	private boolean IsActive = true;
	
	
	public Category() {
		super();
	}
	public Category(int id, String name, String description, String imageUrl, boolean isActive) {
		super();
		Id = id;
		Name = name;
		Description = description;
		ImageUrl = imageUrl;
		IsActive = isActive;
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


	public String getImageUrl() {
		return ImageUrl;
	}


	public void setImageUrl(String imageUrl) {
		ImageUrl = imageUrl;
	}


	public boolean isIsActive() {
		return IsActive;
	}


	public void setIsActive(boolean isActive) {
		IsActive = isActive;
	}
	@Override
	public String toString() {
		return "Category [Id=" + Id + ", Name=" + Name + ", Description=" + Description + ", ImageUrl=" + ImageUrl
				+ ", IsActive=" + IsActive + "]";
	}

}
