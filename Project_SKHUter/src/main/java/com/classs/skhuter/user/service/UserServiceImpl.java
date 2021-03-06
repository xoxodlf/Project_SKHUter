package com.classs.skhuter.user.service;

import java.sql.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.classs.skhuter.user.dao.UserDAO;
import com.classs.skhuter.user.domain.UserDTO;
import com.classs.skhuter.util.Criteria;

/**
 * UserService 인터페이스 구현 클래스
 * 
 * @패키지 : com.classs.skhuter.user.service
 * @파일명 : UserServiceImpl.java
 * @작성자 : 이종윤
 * @작성일 : 2017. 9. 19. 
 *
 */

@Service
public class UserServiceImpl implements UserService {
	
	@Inject
	private UserDAO dao;

	@Override
	public void register(UserDTO user) {
		dao.register(user);
	}

	@Override
	public boolean idCheck(String id) {
		return dao.idCheck(id);
	}

	@Override
	public UserDTO get(int userNo) {
		return dao.get(userNo);
	}
	
	@Override
	public List<UserDTO> UserListAll() {
		return dao.UserListAll();
	}

	@Override
	public UserDTO login(UserDTO user) {
		return dao.login(user);
	}

	@Override
	public void keepLogin(String id, String sessionId, Date sessionLimit) {
		dao.keepLogin(id, sessionId, sessionLimit);
	}

	@Override
	public UserDTO checkUserWithSessionKey(String cookieValue) {
		return dao.checkUserWithSessionKey(cookieValue);
	}

	@Override
	public void modify(UserDTO user) {
		dao.modify(user);
	}

	@Override
	public String findPw(String id, String name, String phone) {
		return dao.findPw(id, name, phone);
	}

	@Override
	public void createNewPw(String id, String password) {
		dao.createNewPw(id, password);
	}

	@Override
	public void delete(int userNo) {
		dao.delete(userNo);
	}

	@Override
	public void changeStatus(UserDTO user) {
		dao.changeStatus(user);
		
	}

	@Override
	public void takeover(UserDTO takeoverCode) {
		dao.takeover(takeoverCode);		
	}

	@Override
	public int searchGiver(int takeoverCode) {
	
		return dao.searchGiver(takeoverCode);
	}

	@Override
	public List<UserDTO> searchName(Criteria cri) {
		return dao.searchName(cri);
	}

	@Override
	public List<UserDTO> searchId(Criteria cri) {
		return dao.searchId(cri);
	}

	@Override
	public List<UserDTO> searchGrade(Criteria cri) {
		return dao.searchGrade(cri);
	}

}
