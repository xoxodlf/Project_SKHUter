package com.classs.skhuter.notice.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.classs.skhuter.notice.dao.AccountingDAO;
import com.classs.skhuter.notice.domain.AccountingDTO;
import com.classs.skhuter.util.Criteria;

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
	public List<AccountingDTO> listPage(int page) throws Exception {
		// TODO Auto-generated method stub
		if(page <= 0) {
			page = 1;
		}
		
		page=(page-1)*5;
		
		return sqlSession.selectList(namespace+".accountingListPage",page);
	}

	@Override
	public List<AccountingDTO> listAll() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".accountingListAll");
	}

	@Override
	public List<AccountingDTO> listCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".accountingListCriteria",cri);
	}

	@Override
	public int countPaging(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".accountingListCountPaging", cri);
	}

	@Override
	public List<AccountingDTO> ListCriteriaStatus(Criteria cri, int status) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("cri", cri);
		paramMap.put("status", status);
		return sqlSession.selectList(namespace+".ListCriteriaStatus",paramMap);
	}

	@Override
	public List<AccountingDTO> accountingListCriteriaAll(Criteria cri) {
		return sqlSession.selectList(namespace+".accountingListCriteriaAll",cri);
	}

	@Override
	public List<AccountingDTO> ListCriteriaStatusPage(Criteria cri, int status) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("cri", cri);
		paramMap.put("status", status);
//		paramMap.put("keyword", cri.getKeyword());
//		paramMap.put("page", cri.getPage());
//		paramMap.put("perPageNum", cri.getPerPageNum());
//		paramMap.put("pageStart", cri.getPageStart());
		return sqlSession.selectList(namespace+".ListCriteriaStatusPage",paramMap);
	}

	@Override
	public List<AccountingDTO> accountingListCriteriaAllPage(Criteria cri) {
		return sqlSession.selectList(namespace+".accountingListCriteriaAllPage",cri);
	}

}
