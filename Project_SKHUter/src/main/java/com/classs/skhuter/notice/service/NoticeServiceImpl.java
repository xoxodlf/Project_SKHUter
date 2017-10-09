package com.classs.skhuter.notice.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.classs.skhuter.notice.dao.NoticeDAO;
import com.classs.skhuter.notice.domain.NoticeDTO;
import com.classs.skhuter.util.Criteria;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Inject
	private NoticeDAO dao;

	@Override
	public void create(NoticeDTO notice) {
		dao.create(notice);
	}

	@Override
	public NoticeDTO read(int noticeNo) throws Exception {
		return dao.read(noticeNo);
	}

	@Override
	public void delete(int noticeNo) throws Exception {
		dao.delete(noticeNo);
	}

	@Override
	public List<NoticeDTO> listCriteria(Criteria cri) throws Exception {
		return dao.listCriteria(cri);
	}

	@Override
	public int countPaging(Criteria cri) throws Exception {
		return dao.countPaging(cri);
	}

	@Override
	public List<NoticeDTO> listSearch_t(Criteria cri) throws Exception {
		return dao.listSearch_t(cri);
	}

	@Override
	public int listSearchCount_t(Criteria cri) throws Exception {
		return dao.listSearchCount_t(cri);
	}

	@Override
	public List<NoticeDTO> listSearch_c(Criteria cri) throws Exception {
		return dao.listSearch_c(cri);
	}

	@Override
	public int listSearchCount_c(Criteria cri) throws Exception {
		return dao.listSearchCount_c(cri);
	}

	@Override
	public List<NoticeDTO> listSearch_tc(Criteria cri) throws Exception {
		return dao.listSearch_tc(cri);
	}

	@Override
	public int listSearchCount_tc(Criteria cri) throws Exception {
		return dao.listSearchCount_tc(cri);
	}

}
