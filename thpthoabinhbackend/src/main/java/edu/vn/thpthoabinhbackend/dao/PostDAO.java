package edu.vn.thpthoabinhbackend.dao;

import java.util.List;

import edu.vn.thpthoabinhbackend.dto.Post;

public interface PostDAO {

	Post get(int postId);
	List<Post> list();	
	Post getPage(String page);
	boolean add(Post post);
	boolean update(Post post);
	boolean delete(Post post);
	boolean deActive(Post post);

	List<Post> getPostsByParam(String param, int count);	
	
	
	// business methods
	List<Post> listActivePosts();	
	List<Post> listActivePostsByCategory(int categoryId);
	List<Post> getLatestActivePosts(int categoryId, int pos, int count);
	List<Post> searchPosts(String key, int pos, int count);
	Long getCount(int categoryId);
	Long getCount(String key);
}
