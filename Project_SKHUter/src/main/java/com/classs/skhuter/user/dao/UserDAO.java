package com.classs.skhuter.user.dao;

import com.classs.skhuter.user.domain.UserDTO;

/**
 * 유저 관련 DB에서 데이터를 가져와 모델 생성
 * 
 * @패키지 : com.classs.skhuter.user.dao
 * @파일명 : UserDAO.java
 * @작성자 : 이종윤
 * @작성일 : 2017. 9. 19. 
 *
 */
public interface UserDAO {
	
	/** 회원 가입 */
	public void register(UserDTO user);

}
