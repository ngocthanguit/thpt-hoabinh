package edu.vn.thpthoabinhbackend.dao;

import java.util.List;

import edu.vn.thpthoabinhbackend.dto.Post;

public interface PostDAO {

	Post get(int postId);
	List<Post> list();	
	boolean add(Post post);
	boolean update(Post post);
	boolean delete(Post post);

	List<Post> getPostsByParam(String param, int count);	
	
	
	// business methods
	List<Post> listActivePosts();	
	List<Post> listActivePostsByCategory(int categoryId);
	List<Post> getLatestActivePosts(int count);
	
}