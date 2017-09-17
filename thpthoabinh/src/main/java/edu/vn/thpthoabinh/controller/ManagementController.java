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
import edu.vn.thpthoabinh.validate.PostValidator;
import edu.vn.thpthoabinhbackend.dao.CategoryDAO;
import edu.vn.thpthoabinhbackend.dao.PostDAO;
import edu.vn.thpthoabinhbackend.dto.Category;
import edu.vn.thpthoabinhbackend.dto.Post;

@Controller
@RequestMapping("/manage")
public class ManagementController {

//	private static final Logger logger = LoggerFactory.getLogger(ManagementController.class);

	@Autowired
	private PostDAO postDAO;
	
	@Autowired
	private CategoryDAO categoryDAO;		

	@RequestMapping("/post")
	public ModelAndView manageProduct(@RequestParam(name="success",required=false)String success) {		

		ModelAndView mv = new ModelAndView("test");	
		mv.addObject("title","Post Management");		
		mv.addObject("manage",true);	
		mv.addObject("userClickManagePost",true);
		
		Post post = new Post();
		
		// assuming that the user is ADMIN
		// later we will fixed it based on user is SUPPLIER or ADMIN
		post.setAuthorId(1);
		
		mv.addObject("post", post);

		
		if(success != null) {
			if(success.equals("product")){
				mv.addObject("message", "Product submitted successfully!");
			}	
			else if (success.equals("category")) {
				mv.addObject("message", "Category submitted successfully!");
			}
		}
			
		return mv;
		
	}

	
	@RequestMapping("/{id}/product")
	public ModelAndView manageProductEdit(@PathVariable int id) {		

		ModelAndView mv = new ModelAndView("test");	
		mv.addObject("title","Product Management");		
		mv.addObject("manage",true);	
		mv.addObject("userClickManagePost",true);
		
		Post post = postDAO.get(id);
		post.setViewCount(post.getViewCount() + 1);
		postDAO.update(post);
		mv.addObject("post", post);

		return mv;
		
	}
	
	
	@RequestMapping(value = "/post", method=RequestMethod.POST)
	public String managePostProduct(@Valid @ModelAttribute("product") Post post, 
			BindingResult results, Model model, HttpServletRequest request) {
		
		// mandatory file upload check
		if(post.getId() == 0) {
			new PostValidator().validate(post, results);
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
			return "test";
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
		
		return "redirect:/manage/post?success=product";
	}

	
	@RequestMapping(value = "/post/{id}/activation", method=RequestMethod.GET)
	@ResponseBody
	public String managePostProductActivation(@PathVariable int id) {		
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
	
	
}

	
