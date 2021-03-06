package com.classs.skhuter.interceptor;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import com.classs.skhuter.user.domain.UserDTO;
import com.classs.skhuter.user.service.UserService;

import org.springframework.mobile.device.Device;
import org.springframework.mobile.device.DeviceUtils;


/**
 * 로그인 유지를 위한 필터역할을 해주는 인터셉터
 * 
 * @패키지 : com.classs.skhuter.interceptor
 * @파일명 : AuthInterceptor.java
 * @작성자 : 이종윤
 * @작성일 : 2017. 9. 22. 
 *
 */
public class AuthInterceptor extends HandlerInterceptorAdapter{
	
	private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);
	
	@Inject
	private UserService service;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		
		HttpSession session = request.getSession();
		
		Device device = DeviceUtils.getCurrentDevice(request); 

		/** 모바일 or 태블릿 기기일 경우 인터셉터 적용 안함 */
		if (!device.isNormal()) {
			return true;
		}
		
		if (session.getAttribute("login") == null) {
			
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			
			if (loginCookie != null) {
				UserDTO user = service.checkUserWithSessionKey(loginCookie.getValue());
				
				if (user != null) {
					session.setAttribute("login", user);
					return true;
				}
			}
			
			/** 로그인 상태 아닐 때 로그인 페이지로 보내기 */
			response.sendRedirect("/");
			
			return false;
		}
		
		return true;
	}
 }
