package com.classs.skhuter.user.dao;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import com.classs.skhuter.user.domain.UserDTO;
import com.classs.skhuter.util.Criteria;

import oracle.net.aso.i;

/**
 * UserDao 인터페이스를 구현하는 클래스
 * 
 * @패키지 : com.classs.skhuter.user.dao
 * @파일명 : UserDAOImpl.java
 * @작성자 : 이종윤
 * @작성일 : 2017. 9. 19. 
 *
 */

@Repository
public class UserDAOImpl implements UserDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static String namespace = "com.classs.skhuter.mappers.UserMapper";
	
	Logger logger = Logger.getLogger(UserDAOImpl.class);

	@Override
	public void register(UserDTO user) {
		sqlSession.insert(namespace + ".register", user);
	}
	
	@Override
	public void setStatus(String id) {
		sqlSession.update(namespace + ".setStatus", id);
	}

	@Override
	public boolean idCheck(String id) {
		String idCheck = sqlSession.selectOne(namespace + ".idCheck", id);
		if (idCheck == null) {
			return true;
		} else {
			return false;
		}
	}
	
	@Override
	public UserDTO get(int userNo) {
		return sqlSession.selectOne(namespace + ".get", userNo);
	}

	@Override
	public List<UserDTO> UserListAll() {
		return sqlSession.selectList(namespace + ".userListAll");
	}

	@Override
	public UserDTO login(UserDTO user) {
		return sqlSession.selectOne(namespace + ".login", user);
	}

	@Override
	public void keepLogin(String id, String sessionId, Date sessionLimit) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("id", id);
		paramMap.put("sessionId", sessionId);
		paramMap.put("sessionLimit", sessionLimit);
		
		sqlSession.update(namespace + ".keepLogin", paramMap);		
	}

	@Override
	public UserDTO checkUserWithSessionKey(String cookieValue) {
		return sqlSession.selectOne(namespace + ".checkUserWithSessionKey", cookieValue);
	}

	@Override
	public void modify(UserDTO user) {
		sqlSession.update(namespace + ".modify", user);
	}

	@Override
	public String findPw(String id, String name, String phone) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("id", id);
		paramMap.put("name", name);
		paramMap.put("phone", phone);
		
		return sqlSession.selectOne(namespace + ".findPw", paramMap);
	}

	@Override
	public void createNewPw(String id, String password) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("id", id);
		paramMap.put("password", password);
		
		sqlSession.update(namespace + ".createNewPw", paramMap);
	}

	@Override
	public void delete(int userNo) {
		sqlSession.update(namespace + ".delete", userNo);
	}

	@Override
	public void changeStatus(UserDTO user) {
		sqlSession.update(namespace+".changeStatus",user);
		
	}

	@Override
	public void takeover(UserDTO takeoverCode) {
		sqlSession.update(namespace+".takeover",takeoverCode);
		
	}

	@Override
	public int searchGiver(int takeoverCode) {
		return sqlSession.selectOne(namespace+".searchGiver",takeoverCode);
		
	}

	@Override
	public List<UserDTO> searchName(Criteria cri) {
		return sqlSession.selectList(namespace+".listsearch_name",cri);
	}

	@Override
	public List<UserDTO> searchId(Criteria cri) {
		return sqlSession.selectList(namespace+".listsearch_id",cri);
	}

	@Override
	public List<UserDTO> searchGrade(Criteria cri) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".listsearch_grade",cri);
	}

}
