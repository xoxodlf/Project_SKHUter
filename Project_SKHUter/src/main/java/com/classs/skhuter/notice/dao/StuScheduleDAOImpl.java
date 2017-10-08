package com.classs.skhuter.notice.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import com.classs.skhuter.notice.domain.StuScheduleDTO;

@Repository
public class StuScheduleDAOImpl implements StuScheduleDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static String namespace = "com.classs.skhuter.mappers.NoticeMapper";
	
	Logger logger = Logger.getLogger(StuScheduleDAOImpl.class);
	
	@Override
	public void register(StuScheduleDTO schoolSchedule) {
		sqlSession.insert(namespace + ".insertStuSchedule", schoolSchedule);
		
	}

	@Override
	public List<StuScheduleDTO> listAllSchedule() {
		return sqlSession.selectList(namespace+".listAllSchedule");
	}

	@Override
	public void deleteSchedule(int schoolScheduleNo) {
		sqlSession.delete(namespace+".deleteSchedule", schoolScheduleNo);
	}

}
