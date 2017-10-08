package com.classs.skhuter.notice.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.classs.skhuter.notice.dao.StuScheduleDAO;
import com.classs.skhuter.notice.domain.StuScheduleDTO;
@Service
public class StuScheduleServiceImpl implements StuScheduleService {
	
	@Inject
	private StuScheduleDAO dao;
	
	@Override
	public void register(StuScheduleDTO schoolSchedule) {
		dao.register(schoolSchedule);
	}

	@Override
	public List<StuScheduleDTO> listAllSchedule() {
		return dao.listAllSchedule();
	}

	@Override
	public void deleteSchedule(int schoolScheduleNo) {
		dao.deleteSchedule(schoolScheduleNo);
	}

}
