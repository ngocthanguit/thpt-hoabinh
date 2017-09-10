package edu.vn.thpthoabinh.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.vn.thpthoabinhbackend.dao.PostDAO;
import edu.vn.thpthoabinhbackend.dto.Post;

@Controller
@RequestMapping("/json/data")
public class JsonDataController {

	@Autowired
	private PostDAO postDAO;
	

	@RequestMapping("/admin/all/posts")
	@ResponseBody
	public List<Post> getAllPostsList() {		
		return postDAO.list();
				
	}	
	
	
	@RequestMapping("/all/posts")
	@ResponseBody
	public List<Post> getAllPosts() {
		
		return postDAO.listActivePosts();
				
	}
	
	@RequestMapping("/category/{id}/products")
	@ResponseBody
	public List<Post> getPostsByCategory(@PathVariable int id) {
		
		return postDAO.listActivePostsByCategory(id);
				
	}
	
	
	@RequestMapping("/mv/posts")
	@ResponseBody
	public List<Post> getMostViewedPosts() {		
		return postDAO.getPostsByParam("views", 5);				
	}
		
	@RequestMapping("/mp/products")
	@ResponseBody
	public List<Post> getMostPurchasedPosts() {		
		return postDAO.getPostsByParam("purchases", 5);				
	}
	
	
	
	
}
