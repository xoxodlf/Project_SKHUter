package com.classs.skhuter.council.dao;

import java.util.List;

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
	
	Logger logger = Logger.getLogger(CouncilScheduleDAOImpl.class);

	@Override
	public void register(CouncilScheduleDTO councilSchedule) {
		sqlSession.insert(namespace + ".insertCouncilSchedule", councilSchedule);
	}

	@Override
	public List<CouncilScheduleDTO> listAllSchedule() {
		return sqlSession.selectList(namespace+".listAllSchedule");
	}

	@Override
	public void deleteSchedule(int councilScheduleNo) {
		sqlSession.delete(namespace+".deleteSchedule", councilScheduleNo);
		
	}
}
