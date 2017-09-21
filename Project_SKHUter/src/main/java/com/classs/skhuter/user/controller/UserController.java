package com.classs.skhuter.user.controller;

import javax.inject.Inject;

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

import com.classs.skhuter.user.domain.UserDTO;
import com.classs.skhuter.user.service.UserService;

/**
 * 회원 관련 프로젝트 Controller
 * @RequestMapping("/user") URI 매칭
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
	
	@RequestMapping(value="/user/userList", method=RequestMethod.GET)
	public String noticeList(Model model) {
		return "user/userList.lay";
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
	public String register (UserDTO user, RedirectAttributes rttr) {
		
		
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
		    	  
		    	  if(name == true){
		    		  result = "success";
		    	  }else{
		    		  result = "fail";
		    	  }
		    	  
		    	  entity = new ResponseEntity<String>(result, HttpStatus.OK);
		    	  
		      } catch (Exception e) {
		         e.printStackTrace();
		         entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		      }
		      
		      return entity;
		}
}
