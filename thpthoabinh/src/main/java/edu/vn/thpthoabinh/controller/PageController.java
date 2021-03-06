package edu.vn.thpthoabinh.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.UriUtils;

import edu.vn.thpthoabinh.exception.PostNotFoundException;
import edu.vn.thpthoabinh.util.FileUtil;
import edu.vn.thpthoabinhbackend.dao.AlbumDAO;
import edu.vn.thpthoabinhbackend.dao.CategoryDAO;
import edu.vn.thpthoabinhbackend.dao.FileUploadDAO;
import edu.vn.thpthoabinhbackend.dao.PostDAO;
import edu.vn.thpthoabinhbackend.dao.UserDAO;
import edu.vn.thpthoabinhbackend.dto.Album;
import edu.vn.thpthoabinhbackend.dto.Category;
import edu.vn.thpthoabinhbackend.dto.FileUpload;
import edu.vn.thpthoabinhbackend.dto.Post;
import edu.vn.thpthoabinhbackend.dto.User;

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
	private static final int  NUM_POST = 6;
	
	@Autowired
	private CategoryDAO categoryDAO;
	@Autowired
	private PostDAO postDAO;
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private PasswordEncoder passwordEncoder;
	@Autowired
	private AlbumDAO albumDAO;
	@Autowired
	private FileUploadDAO fileUploadDAO;
	
	@RequestMapping(value = {"/"})
	public ModelAndView index(){
		ModelAndView mv = new ModelAndView("page");
		//passing the list of category
		mv.addObject("categories",categoryDAO.list());
		List<Post> listTinTuc = postDAO.getLatestActivePosts(TIN_TUC, 0, NUM_POST);
		if(listTinTuc != null && listTinTuc.size() > 0) {
			mv.addObject("listTinTuc", listTinTuc);
			mv.addObject("TinTucFirstContent", parseContent(listTinTuc.get(0).getPContent()));
		}
		List<Post> listThongBaoChung = postDAO.getLatestActivePosts(THONG_BAO_CHUNG, 0, 10);
		if(listThongBaoChung != null && listThongBaoChung.size() > 0) {
			mv.addObject("listThongBaoChung", listThongBaoChung);
		}
		List<Post> listThongBaoGiaoVien = postDAO.getLatestActivePosts(THONG_BAO_GIAO_VIEN, 0, NUM_POST);
		if(listThongBaoGiaoVien != null && listThongBaoGiaoVien.size() > 0) {
			mv.addObject("listThongBaoGiaoVien", listThongBaoGiaoVien);
		}
		List<Post> listTKB = postDAO.getLatestActivePosts(TKB, 0, NUM_POST);
		if(listTKB != null && listTKB.size() > 0) {
			mv.addObject("listTKB", listTKB);
		}
		List<Post> listThongTinHoatDong = postDAO.getLatestActivePosts(THONG_TIN_HOAT_DONG, 0, NUM_POST);
		if(listThongTinHoatDong != null && listThongTinHoatDong.size() > 0) {
			mv.addObject("listThongTinHoatDong", listThongTinHoatDong);
			mv.addObject("ThongTinHoatDongFirstContent", parseContent(listThongTinHoatDong.get(0).getPContent()));
		}
		List<Post> listGDKH = postDAO.getLatestActivePosts(GIAO_DUC_KHUYEN_HOC, 0, NUM_POST);
		if(listGDKH != null && listGDKH.size() > 0) {
			mv.addObject("listGDKH", listGDKH);
		}
		List<Post> listCongDoan = postDAO.getLatestActivePosts(CONG_DOAN, 0, NUM_POST);
		if(listCongDoan != null && listCongDoan.size() > 0) {
			mv.addObject("listCongDoan", listCongDoan);
		}
		List<Post> listTuyenSinh = postDAO.getLatestActivePosts(TUYEN_SINH, 0, NUM_POST);
		if(listTuyenSinh != null && listTuyenSinh.size() > 0) {
			mv.addObject("listTuyenSinh", listTuyenSinh);
			mv.addObject("TuyenSinhFirstContent", parseContent(listTuyenSinh.get(0).getPContent()));
		}
		List<Post> listDoanThanhNien = postDAO.getLatestActivePosts(DOAN_THANH_NIEN, 0, NUM_POST);
		if(listDoanThanhNien != null && listDoanThanhNien.size() > 0) {
			mv.addObject("listDoanThanhNien", listDoanThanhNien);
			mv.addObject("DoanThanhNienFirstContent", parseContent(listDoanThanhNien.get(0).getPContent()));
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
	
	@RequestMapping(value = "contact")
	public ModelAndView contact(){
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "Contact Us");
		mv.addObject("userClickContact", true);
		return mv;
	}

		@RequestMapping(value = "/show/post/{id}")
		public ModelAndView showPost(@PathVariable("id")int id)throws PostNotFoundException{
			ModelAndView mv = new ModelAndView("page");
			Post post = postDAO.get(id);
			if(post == null) {
				throw new PostNotFoundException();
			}
			post.setViewCount(post.getViewCount() + 1);
			postDAO.update(post);
			addGeneralPage(mv,post.getTitle());
			mv.addObject("latestPosts", postDAO.getLatestActivePosts(TIN_TUC, 0, 10));
			mv.addObject("post", post);
			mv.addObject("userClickPost", true);
			return mv;
		}
	//Methods to load all the posts and based on category
	@RequestMapping(value = "/show/all/posts")
	public ModelAndView showAllPosts(){
		ModelAndView mv = new ModelAndView("page");
		
		mv.addObject("title", "Bài Đăng");
		//passing the list of category
		mv.addObject("categories",categoryDAO.list());
		mv.addObject("userClickAllPosts", true);
		return mv;
	}
	@RequestMapping(value = "/show/category/{id}/posts")
	public ModelAndView showCategoryPosts(@PathVariable("id")int id,@RequestParam(value="offset", required=false)String offset){
		ModelAndView mv = new ModelAndView("page");
		
		//categoryDAO to fetch a single category
		Category category = null;
		category = categoryDAO.get(id);
		addGeneralPage(mv,category.getName());
		int pos = 0;
		if(offset!=null) {
			try {
				pos = Integer.parseInt(offset);
			}catch(Exception e) {
				
			}
		}
		//passing a single category
		mv.addObject("listPosts",postDAO.getLatestActivePosts(id, pos, 10));
		mv.addObject("userClickCategoryPosts", true);
		mv.addObject("offset", pos);
		mv.addObject("categoryId", id);
		mv.addObject("max", postDAO.getCount(id));
		return mv;
	}
	
	
	@RequestMapping(value = "/signup", method=RequestMethod.POST)
	public String signupUser(@Valid @ModelAttribute("user") User user, 
			BindingResult results, Model model, HttpServletRequest request) {
		
		// mandatory file upload check
//		if(user.getId() == 0) {
//			new PostValidator().validate(post, results);
//		}
//		else {
//			// edit check only when the file has been selected
//			if(!post.getFile().getOriginalFilename().equals("")) {
//				new PostValidator().validate(post, results);
//			}			
//		}
		
		if(results.hasErrors()) {
			if(user.getId() == 0 ) {
				model.addAttribute("message", "Lỗi vui lòng nhập lại thông tin!");
				model.addAttribute("userClickSignup",true);
				return "page";
			}
			else {
				model.addAttribute("message", "Lỗi, vui lòng nhập lại thông tin!");
				return "redirect:/editaccount";
			}
			
		}
		
		user.setPassword(passwordEncoder.encode(user.getPassword()));
		if(user.getId() == 0 ) {
			if(userDAO.getByUsername(user.getUsername()) != null) {
				if(user.getId() == 0 ) {
					model.addAttribute("message", "Tên đăng nhập đã tồn tại!!!");
					model.addAttribute("userClickSignup",true);
					return "page";
				}
				else {
					model.addAttribute("message", "Tên đăng nhập đã tồn tại!!!");
					return "redirect:/editaccount";
				}
				
			}
			user.setRole("USER");
			userDAO.add(user);
			model.addAttribute("message", "Đăng ký thành công!");
		}
		else {
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			if(user.getUsername() != authentication.getName() && userDAO.getByUsername(user.getUsername()) != null) {
				if(user.getId() == 0 ) {
					model.addAttribute("message", "Tên đăng nhập đã tồn tại!!!");
					model.addAttribute("userClickSignup",true);
					return "page";
				}
				else {
					model.addAttribute("message", "Tên đăng nhập đã tồn tại!!!");
					return "redirect:/editaccount";
				}
				
			}
			userDAO.update(user);
			model.addAttribute("message", "Cập nhật thông tin thành công!");
		}
	
		 //upload the file
		 if(!user.getFile().getOriginalFilename().equals("") ){
			FileUtil.uploadAvata(request, user.getFile(), user.getImage()); 
		 }
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/signup")
	public ModelAndView signup(@RequestParam(name="error", required = false)	String error,
			@RequestParam(name="logout", required = false) String logout) {
		ModelAndView mv= new ModelAndView("page");
		addGeneralPage(mv,"Đăng ký tài khoản");
		mv.addObject("userClickSignup", true);
		User user = new User();
		user.setActive(true);
		user.setRole("USER");
		mv.addObject("user", user);
		if(error!=null) {
			mv.addObject("message", "Lỗi đăng ký, vui lòng kiểm tra lại thông tin!");
		}
		
		return mv;
	}
	@RequestMapping(value="/editaccount")
	public ModelAndView editaccount(@RequestParam(name="error", required = false)	String error,
			@RequestParam(name="logout", required = false) String logout) {
		ModelAndView mv= new ModelAndView("page");
		addGeneralPage(mv,"Sửa thông tin tài khoản");
		mv.addObject("userClickSignup", true);
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		User user = userDAO.getByUsername(authentication.getName());
		mv.addObject("user", user);
		if(error!=null) {
			mv.addObject("message", "Lỗi cập nhật, vui lòng kiểm tra lại thông tin!");
		}
		
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
	
	@RequestMapping(value="/show/image/albums")
	public ModelAndView imageAlbums(@RequestParam(value="offset", required=false)String offset) {
		ModelAndView mv= new ModelAndView("page");
		addGeneralPage(mv,"Hình Ảnh");
		mv.addObject("userClickImageAlbums",true);
		int pos = 0;
		if(offset!=null) {
			try {
				pos = Integer.parseInt(offset);
			}catch(Exception e) {
				
			}
		}
		mv.addObject("offset", pos);
		mv.addObject("max", albumDAO.getCount("image"));
		List<Album> listAlbums = albumDAO.getAlbums("image", pos, 10);
		if (listAlbums != null && listAlbums.size() > 0){
			mv.addObject("listAlbums", listAlbums);
		}
		return mv;
	}
	@RequestMapping(value="/show/file/albums")
	public ModelAndView fileAlbums(@RequestParam(value="offset", required=false)String offset) {
		ModelAndView mv= new ModelAndView("page");
		addGeneralPage(mv,"Tài Liệu Học Tập");
		mv.addObject("userClickFileAlbums",true);
		int pos = 0;
		if(offset!=null) {
			try {
				pos = Integer.parseInt(offset);
			}catch(Exception e) {
				
			}
		}
		mv.addObject("offset", pos);
		mv.addObject("type", "file");
		mv.addObject("max", albumDAO.getCount("file"));
		List<Album> listAlbums = albumDAO.getAlbums("file", pos, 10);
		if (listAlbums != null && listAlbums.size() > 0){
			mv.addObject("listAlbums", listAlbums);
		}
		
		return mv;
	}
	@RequestMapping(value="/show/exam/albums")
	public ModelAndView examAlbums(@RequestParam(value="offset", required=false)String offset) {
		ModelAndView mv= new ModelAndView("page");
		addGeneralPage(mv,"Đề Thi");
		mv.addObject("userClickFileAlbums",true);
		int pos = 0;
		if(offset!=null) {
			try {
				pos = Integer.parseInt(offset);
			}catch(Exception e) {
				
			}
		}
		mv.addObject("offset", pos);
		mv.addObject("type", "exam");
		mv.addObject("max", albumDAO.getCount("exam"));
		List<Album> listAlbums = albumDAO.getAlbums("exam", pos, 10);
		if (listAlbums != null && listAlbums.size() > 0){
			mv.addObject("listAlbums", listAlbums);
		}
		
		return mv;
	}
	@RequestMapping(value="/show/album/{id}")
	public ModelAndView album(@PathVariable("id")int id) {
		ModelAndView mv= new ModelAndView("page");
		addGeneralPage(mv,"Show Album");
		Album album = albumDAO.get(id);
		List<FileUpload> listFiles = fileUploadDAO.getByAlbumId(id);
		mv.addObject("album", album);
		if("image".equals(album.getType())){
			mv.addObject("userClickAlbumImages",true);
			mv.addObject("listImages", listFiles);
		 }else{
			 mv.addObject("userClickAlbumFiles",true);
			 mv.addObject("listFiles", listFiles);
		 }
		return mv;
	}
	
	
	@RequestMapping(value="/about")
	public ModelAndView about() {
		ModelAndView mv= new ModelAndView("page");
		addGeneralPage(mv,"Giới Thiệu Trường");
		mv.addObject("userClickPost", true);
		Post about = postDAO.getPage("gioi-thieu");
		mv.addObject("post", about);
		return mv;
	}
	private void addGeneralPage(ModelAndView mv, String title) {
		mv.addObject("title", title);
		mv.addObject("categories",categoryDAO.list());
		List<Post> listThongBaoChung = postDAO.getLatestActivePosts(THONG_BAO_CHUNG, 0, 10);
		if(listThongBaoChung != null && listThongBaoChung.size() > 0) {
			mv.addObject("listThongBaoChung", listThongBaoChung);
		}
	}
	private String parseContent(String content) {
		Document doc = Jsoup.parse(content);
		String text = doc.body().text(); // "An example link"
		if(text.length() > 400) {
			return text.substring(0, 400);
		}
		return text.substring(0, text.length()-1);
	}
	
	@RequestMapping(value = "/show/search/posts", method = RequestMethod.POST)
	public ModelAndView showCategoryPosts(@RequestParam(value="key", required=false)String key,@RequestParam(value="offset", required=false)String offset){
		ModelAndView mv = new ModelAndView("page");
		
		addGeneralPage(mv,"Tìm Kiếm");
		int pos = 0;
		if(offset!=null) {
			try {
				pos = Integer.parseInt(offset);
			}catch(Exception e) {
				
			}
		}
		
		//passing a single category
		mv.addObject("listPosts",postDAO.searchPosts(key, pos, 10));
		mv.addObject("userClickCategoryPosts", true);
		mv.addObject("offset", pos);
		mv.addObject("max", postDAO.getCount(key));
		return mv;
	}
//	@RequestMapping(value="/page")
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
