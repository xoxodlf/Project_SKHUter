package com.classs.skhuter.notice.dao;

import java.util.List;

import com.classs.skhuter.notice.domain.AccountingDTO;

public interface AccountingDAO {
	public void register(AccountingDTO accounting);
	
	public void remove(int accountNo);
	
	public List<AccountingDTO> listAll();
}
