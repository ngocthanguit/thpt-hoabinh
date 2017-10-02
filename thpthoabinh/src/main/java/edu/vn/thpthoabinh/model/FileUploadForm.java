package edu.vn.thpthoabinh.model;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class FileUploadForm {
	private List<MultipartFile> files;

	public FileUploadForm() {
		super();
	}

	public List<MultipartFile> getFiles() {
		return files;
	}

	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}
}
