package edu.vn.thpthoabinh.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import edu.vn.thpthoabinhbackend.dao.CategoryDAO;
import edu.vn.thpthoabinhbackend.dao.PostDAO;
import edu.vn.thpthoabinhbackend.dto.Category;
import edu.vn.thpthoabinhbackend.dto.Post;

@Controller
public class PageController {
	private static final int  TIN_TUC = 1;
	private static final int  THONG_BAO_CHUNG = 2;
	private static final int  THONG_BAO_GIAO_VIEN = 3;
	private static final int  TKB = 4;
	private static final int  THONG_TIN_HOAT_DONG = 5;
	private static final int  GIAO_DUC_KHUYEN_HOC = 6;
	private static final int  CONG_DOAN = 7;
	private static final int  TUYEN_SINH = 8;
	private static final int  DOAN_THANH_NIEN = 9;
	
	@Autowired
	private CategoryDAO categoryDAO;
	@Autowired
	private PostDAO postDAO;
	
	@RequestMapping(value = {"/"})
	public ModelAndView index(){
		ModelAndView mv = new ModelAndView("test");
		//passing the list of category
		mv.addObject("categories",categoryDAO.list());
		List<Post> listTinTuc = postDAO.getLatestActivePosts(TIN_TUC, 0, 10);
		if(listTinTuc != null && listTinTuc.size() > 0) {
			mv.addObject("listTinTuc", listTinTuc);
		}
		List<Post> listThongBaoChung = postDAO.getLatestActivePosts(THONG_BAO_CHUNG, 0, 10);
		if(listThongBaoChung != null && listThongBaoChung.size() > 0) {
			mv.addObject("listThongBaoChung", listThongBaoChung);
		}
		List<Post> listThongBaoGiaoVien = postDAO.getLatestActivePosts(THONG_BAO_GIAO_VIEN, 0, 10);
		if(listThongBaoGiaoVien != null && listThongBaoGiaoVien.size() > 0) {
			mv.addObject("listThongBaoGiaoVien", listThongBaoGiaoVien);
		}
		List<Post> listTKB = postDAO.getLatestActivePosts(TKB, 0, 10);
		if(listTKB != null && listTKB.size() > 0) {
			mv.addObject("listTKB", listTKB);
		}
		List<Post> listThongTinHoatDong = postDAO.getLatestActivePosts(THONG_TIN_HOAT_DONG, 0, 10);
		if(listThongTinHoatDong != null && listThongTinHoatDong.size() > 0) {
			mv.addObject("listThongTinHoatDong", listThongTinHoatDong);
		}
		List<Post> listGDKH = postDAO.getLatestActivePosts(GIAO_DUC_KHUYEN_HOC, 0, 10);
		if(listGDKH != null && listGDKH.size() > 0) {
			mv.addObject("listGDKH", listGDKH);
		}
		List<Post> listCongDoan = postDAO.getLatestActivePosts(CONG_DOAN, 0, 10);
		if(listCongDoan != null && listCongDoan.size() > 0) {
			mv.addObject("listCongDoan", listCongDoan);
		}
		List<Post> listTuyenSinh = postDAO.getLatestActivePosts(TUYEN_SINH, 0, 10);
		if(listTuyenSinh != null && listTuyenSinh.size() > 0) {
			mv.addObject("listTuyenSinh", listTuyenSinh);
		}
		List<Post> listDoanThanhNien = postDAO.getLatestActivePosts(DOAN_THANH_NIEN, 0, 10);
		if(listDoanThanhNien != null && listDoanThanhNien.size() > 0) {
			mv.addObject("listDoanThanhNien", listDoanThanhNien);
		}
		
		
		mv.addObject("title", "Home");
		mv.addObject("userClickHome", true);
		return mv;
	}
	@RequestMapping(value = {"/home", "/index"})
	public ModelAndView index1(){
		ModelAndView mv = new ModelAndView("page");
		//passing the list of category
		mv.addObject("categories",categoryDAO.list());
		mv.addObject("title", "Home");
		mv.addObject("userClickHome", true);
		return mv;
	}
	
