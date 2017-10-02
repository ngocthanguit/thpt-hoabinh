package edu.vn.thpthoabinhbackend.dto;

import java.io.Serializable;
import java.util.UUID;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "UserDetail")
public class User implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int Id;
	@NotBlank(message = "Vui lòng nhập tên đăng nhập!")
	private String Username;
	@NotBlank(message = "Vui lòng nhập mật khẩu!")
	private String Password;
	@NotBlank(message = "Vui lòng nhập họ tên!")
	private String FullName;
	@NotBlank(message = "Vui lòng nhập email!")	
	private String Email;
	@NotBlank(message = "Vui lòng nhập số điện thoại!")
	private String Phone;
	private String Role;
	private boolean Active = true;
	private String Image;
	private String Profile;
	@Transient
	private String confirmPassword;

	public String getConfirmPassword() {
		return confirmPassword;
	}
	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
	
	@Transient
	private MultipartFile file;
			
	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	// default constructor
	public User() {
		this.Image = "USR" + UUID.randomUUID().toString();
	}
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public String getUsername() {
		return Username;
	}
	public void setUsername(String username) {
		Username = username;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	public String getFullName() {
		return FullName;
	}
	public void setFullName(String fullName) {
		FullName = fullName;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getPhone() {
		return Phone;
	}
	public void setPhone(String phone) {
		Phone = phone;
	}
	public String getRole() {
		return Role;
	}
	public void setRole(String role) {
		Role = role;
	}
	public boolean isActive() {
		return Active;
	}
	public void setActive(boolean isActive) {
		Active = isActive;
	}
	public String getImage() {
		return Image;
	}
	public void setImage(String image) {
		Image = image;
	}
	public String getProfile() {
		return Profile;
	}
	public void setProfile(String profile) {
		Profile = profile;
	}
	@Override
	public String toString() {
		return "User [Id=" + Id + ", Username=" + Username + ", Password=" + Password + ", FullName=" + FullName
				+ ", Email=" + Email + ", Phone=" + Phone + ", Role=" + Role + ", Active=" + Active + ", Image=" + Image
				+ ", Profile=" + Profile + ", confirmPassword=" + confirmPassword + ", file=" + file + "]";
	}

}
