package edu.vn.thpthoabinh.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import edu.vn.thpthoabinhbackend.dao.CategoryDAO;
import edu.vn.thpthoabinhbackend.dto.Category;

@Controller
public class PageController {
	
	@Autowired
	private CategoryDAO categoryDAO;
	
	@RequestMapping(value = {"/"})
	public ModelAndView index(){
		ModelAndView mv = new ModelAndView("trangchu");
		//passing the list of category
		mv.addObject("categories",categoryDAO.list());
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
	
	//Methods to load all the products and based on category
	@RequestMapping(value = "/show/all/products")
	public ModelAndView showAllProducts(){
		ModelAndView mv = new ModelAndView("page");
		
		mv.addObject("title", "All Products");
		//passing the list of category
		mv.addObject("categories",categoryDAO.list());
		mv.addObject("userClickAllProducts", true);
		return mv;
	}
	@RequestMapping(value = "/show/category/{id}/products")
	public ModelAndView showCategoryProducts(@PathVariable("id")int id){
		ModelAndView mv = new ModelAndView("page");
		
		//categoryDAO to fetch a single category
		Category category = null;
		category = categoryDAO.get(id);
		mv.addObject("title", category.getName());
		//passing the list of categories
		mv.addObject("categories",categoryDAO.list());
		//passing a single category
		mv.addObject("category",category);
		mv.addObject("userClickCategoryProducts", true);
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