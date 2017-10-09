package edu.vn.thpthoabinh.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import edu.vn.thpthoabinhbackend.dto.Post;

public class PostValidator implements Validator {

//	@Override
//	public boolean supports(Class<?> arg0) {
//		return Post.class.equals(clazz);
//	}

//	@Override
//	public void validate(Object arg0, Errors arg1) {
//		
//		Post post = (Post) target;
////		if(post.getFile() == null || post.getFile().getOriginalFilename().equals("")) {
////			errors.rejectValue("file", null, "Vui lòng chọn một file ảnh để upload!");
////			return;
////		}
//		if(! (post.getFile().getContentType().equals("image/jpeg") || 
//				post.getFile().getContentType().equals("image/png")) ||
//				post.getFile().getContentType().equals("image/gif")
//			 )
//			{
//				errors.rejectValue("file", null, "Vui lòng lựa chọn file hình ảnh!");
//				return;	
//			}
//
//	}

public boolean supports(Class<?> arg0) {
	// TODO Auto-generated method stub
	return Post.class.equals(arg0);
}

public void validate(Object arg0, Errors arg1) {
	Post post = (Post) arg0;
//if(post.getFile() == null || post.getFile().getOriginalFilename().equals("")) {
//	errors.rejectValue("file", null, "Vui lòng chọn một file ảnh để upload!");
//	return;
//}
if(! (post.getFile().getContentType().equals("image/jpeg") || 
		post.getFile().getContentType().equals("image/png")) ||
		post.getFile().getContentType().equals("image/gif")
	 )
	{
		arg1.rejectValue("file", null, "Vui lòng lựa chọn file hình ảnh!");
		return;	
	}
	
}



}
