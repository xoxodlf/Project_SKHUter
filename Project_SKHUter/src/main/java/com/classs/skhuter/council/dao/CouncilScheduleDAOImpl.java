package com.classs.skhuter.council.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import com.classs.skhuter.council.domain.CouncilScheduleDTO;
import com.classs.skhuter.user.dao.UserDAOImpl;

@Repository
public class CouncilScheduleDAOImpl implements CouncilScheduleDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static String namespace = "com.classs.skhuter.mapper.CouncilMapper";
	
	Logger logger = Logger.getLogger(UserDAOImpl.class);

	@Override
	public void register(CouncilScheduleDTO councilSchedule) {
		sqlSession.insert(namespace + ".insertCouncilSchedule", councilSchedule);
	}
}
