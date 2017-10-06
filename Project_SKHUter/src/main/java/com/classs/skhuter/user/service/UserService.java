package com.classs.skhuter.user.service;

import java.sql.Date;
import java.util.List;

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
	
	/** 회원 목록 조회 */
	public List<UserDTO> UserListAll ();
	
	/** 회원 정보 불러오기 */
	public UserDTO get (int userNo);
	
	/** 로그인 */
	public UserDTO login(UserDTO user);
	
	/** 로그인사용자의 세션키와 세션리밋 업데이트 */
	public void keepLogin (String id, String sessionId, Date sessionLimit);
	
	/** 로그인쿠키로 사용자 조회 */
	public UserDTO checkUserWithSessionKey (String cookieValue);
	
	/** 회원 정보수정 */
	public void modify (UserDTO user);
	
	/** 아이디, 이름, 전화번호로 비밀번호 찾기*/
	public String findPw(String id, String name, String phone);
	
	/** 비밀번호 찾기 후 새로운 비밀번호 등록 */
	public void createNewPw(String id, String password);
	
	/** 회원 탈퇴*/
	public void delete(int userNo);
	
	/** 등급변경*/
	public void changeStatus(UserDTO user);
	
	/** 인수인계*/
	public void takeover(UserDTO takeoverCode);
}
