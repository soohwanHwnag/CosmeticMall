package com.study.springboot.service;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;

import org.springframework.stereotype.Service;
import org.springframework.util.ResourceUtils;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FileUploadService {
	

	private static String save_path = "/upload/";
	private static String prefix_path = "/upload/";
	
	public String restore(MultipartFile file) {
		
		String url = null;
		String savefilename ="";
		try {
			String savepath = ResourceUtils.getFile("classpath:static/upload/").toPath().toString();
			System.out.println("savepath:"+savepath);
			
			savepath = savepath.replace("\\", "/");
			System.out.println("savepath2:"+savepath);
			savepath = savepath.replace("/bin/main/static", "/src/main/resources/static");
			System.out.println("savepath3:"+savepath);
			
			save_path=savepath;
			prefix_path=savepath;
			
			String origin_filename = file.getOriginalFilename();
			String extName = origin_filename.substring(origin_filename.lastIndexOf("."), origin_filename.length());
			System.out.println("extName:"+extName);
			long size = file.getSize();
			
			savefilename = genSaveFileName(extName);
			
			System.out.println("originFilename : " + origin_filename);
			System.out.println("extensionName : " + extName);
			System.out.println("size : " + size);
			System.out.println("saveFileName : " + savefilename);
			
			writeFile(file,savefilename);
			
			url= prefix_path+"/"+savefilename;
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/upload/"+savefilename;
	}
	
	private String genSaveFileName(String extName) {
		String fileName="";
		
		Calendar calendar = Calendar.getInstance();
		fileName += calendar.get(Calendar.YEAR);
		fileName += calendar.get(Calendar.MONTH);
		fileName += calendar.get(Calendar.DATE);
		fileName += calendar.get(Calendar.HOUR);
		fileName += calendar.get(Calendar.MINUTE);
		fileName += calendar.get(Calendar.SECOND);
		fileName += calendar.get(Calendar.MILLISECOND);
		fileName += extName;
		return fileName;
		
	}
	
	private void writeFile(MultipartFile file, String savefilename) throws IOException {
		
		byte[] data = file.getBytes();
		FileOutputStream fos= new FileOutputStream(save_path+"/"+savefilename);
		fos.write(data);
		fos.close();
		return;
	}
}
