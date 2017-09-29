package com.classs.skhuter.notice.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.classs.skhuter.notice.dao.AccountingDAO;
import com.classs.skhuter.notice.domain.AccountingDTO;

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
	public List<AccountingDTO> listAll() {
		// TODO Auto-generated method stub
		return dao.listAll();
	}

}
