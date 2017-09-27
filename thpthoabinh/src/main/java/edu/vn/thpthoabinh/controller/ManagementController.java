package edu.vn.thpthoabinh.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import edu.vn.thpthoabinh.util.FileUtil;
import edu.vn.thpthoabinh.util.SlugUtil;
import edu.vn.thpthoabinh.validator.PostValidator;
import edu.vn.thpthoabinhbackend.dao.CategoryDAO;
import edu.vn.thpthoabinhbackend.dao.PostDAO;
import edu.vn.thpthoabinhbackend.dao.UserDAO;
import edu.vn.thpthoabinhbackend.dto.Category;
import edu.vn.thpthoabinhbackend.dto.Post;
import edu.vn.thpthoabinhbackend.dto.User;

@Controller
@RequestMapping("/manage")
public class ManagementController {

//	private static final Logger logger = LoggerFactory.getLogger(ManagementController.class);

	@Autowired
	private PostDAO postDAO;
	
	@Autowired
	private CategoryDAO categoryDAO;	
	@Autowired
	private UserDAO userDAO;	

	@RequestMapping("/post")
	public ModelAndView managePost(@RequestParam(name="success",required=false)String success) {		

		ModelAndView mv = new ModelAndView("page");	
		mv.addObject("title","Post Management");		
		mv.addObject("manage",true);	
		mv.addObject("userClickManagePost",true);
		
		Post post = new Post();
		
		// assuming that the user is ADMIN
		// later we will fixed it based on user is SUPPLIER or ADMIN
		post.setAuthorId(1);
		
		mv.addObject("post", post);

		
		if(success != null) {
			if(success.equals("post")){
				mv.addObject("message", "Lưu bài viết thành công!");
			}	
			else if (success.equals("category")) {
				mv.addObject("message", "Lưu loại bài viết thành công!");
			}
		}
			
		return mv;
		
	}

	
	@RequestMapping("/{id}/post")
	public ModelAndView managePostEdit(@PathVariable int id) {		

		ModelAndView mv = new ModelAndView("page");	
		mv.addObject("title","Post Management");		
		mv.addObject("manage",true);	
		mv.addObject("userClickManagePost",true);
		
		Post post = postDAO.get(id);
		mv.addObject("post", post);

		return mv;
		
	}
	
	
	@RequestMapping(value = "/post", method=RequestMethod.POST)
	public String managePostPost(@Valid @ModelAttribute("post") Post post, 
			BindingResult results, Model model, HttpServletRequest request) {
		
		// mandatory file upload check
		if(post.getId() == 0) {
			new PostValidator().validate(post, results);
//			if(post.getFile() == null || post.getFile().getOriginalFilename().equals("")) {
//				post.setImage("default.jpg");
//			}
		}
		else {
			// edit check only when the file has been selected
			if(!post.getFile().getOriginalFilename().equals("")) {
				new PostValidator().validate(post, results);
			}			
		}
		
		if(results.hasErrors()) {
			model.addAttribute("message", "Validation fails for adding the post!");
			model.addAttribute("manage",true);	
			model.addAttribute("userClickManagePost",true);
			return "page";
		}			
		
		post.setSlug(SlugUtil.makeSlug(post.getTitle()));
		if(post.getId() == 0 ) {
			postDAO.add(post);
		}
		else {
			post.setDateModified(new Date());
			postDAO.update(post);
		}
	
		 //upload the file
		 if(!post.getFile().getOriginalFilename().equals("") ){
			FileUtil.uploadFile(request, post.getFile(), post.getImage()); 
		 }
		
		return "redirect:/manage/post?success=post";
	}

	
	@RequestMapping(value = "/post/{id}/activation", method=RequestMethod.GET)
	@ResponseBody
	public String managePostPostActivation(@PathVariable int id) {		
		Post post = postDAO.get(id);
		boolean isActive = post.isActive();
		post.setActive(!isActive);
		postDAO.update(post);		
		return (isActive)? "Post Dectivated Successfully!": "Post Activated Successfully";
	}
			

	@RequestMapping(value = "/category", method=RequestMethod.POST)
	public String managePostCategory(@ModelAttribute("category") Category mCategory, HttpServletRequest request) {					
		categoryDAO.add(mCategory);		
		return "redirect:" + request.getHeader("Referer") + "?success=category";
	}
			
	
	
	@ModelAttribute("categories") 
	public List<Category> modelCategories() {
		return categoryDAO.list();
	}
	
	@ModelAttribute("category")
	public Category modelCategory() {
		return new Category();
	}
	
	@RequestMapping("/user")
	public ModelAndView manageUser(@RequestParam(name="success",required=false)String success) {		

		ModelAndView mv = new ModelAndView("page");	
		mv.addObject("title","User Management");		
		mv.addObject("manage",true);	
		mv.addObject("userClickManageUser",true);
		
		User user = new User();
		
		mv.addObject("user", user);
		if(success != null) {
			if(success.equals("user")){
				mv.addObject("message", "Cập nhật user thành công!");
			}	
		}
		return mv;
		
	}
	
	@RequestMapping("/{id}/user")
	public ModelAndView manageUserEdit(@PathVariable int id) {		

		ModelAndView mv = new ModelAndView("page");	
		mv.addObject("title","User Management");		
		mv.addObject("manage",true);	
		mv.addObject("userClickManageUser",true);
		
		User user = userDAO.get(id);
		mv.addObject("username", user.getUsername());
		mv.addObject("fullName", user.getFullName());
		mv.addObject("email", user.getEmail());
		mv.addObject("phone", user.getPhone());
		mv.addObject("profile", user.getProfile());
		mv.addObject("role", user.getRole());
		return mv;
	}
	
	@RequestMapping(value = "/user/{id}/activation", method=RequestMethod.GET)
	@ResponseBody
	public String manageUserPostActivation(@PathVariable int id) {		
		User user = userDAO.get(id);
		boolean isActive = user.isActive();
		user.setActive(!isActive);
		userDAO.update(user);		
		return (isActive)? "User Dectivated Successfully!": "User Activated Successfully";
	}
	
	@RequestMapping(value = "/updateuser", method = RequestMethod.POST)
	public String adminUpdateUser(@RequestParam("username") String username, @RequestParam("role") String role) {
//		ModelAndView mv = new ModelAndView("/user");	
//		mv.addObject("title","User Management");		
//		mv.addObject("manage",true);	
//		mv.addObject("userClickManageUser",true);
//		mv.addObject("message","Cập nhật user thành công!");
		User user = userDAO.getByUsername(username);
		user.setRole(role);
		userDAO.update(user);
		return "redirect:/manage/user?success=user";
	}
}

	
