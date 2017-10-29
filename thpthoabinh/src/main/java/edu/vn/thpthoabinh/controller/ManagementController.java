package edu.vn.thpthoabinh.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import edu.vn.thpthoabinh.util.FileUtil;
import edu.vn.thpthoabinh.util.SlugUtil;
import edu.vn.thpthoabinh.validator.PostValidator;
import edu.vn.thpthoabinhbackend.dao.AlbumDAO;
import edu.vn.thpthoabinhbackend.dao.CategoryDAO;
import edu.vn.thpthoabinhbackend.dao.FileUploadDAO;
import edu.vn.thpthoabinhbackend.dao.PostDAO;
import edu.vn.thpthoabinhbackend.dao.SubjectDAO;
import edu.vn.thpthoabinhbackend.dao.UserDAO;
import edu.vn.thpthoabinhbackend.dto.Album;
import edu.vn.thpthoabinhbackend.dto.Category;
import edu.vn.thpthoabinhbackend.dto.FileUpload;
import edu.vn.thpthoabinhbackend.dto.Post;
import edu.vn.thpthoabinhbackend.dto.Subject;
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
	@Autowired
	private FileUploadDAO fileUploadDAO;	
	@Autowired
	private AlbumDAO albumDAO;	
	@Autowired
	private SubjectDAO subjectDAO;	

	@RequestMapping("/post")
	public ModelAndView managePost(@RequestParam(name="success",required=false)String success) {		

		ModelAndView mv = new ModelAndView("page");	
		mv.addObject("title","Post Management");		
		mv.addObject("manage",true);	
		mv.addObject("userClickManagePost",true);
		
		Post post = new Post();
		
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
	@RequestMapping("/page/{page}")
	public ModelAndView editPage(@RequestParam(name="success",required=false)String success,@PathVariable("page")String page) {		

		ModelAndView mv = new ModelAndView("page");	
		mv.addObject("title","Edit Page");		
		mv.addObject("manage",true);	
		mv.addObject("userClickEditPage",true);
		
		Post post = postDAO.getPage(page);
		
		mv.addObject("post", post);

		
		if(success != null) {
			if(success.equals("post")){
				mv.addObject("message", "Lưu trang thành công!");
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
			
			if(post.getFile() == null || post.getFile().getOriginalFilename().equals("")) {
				post.setImage("default");
			}else{
				new PostValidator().validate(post, results);
			}
		}
		else {
			// edit check only when the file has been selected
			if(!(post.getFile() == null || post.getFile().getOriginalFilename().equals(""))) {
				new PostValidator().validate(post, results);
				if("default".equals(post.getImage())){
					post.setImage("IMG" + UUID.randomUUID().toString());
				}
			}
		}
		
		if(results.hasErrors()) {
			model.addAttribute("message", "Validation fails for adding the post!");
			model.addAttribute("manage",true);	
			model.addAttribute("userClickManagePost",true);
			return "page";
		}			
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		User user = userDAO.getByUsername(authentication.getName());
		post.setAuthorId(user.getId());
		if(post.getId() == 0 || post.getId() > 10) {
			post.setSlug(SlugUtil.makeSlug(post.getTitle()));
		}
		
		if(post.getId() == 0 ) {
			postDAO.add(post);
		}
		else {
			post.setDateModified(new Date());
			postDAO.update(post);
		}
	
		 //upload the file
		 if(!(post.getFile() == null || post.getFile().getOriginalFilename().equals("") || "default".equals(post.getImage()))){
			FileUtil.uploadAvata(request, post.getFile(), post.getImage()); 
		 }
		if(post.getId() <= 10) {
			return "redirect:/";
		}else {
			return "redirect:/manage/post?success=post";
		}
		
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
	public String manageUserActivation(@PathVariable int id) {		
		User user = userDAO.get(id);
		boolean isActive = user.isActive();
		user.setActive(!isActive);
		userDAO.update(user);		
		return (isActive)? "User Dectivated Successfully!": "User Activated Successfully";
	}
	
	@RequestMapping(value = "/album/{id}/activation", method=RequestMethod.GET)
	@ResponseBody
	public String manageAlbumActivation(@PathVariable int id) {		
		Album album = albumDAO.get(id);
		boolean isActive = album.getActive();
		album.setActive(!isActive);
		albumDAO.update(album);		
		return (isActive)? "Album Dectivated Successfully!": "Album Activated Successfully";
	}
	@RequestMapping(value = "/album/{id}/delete", method=RequestMethod.GET)
	@ResponseBody
	public void manageAlbumDelete(@PathVariable int id, HttpServletRequest request, HttpServletResponse response) {	
		List<FileUpload> listFiles = fileUploadDAO.getByAlbumId(id);
		for(FileUpload x : listFiles) {
			String real_path = request.getSession().getServletContext().getRealPath("/assets/upload/files");
			File file = new File(real_path + '/' +x.getName());
			try {
				boolean result = Files.deleteIfExists(file.toPath());
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				break;
			}
		}
		String type = albumDAO.get(id).getType();
		albumDAO.delete(id);
		try {
			if("image".equals(type)){
				response.sendRedirect(request.getContextPath() + "/manage/image/album");
			 }else if("file".equals(type)){
				 response.sendRedirect(request.getContextPath() + "/manage/files/upload");
			 }else{
				 response.sendRedirect(request.getContextPath() + "/manage/exams/upload");
			 }
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/updateuser", method = RequestMethod.POST)
	public String adminUpdateUser(@RequestParam("username") String username, @RequestParam("role") String role) {
//		ModelAndView mv = new ModelAndView("/user");	
//		mv.addObject("title","User Management");		
//		mv.addObject("manage",true);	
//		mv.addObject("userClickManageUser",true);
//		mv.addObject("message","Cáº­p nháº­t user thÃ nh cÃ´ng!");
		User user = userDAO.getByUsername(username);
		user.setRole(role);
		userDAO.update(user);
		return "redirect:/manage/user?success=user";
	}
	
	@RequestMapping(value = "/image/album", method = RequestMethod.GET)
	public ModelAndView manageImageAlbum(@RequestParam(name="message",required=false)String message) {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title","Album Management");		
		mv.addObject("manage",true);	
		mv.addObject("userClickManageAlbum",true);
		Album album = new Album();
		album.setType("image");
		mv.addObject("album", album);
		if(message != null) {
			if(message.equals("saved")){
				mv.addObject("message", "Lưu Album thành công!");
			}	
		}
		return mv;
	}
	@RequestMapping(value = "/files/upload", method = RequestMethod.GET)
	public ModelAndView manageFileAlbum(@RequestParam(name="message",required=false)String message) {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title","Album Management");		
		mv.addObject("manage",true);	
		mv.addObject("userClickManageFileAlbum",true);
		Album album = new Album();
		album.setType("file");
		mv.addObject("album", album);
		mv.addObject("type","file");	
		if(message != null) {
			if(message.equals("saved")){
				mv.addObject("message", "Lưu Album thành công!");
			}	
		}
		return mv;
	}
	@RequestMapping(value = "/exams/upload", method = RequestMethod.GET)
	public ModelAndView manageExamAlbum(@RequestParam(name="message",required=false)String message) {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title","Album Management");		
		mv.addObject("manage",true);	
		mv.addObject("userClickManageFileAlbum",true);
		Album album = new Album();
		album.setType("exam");
		mv.addObject("album", album);
		mv.addObject("type","exam");	
		if(message != null) {
			if(message.equals("saved")){
				mv.addObject("message", "Lưu Album thành công!");
			}	
		}
		return mv;
	}
	@RequestMapping(value = "/files/save", method = RequestMethod.POST)
	public String save(@ModelAttribute("album") Album album, BindingResult results, Model map, HttpServletRequest request) {
		
		List<MultipartFile> files = album.getFiles();
		if(null != files && files.size() > 0 && files.get(0).getSize() > 0) {
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			User authen_user = userDAO.getByUsername(authentication.getName());
			album.setAuthorId(authen_user.getId());
			if(!"imagepost".equals(album.getType())) {
				albumDAO.add(album);
			}
			int getAlbumImage = 0;
			for (MultipartFile file : files) {
				String fileName = file.getOriginalFilename();
				FileUpload fileUp = new FileUpload(album.getId(), fileName);
				//Handle file content - multipartFile.getInputStream()
				//upload the file
				String extension = FilenameUtils.getExtension(file.getOriginalFilename());
				String nameWithoutEx = FilenameUtils.getBaseName(file.getOriginalFilename());
				 if(!file.getOriginalFilename().equals("") ){
					 if("image".equals(album.getType()) || "imagepost".equals(album.getType())){
						 FileUtil.uploadImages(request, file, fileUp.getName());
						 if(getAlbumImage == 0) {
								album.setImage(fileUp.getName());
							}
					 }else{
						 fileUp.setName((SlugUtil.makeSlug(nameWithoutEx) + '_' + fileUp.getName()) + '.' + extension);
						 FileUtil.store(request, file, fileUp.getName()); 
					 }
				 }
				 fileUploadDAO.add(fileUp);
				getAlbumImage ++;
			}
			if(!"imagepost".equals(album.getType())) {
				albumDAO.update(album);
			}
			map.addAttribute("message", "saved");
		}
		
		if("imagepost".equals(album.getType())) {
			return "redirect:/manage/show/imagesfinder";
		}
		if("image".equals(album.getType())){
			return "redirect:/manage/image/album";
		 }else if("file".equals(album.getType())){
			 return "redirect:/manage/files/upload";
		 }else{
			 return "redirect:/manage/exams/upload";
		 }
	}
	
	@RequestMapping(value = "/file/upload", method = RequestMethod.POST)
	public String saveFile(MultipartFile postfile, HttpServletRequest request) {
		
		String fileName = postfile.getOriginalFilename();
		FileUpload fileUp = new FileUpload(0, fileName);
		//Handle file content - multipartFile.getInputStream()
		//upload the file
		String extension = FilenameUtils.getExtension(postfile.getOriginalFilename());
		
		 if(!postfile.getOriginalFilename().equals("") ){
			 try {
				FileUtil.uploadImages(request, postfile, fileUp.getName());
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
			 fileUploadDAO.add(fileUp);
		 }
		 
		 return "redirect:/manage/post";
	}
	
	@ModelAttribute("subjects") 
	public List<Subject> modelSubjects() {
		return subjectDAO.list();
	}
	@RequestMapping(value="/show/imagesfinder")
	public ModelAndView imagefinder() {
		ModelAndView mv= new ModelAndView("imagesFinder");
		mv.addObject("title", "Show Albums");
		List<FileUpload> listImages = fileUploadDAO.getByAlbumId(0);
		mv.addObject("listImages", listImages);
		return mv;
	}
	
	@RequestMapping(value = "/image/post", method = RequestMethod.GET)
	public ModelAndView manageImagePost(@RequestParam(name="message",required=false)String message) {
		ModelAndView mv = new ModelAndView("uploadPostImages");
		mv.addObject("title","Thêm ảnh");		
		Album album = new Album();
		album.setId(0);
		album.setType("imagepost");
		mv.addObject("album", album);
		return mv;
	}
}

	