	@RequestMapping(value = "about")
	public ModelAndView about(){
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "About Us");
		mv.addObject("userClickAbout", true);
		return mv;
	}
	
	@RequestMapping(value = "contact")
	public ModelAndView contact(){
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "Contact Us");
		mv.addObject("userClickContact", true);
		return mv;
	}
	//Methods to load all the posts and based on category
		@RequestMapping(value = "/show/post/{id}")
		public ModelAndView showPost(@PathVariable("id")int id){
			ModelAndView mv = new ModelAndView("test");
			Post post = postDAO.get(id);
			mv.addObject("title", post.getTitle());
			//passing the list of category
			mv.addObject("categories",categoryDAO.list());
			mv.addObject("latestPosts", postDAO.getLatestActivePosts(TIN_TUC, 0, 10));
			mv.addObject("post", post);
			mv.addObject("userClickPost", true);
			return mv;
		}
	//Methods to load all the posts and based on category
	@RequestMapping(value = "/show/all/posts")
	public ModelAndView showAllPosts(){
		ModelAndView mv = new ModelAndView("page");
		
		mv.addObject("title", "All Posts");
		//passing the list of category
		mv.addObject("categories",categoryDAO.list());
		mv.addObject("userClickAllPosts", true);
		return mv;
	}
	@RequestMapping(value = "/show/category/{id}/posts")
	public ModelAndView showCategoryPosts(@PathVariable("id")int id){
		ModelAndView mv = new ModelAndView("page");
		
		//categoryDAO to fetch a single category
		Category category = null;
		category = categoryDAO.get(id);
		mv.addObject("title", category.getName());
		//passing the list of categories
		mv.addObject("categories",categoryDAO.list());
		//passing a single category
		mv.addObject("category",category);
		mv.addObject("userClickCategoryPosts", true);
		return mv;
	}
	
	@RequestMapping(value="/login")
	public ModelAndView login(@RequestParam(name="error", required = false)	String error,
			@RequestParam(name="logout", required = false) String logout) {
		ModelAndView mv= new ModelAndView("login");
		mv.addObject("title", "Login");
		if(error!=null) {
			mv.addObject("message", "Sai username hoặc password!");
		}
		if(logout!=null) {
			mv.addObject("logout", "Bạn đã đăng xuất thành công!");
		}
		return mv;
	}
	
	@RequestMapping(value="/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		// Invalidates HTTP Session, then unbinds any objects bound to it.
	    // Removes the authentication from securitycontext 		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    if (auth != null){    
	        new SecurityContextLogoutHandler().logout(request, response, auth);
	    }
		
		return "redirect:/login?logout";
	}	
	
	
	@RequestMapping(value="/access-denied")
	public ModelAndView accessDenied() {
		ModelAndView mv = new ModelAndView("error");		
		mv.addObject("errorTitle", "Aha! Caught You.");		
		mv.addObject("errorDescription", "You are not authorized to view this page!");		
		mv.addObject("title", "403 Access Denied");		
		return mv;
	}	
//	@RequestMapping(value="/test")
//	public ModelAndView test(@RequestParam(value="greeting", required=false)String greeting){
//		if(greeting == null){
//			greeting = "Hello this is default greeting!!!";
//		}
//		ModelAndView mv = new ModelAndView("page");
//		mv.addObject("greeting", greeting);
//		return mv;
//	}
//	@RequestMapping(value="/test/{greeting}")
//	public ModelAndView test(@PathVariable("greeting")String greeting){
//		if(greeting == null){
//			greeting = "Hello this is default greeting!!!";
//		}
//		ModelAndView mv = new ModelAndView("page");
//		mv.addObject("greeting", greeting);
//		return mv;
//	}

}
