package com.classs.skhuter.user.service;

import com.classs.skhuter.user.domain.UserDTO;

/**
 * 유저 관련 인터페이스 정의
 * 
 * @패키지 : com.classs.skhuter.user.service
 * @파일명 : UserService.java
 * @작성자 : 이종윤
 * @작성일 : 2017. 9. 19. 
 *
 */
public interface UserService {

	/** 회원 가입 */
	public void register(UserDTO user);
	
	/** 회원 아이디 중복 체크*/
	public boolean idCheck(String id);
}
