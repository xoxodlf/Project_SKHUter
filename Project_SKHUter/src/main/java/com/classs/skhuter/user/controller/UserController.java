 package com.classs.skhuter.user.controller;

import java.net.URLEncoder;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import com.classs.skhuter.user.domain.UserDTO;
import com.classs.skhuter.user.service.UserService;

/**
 * 회원 관련 프로젝트 Controller @RequestMapping("/user") URI 매칭
 * 
 * @패키지 : com.classs.skhuter.user.controller
 * @파일명 : UserController.java
 * @작성자 : 이종윤
 * @작성일 : 2017. 9. 20.
 *
 */
@Controller
@RequestMapping("/user")
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Inject
	private UserService service;

	UserDTO user;

	@RequestMapping(value = "/userList", method = RequestMethod.GET)
	public String getUserList(Model model) {
		List<UserDTO> userList = service.UserListAll();
		
		model.addAttribute("list", userList);
		
		return "user/userList.lay";
	}
	
	@RequestMapping(value="userList/changeStatus", method = RequestMethod.POST)
	public String changeStatus(@RequestParam(value="check", required=true) List<String> checks, @RequestParam(value="Status", required=true) String Status){
		logger.info(Status);
		UserDTO users= new UserDTO();
		for(String check : checks) {
	       users.setUserNo(Integer.parseInt(check));
	       users.setStatus(Integer.parseInt(Status));
	       service.changeStatus(users);
			
	    }

		return "redirect:/user/userList";
	}
	
	@RequestMapping(value="takeover", method = RequestMethod.POST)
	public String takeover(@RequestParam(value="takerNo", required=true) String takerNo,@RequestParam(value="takeoverCode", required=true) String takeoverCode){
		
		UserDTO users= new UserDTO();
		users.setUserNo(Integer.parseInt(takerNo));
		users.setStatus(3);
		service.changeStatus(users);
		users.setTakeoverCode(0);
		service.takeover(users);
		int giverNo =service.searchGiver(Integer.parseInt(takeoverCode+'0'));
		users.setUserNo(giverNo);
		users.setStatus(1);
		service.takeover(users);
		service.changeStatus(users);
		return "redirect:/";
	}
	
	@RequestMapping(value="userList/takeover", method = RequestMethod.POST)
	public String takeover(@RequestParam(value="giverNo", required=true) String giverNo,@RequestParam(value="takerNo", required=true) String takerNo,@RequestParam(value="takeoverCode", required=true) String takeoverCode){
		logger.info(giverNo);
		logger.info(takerNo);
		logger.info(takeoverCode);
		UserDTO users= new UserDTO();
		users.setUserNo(Integer.parseInt(takerNo));
		users.setTakeoverCode(Integer.parseInt(takeoverCode));
		service.takeover(users);
		takeoverCode=takeoverCode+'0';
		users.setTakeoverCode(Integer.parseInt(takeoverCode));
		users.setUserNo(Integer.parseInt(giverNo));
		service.takeover(users);

		return "redirect:/user/userList";
	}
	
	
	
	
	/**
	 * 회원가입 모달에 입력한 정보 저장
	 * 
	 *
	 * @Method Name : register
	 * @param user
	 * @param rttr
	 * @return
	 */
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(UserDTO user, RedirectAttributes rttr) {

		service.register(user);
		rttr.addFlashAttribute("message", "success");

		return "redirect:/";
	}

	/**
	 * 
	 * 회원가입 모달에서 아이디 중복 검사
	 * 
	 * @Method Name : idCheck
	 * @param registerId
	 * @return
	 */
	@RequestMapping(value = "/idCheck")
	@ResponseBody
	public ResponseEntity<String> idCheck(@RequestParam("registerId") String registerId) {
		ResponseEntity<String> entity = null;

		String result = "";

		try {

			boolean name = service.idCheck(registerId);

			if (name == true) {
				result = "success";
			} else {
				result = "fail";
			}

			entity = new ResponseEntity<String>(result, HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	/**
	 * 로그인
	 * 
	 * @Method Name : login
	 * @param user
	 * @param session
	 * @param model
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public void login(UserDTO user, HttpSession session, Model model) {

		UserDTO loginCheck = service.login(user);

		if (loginCheck == null) {
			return;
		}

		model.addAttribute("user", loginCheck);
	}

	/**
	 * 가입한 회원의 모든 정보 받아오기
	 * 
	 * @Method Name : get
	 * @param user
	 */
	@RequestMapping(value = "/get", method = RequestMethod.GET)
	public void get(UserDTO user) {

		service.get(user.getUserNo());

	}

	/**
	 * 회원의 수정 정보를 입력받아 저장
	 * 
	 *
	 * @Method Name : modify
	 * @param user
	 * @param session
	 * @param request
	 * @param response
	 * @param rttr
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modify(UserDTO user, HttpSession session, HttpServletRequest request, HttpServletResponse response,
			RedirectAttributes rttr) throws Exception {

		service.modify(user);

		Object obj = session.getAttribute("login");
		Cookie userIdCookie = WebUtils.getCookie(request, "userIdCookie");
		if (obj != null) {
			UserDTO user2 = (UserDTO) obj;
			if (userIdCookie != null) {
				userIdCookie.setPath("/");
				userIdCookie.setMaxAge(0);
				response.addCookie(userIdCookie);
				// service.keepLogin(user2.getId(), session.getId(), new Date(0));

			}
		}

		UserDTO userCookie = (UserDTO) user;
		Cookie userIdCookie2 = new Cookie("userIdCookie", userCookie.getId());
		userIdCookie2.setPath("/");
		userIdCookie2.setMaxAge(60 * 60 * 24 * 7);
		response.addCookie(userIdCookie2);

		Cookie CookieForUser = new Cookie("CookieForUser", URLEncoder.encode((userCookie.getName()), "utf-8"));
		CookieForUser.setPath("/");
		CookieForUser.setMaxAge(60 * 60 * 24 * 7);
		response.addCookie(CookieForUser);

		rttr.addFlashAttribute("message", "success");

		return "redirect:/home";
	}

	/**
	 * 
	 * 회원의 상태를 탈퇴회원으로 변경
	 * 
	 * @Method Name : delete
	 * @param userNo
	 * @param password
	 * @param repassword
	 * @return
	 */
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<String> delete(@RequestParam("userNo") int userNo, String password, String repassword) {
		ResponseEntity<String> entity = null;

		String result = "";

		UserDTO loginUser = service.get(userNo);
		String userPw = loginUser.getPassword();
		try {
			// 회원 비밀번호와 입력한 비번이 다르면
			if (!password.equals(userPw)) {
				result = "fail";

			} else {
				result = "success";

				service.delete(userNo);
			}

			entity = new ResponseEntity<String>(result, HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}

		return entity;

	}

	/**
	 * 
	 * 로그아웃 실행
	 * 
	 * @Method Name : logout
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) {

		Object obj = session.getAttribute("login");

		if (obj != null) {
			UserDTO user = (UserDTO) obj;

			session.removeAttribute("login");
			session.invalidate();

			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			Cookie userIdCookie = WebUtils.getCookie(request, "userIdCookie");

			if (loginCookie != null) {
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
				// service.keepLogin(user.getId(), session.getId(), new Date(0));
			}
			if (userIdCookie != null) {
				userIdCookie.setPath("/");
				userIdCookie.setMaxAge(0);
				response.addCookie(userIdCookie);
				// service.keepLogin(user.getId(), session.getId(), new Date(0));
			}

		}
		return "redirect:/";
	}

	/**
	 * 
	 * 비밀번호 찾기
	 * 
	 * @Method Name : findPw
	 * @param id
	 * @param name
	 * @param phone
	 * @return
	 */
	@RequestMapping(value = "/findPw")
	@ResponseBody
	public ResponseEntity<String> findPw(String id, String name, String phone) {
		ResponseEntity<String> entity = null;

		try {
			String returnPw = service.findPw(id, name, phone);
			entity = new ResponseEntity<String>(returnPw, HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	/**
	 * 
	 * 새로운 비밀번호를 생성
	 * 
	 * @Method Name : createNewPw
	 * @param password
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/createNewPw")
	@ResponseBody
	public ResponseEntity<String> createNewPw(@RequestParam("password") String password,
			@RequestParam("id") String id) {
		ResponseEntity<String> entity = null;

		try {
			service.createNewPw(id, password);

			String success = "success";

			entity = new ResponseEntity<String>(success, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
	/** 모바일 전용 컨트롤러 */
	
	/**
	 * 모바일용 회원 목록 조회
	 *
	 * @Method Name : getUserListMobile
	 * @return
	 */
	@RequestMapping(value = "/userListMobile", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getUserListMobile () {
		Map<String, Object> userMap = new HashMap<String, Object>();
		List<UserDTO> userList = service.UserListAll();
		
		userMap.put("list", userList);
		
		return userMap;
	}
}
