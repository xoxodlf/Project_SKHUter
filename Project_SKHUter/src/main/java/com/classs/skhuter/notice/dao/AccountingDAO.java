package com.classs.skhuter.notice.dao;

import java.util.List;

import com.classs.skhuter.notice.domain.AccountingDTO;
import com.classs.skhuter.util.Criteria;

public interface AccountingDAO {
	public void register(AccountingDTO accounting);
	
	public void remove(int accountNo);
	
	public List<AccountingDTO> listAll();
	
	public List<AccountingDTO> listPage(int page) throws Exception;
	
	public List<AccountingDTO> listCriteria(Criteria cri) throws Exception;
	
	public int countPaging(Criteria cri) throws Exception;
	
	public List<AccountingDTO> ListCriteriaStatus(Criteria cri, int status);
	
	public List<AccountingDTO> accountingListCriteriaAll(Criteria cri);
	
	public List<AccountingDTO> ListCriteriaStatusPage(Criteria cri, int status);
	
	public List<AccountingDTO> accountingListCriteriaAllPage(Criteria cri);
}
