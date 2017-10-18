package edu.vn.thpthoabinh.util;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import javax.servlet.http.HttpServletRequest;

import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

public class FileUtil {
	private static String REAL_PATH = null;
//	private static final Logger logger = LoggerFactory.getLogger(FileUtil.class);
	public static boolean uploadAvata(HttpServletRequest request, MultipartFile file, String code) 
	{				
		// get the real server path
		REAL_PATH = request.getSession().getServletContext().getRealPath("/assets/images/");
		System.out.print(REAL_PATH);					
		// create the directories if it does not exist
		
		if(!new File(REAL_PATH).exists()) {
			new File(REAL_PATH).mkdirs();
		}
		
		try {
			//transfer the file to both the location
			file.transferTo(new File(REAL_PATH +"/"+ code + ".jpg"));
		}
		catch(IOException ex) {
			ex.printStackTrace();
		}
		return true;
	}
	
	public static boolean uploadImages(HttpServletRequest request, MultipartFile file, String code)
	{				
		// get the real server path
		REAL_PATH = request.getSession().getServletContext().getRealPath("/assets/upload/images/");
		System.out.print(REAL_PATH);					
		// create the directories if it does not exist
		
		if(!new File(REAL_PATH).exists()) {
			new File(REAL_PATH).mkdirs();
		}
		
		try {
			//transfer the file to both the location
//			file.transferTo(new File(REAL_PATH + code + ".jpg"));
			byte[] bytes = file.getBytes();
            Path path = Paths.get(REAL_PATH +"/"+ code + ".jpg");
            Files.write(path, bytes);
		}
		catch(IOException ex) {
			ex.printStackTrace();
		}
		return true;
	}
	public static boolean uploadFiles(HttpServletRequest request, MultipartFile file, String name)
	{				
		// get the real server path
		REAL_PATH = request.getSession().getServletContext().getRealPath("/assets/upload/files/");
		System.out.print(REAL_PATH);					
		// create the directories if it does not exist
		
		if(!new File(REAL_PATH).exists()) {
			new File(REAL_PATH).mkdirs();
		}
		
		//transfer the file to both the location
		try {
			file.transferTo(new File(REAL_PATH + name));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return true;
	}
	
	public static void store(HttpServletRequest request, MultipartFile file, String name) {
        String filename = StringUtils.cleanPath(file.getOriginalFilename());
        try {
        	// get the real server path
    		REAL_PATH = request.getSession().getServletContext().getRealPath("/assets/upload/files");
    		System.out.print(REAL_PATH);					
    		// create the directories if it does not exist
    		
    		if(!new File(REAL_PATH).exists()) {
    			new File(REAL_PATH).mkdirs();
    		}
            Path path = Paths.get(REAL_PATH +"/"+ name);
            Files.write(path, file.getBytes());
//            path = Paths.get(REAL_PATH +"/"+ "1_" +name );
//            Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
        }
        catch (Exception e) {
        	e.printStackTrace();
        }
    }
//	public static void uploadNoImage(HttpServletRequest request, String code) {
//		// get the real server path
//		REAL_PATH = request.getSession().getServletContext().getRealPath("/assets/images/");
//	
//		String imageURL = "http://placehold.it/640X480?text=No Image";
//		String destinationServerFile = REAL_PATH + code + ".jpg";
////		String destinationProjectFile = REAL_PATH + code + ".jpg";
//				
//		try {
//			URL url = new URL(imageURL);				
//			try (	
//					InputStream is = url.openStream();
//					OutputStream osREAL_PATH = new FileOutputStream(destinationServerFile);
////					OutputStream osABS_PATH = new FileOutputStream(destinationProjectFile);
//				){
//			
//				byte[] b = new byte[2048];
//				int length;
//				while((length = is.read(b))!= -1) {
//					osREAL_PATH.write(b, 0, length);
////					osABS_PATH.write(b, 0, length);
//				}
//			}			
//		}
//		catch(IOException ex) {
//			ex.printStackTrace();
//		}
//	}
	
}
