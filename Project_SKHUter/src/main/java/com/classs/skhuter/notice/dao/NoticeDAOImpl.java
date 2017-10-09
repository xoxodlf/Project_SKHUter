package com.classs.skhuter.notice.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.classs.skhuter.notice.domain.NoticeDTO;
import com.classs.skhuter.util.Criteria;
@Repository
public class NoticeDAOImpl implements NoticeDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static String namespace = "com.classs.skhuter.mappers.NoticeMapper";
	@Override
	public void create(NoticeDTO notice) {
		sqlSession.insert(namespace + ".create", notice);
	}

	@Override
	public NoticeDTO read(int noticeNo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".read", noticeNo);
	}

	@Override
	public void delete(int noticeNo) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<NoticeDTO> listCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int countPaging(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<NoticeDTO> listSearch_t(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int listSearchCount_t(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<NoticeDTO> listSearch_c(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int listSearchCount_c(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<NoticeDTO> listSearch_tc(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int listSearchCount_tc(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
