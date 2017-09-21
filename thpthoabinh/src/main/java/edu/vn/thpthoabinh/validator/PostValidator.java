package edu.vn.thpthoabinh.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import edu.vn.thpthoabinhbackend.dto.Post;

public class PostValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return Post.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		Post post = (Post) target;
		if(post.getFile() == null || post.getFile().getOriginalFilename().equals("")) {
			errors.rejectValue("file", null, "Vui lòng chọn một file ảnh để upload!");
			return;
		}
		if(! (post.getFile().getContentType().equals("image/jpeg") || 
				post.getFile().getContentType().equals("image/png")) ||
				post.getFile().getContentType().equals("image/gif")
			 )
			{
				errors.rejectValue("file", null, "Vui lòng lựa chọn file hình ảnh!");
				return;	
			}

	}

}
