package com.classs.skhuter.notice.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.classs.skhuter.notice.dao.AccountingDAO;
import com.classs.skhuter.notice.domain.AccountingDTO;

@Repository
public class AccountingDAOImpl implements AccountingDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static String namespace = "com.classs.skhuter.mappers.NoticeMapper";
	
	@Override
	public void register(AccountingDTO accounting) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace+".insertAccounting",accounting);
	}

	@Override
	public void remove(int accountNo) {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace+".deleteAccounting",accountNo);
	}

	@Override
	public List<AccountingDTO> listAll() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".accountingListAll");
	}

}
