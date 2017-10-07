package com.classs.skhuter.notice.service;

import java.util.List;

import com.classs.skhuter.notice.domain.AccountingDTO;
import com.classs.skhuter.util.Criteria;

public interface AccountingService {
	public void register(AccountingDTO accounting);

	public void remove(int accountNo);
	
	public List<AccountingDTO> listAll();

	public List<AccountingDTO> listPage(int page) throws Exception;
	
	public List<AccountingDTO> listCriteria(Criteria cri) throws Exception;
	
	public int ListCountCriteria(Criteria cri) throws Exception;
}
