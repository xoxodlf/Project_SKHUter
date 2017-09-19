package com.classs.skhuter.user.service;

import javax.inject.Inject;

import com.classs.skhuter.user.dao.UserDAO;
import com.classs.skhuter.user.domain.UserDTO;

/**
 * UserService 인터페이스 구현 클래스
 * 
 * @패키지 : com.classs.skhuter.user.service
 * @파일명 : UserServiceImpl.java
 * @작성자 : 이종윤
 * @작성일 : 2017. 9. 19. 
 *
 */
public class UserServiceImpl implements UserService {
	
	@Inject
	private UserDAO dao;

	@Override
	public void register(UserDTO user) {
		dao.register(user);
	}

}
