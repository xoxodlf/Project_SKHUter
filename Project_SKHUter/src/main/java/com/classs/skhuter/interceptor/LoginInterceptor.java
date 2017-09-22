package com.classs.skhuter.interceptor;

import java.net.URLEncoder;
import java.sql.Date;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import com.classs.skhuter.user.domain.UserDTO;
import com.classs.skhuter.user.service.UserService;


/**
 * 로그인 유지를 위한 필터역할을 해주는 인터셉터
 * preHandle 메소드, postHandle 메소드 활용
 * 
 * @패키지 : com.classs.skhuter.interceptor
 * @파일명 : LoginInterceptor.java
 * @작성자 : 이종윤
 * @작성일 : 2017. 9. 22. 
 *
 */

public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	@Inject
	UserService service;
	
	private static final String LOGIN = "login";
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler){
		
		HttpSession session = request.getSession();
		
		if (session.getAttribute(LOGIN) != null) {
			session.removeAttribute(LOGIN);
		}
		
		Object obj = session.getAttribute("login");
		Cookie userIdCookie = WebUtils.getCookie(request, "userIdCookie");
		
		if (obj != null) {
			UserDTO user = (UserDTO) obj;
			if (userIdCookie != null) {
				userIdCookie.setPath("/");
				userIdCookie.setMaxAge(0);
				response.addCookie(userIdCookie);
				service.keepLogin(user.getId(), session.getId(), new Date(0));
				}
		}
		
		return true;	
		
	}
	
	@Override	
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception{
		
		HttpSession session = request.getSession();
		
		ModelMap modelMap = modelAndView.getModelMap();
		Object user = modelMap.get("user");
		
		UserDTO user2 = (UserDTO) user;
		
		if (user2.getName() != null) {
			
			UserDTO userInfo = service.get(user2.getUserNo());

			if(userInfo.getStatus() == 1){
				
				session.setAttribute(LOGIN, userInfo);
	
				if (request.getParameter("useCookie") != null) {
					
					Cookie loginCookie = new Cookie("loginCookie", session.getId());
					loginCookie.setPath("/");
					loginCookie.setMaxAge(60 * 60 * 24 * 7);
					response.addCookie(loginCookie);
					
				}
					/* 쿠키에 아이디 저장 */
					UserDTO userCookie = (UserDTO) user;
					Cookie userIdCookie = new Cookie("userIdCookie", userCookie.getId());
					userIdCookie.setPath("/");
					userIdCookie.setMaxAge(60 * 60 * 24 * 7);
					response.addCookie(userIdCookie);
					
					
					/*쿠키에 이름 저장*/
					Cookie CookieForUser = new Cookie("CookieForUser", URLEncoder.encode(userInfo.getName(), "utf-8"));
					CookieForUser.setPath("/");
					CookieForUser.setMaxAge(60 * 60 * 24 * 7);
					response.addCookie(CookieForUser);
					
					response.sendRedirect("/home");
				
			
			 } else if(userInfo.getStatus() == 0){
					response.sendRedirect("/?result=notAuth");	// 가입 승인 받지 않은 회원
				} else {
					response.sendRedirect("/?result=delete");	// 탈퇴한 회원
				}
				
		} else {
					response.sendRedirect("/?result=error");	// 로그인 정보가 틀린 회원
				}
		}
	}

 
