package com.classs.skhuter.notice.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.classs.skhuter.notice.dao.AccountingDAO;
import com.classs.skhuter.notice.domain.AccountingDTO;
import com.classs.skhuter.util.Criteria;

@Service
public class AccountingServiceImpl implements AccountingService {
	
	@Inject
	private AccountingDAO dao;

	@Override
	public void register(AccountingDTO accounting) {
		// TODO Auto-generated method stub
		dao.register(accounting);
	}

	@Override
	public void remove(int accountNo) {
		// TODO Auto-generated method stub
		dao.remove(accountNo);
	}

	@Override
	public List<AccountingDTO> listPage(int page) throws Exception{
		// TODO Auto-generated method stub
		return dao.listPage(page);
	}

	@Override
	public List<AccountingDTO> listAll() {
		// TODO Auto-generated method stub
		return dao.listAll();
	}

	@Override
	public List<AccountingDTO> listCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listCriteria(cri);
	}

	@Override
	public int ListCountCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.countPaging(cri);
	}

}
