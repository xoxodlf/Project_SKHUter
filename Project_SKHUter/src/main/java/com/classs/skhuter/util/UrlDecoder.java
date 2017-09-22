package com.classs.skhuter.util;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

/**
 * JSTL URLDecoder 클래스
 * 
 * @패키지 : com.classs.skhuter.util
 * @파일명 : UrlDecoder.java
 * @작성자 : 이종윤
 * @작성일 : 2017. 9. 22. 
 *
 */
public class UrlDecoder {

	 public static String urlDecode(String input) throws UnsupportedEncodingException 
	   { 
	      return URLDecoder.decode(input, "UTF-8"); 
	   } 	
}
