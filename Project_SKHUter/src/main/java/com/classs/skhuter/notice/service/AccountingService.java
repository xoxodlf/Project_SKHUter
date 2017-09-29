package com.classs.skhuter.notice.service;

import java.util.List;

import com.classs.skhuter.notice.domain.AccountingDTO;

public interface AccountingService {
	public void register(AccountingDTO accounting);

	public void remove(int accountNo);

	public List<AccountingDTO> listAll();
}
