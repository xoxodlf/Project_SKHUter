package com.classs.skhuter.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.converter.BufferedImageHttpMessageConverter;
import org.springframework.util.FileCopyUtils;

/** 파일 업로드용 클래스*/
public class UploadFileUtils {
	private static final Logger logger = LoggerFactory.getLogger(UploadFileUtils.class);
	
	public static String uploadFile(String uploadPath,String originalName,byte[]fileData)throws Exception{
		UUID uid = UUID.randomUUID();
		
		String savedName = uid.toString() + "_"+originalName;
		
		String savedPath = calcPath(uploadPath); //저장될 경로를 계산
		
		File target = new File(uploadPath + savedPath,savedName);
		
		FileCopyUtils.copy(fileData, target); //원본 파일을 저장하는 부분
		
		String formatName = originalName.substring(originalName.lastIndexOf(".")+1); //원본 파일의 확장자
		
		String uploadedFileName = null;
		
		if(MediaUtils.getMediaType(formatName)!=null) {
			uploadedFileName = makeThumbnail(uploadPath,savedPath,savedName);
		} else {
			uploadedFileName = makeIcon(uploadPath,savedPath,savedName);
		}
		
		return uploadedFileName;
	}
	
	
	private static String makeIcon(String uploadPath,String path,String fileName)throws Exception{
		String iconName = uploadPath+path+File.separator+fileName;
		
		return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}
	
	private static String calcPath(String uploadPath) {
		String path = File.separator + "skhuter";
		
		makeDir(uploadPath,path);
		
		return path;
	}
	
	private static void makeDir(String uploadPath,String... paths) {
		if(new File(uploadPath+paths[paths.length-1]).exists()) {
			return;
		}
		
		for(String path : paths) {
			File dirPath = new File(uploadPath + path);
			
			if(! dirPath.exists()) {
				dirPath.mkdir();
			}
		}
	}
	
	private static String makeThumbnail(String uploadPath,String path,String fileName) throws Exception {
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath+path,fileName));
		
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT,100);
		
		String thumbnailName = uploadPath+path+File.separator+"s_"+fileName;
		
		File newFile = new File(thumbnailName);
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		
		ImageIO.write(destImg, formatName.toUpperCase(), newFile);
		
		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar,'/');
	}
}
