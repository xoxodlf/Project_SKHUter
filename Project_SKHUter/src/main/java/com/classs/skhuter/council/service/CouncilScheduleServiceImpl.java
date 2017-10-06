package com.classs.skhuter.council.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.classs.skhuter.council.dao.CouncilScheduleDAO;
import com.classs.skhuter.council.domain.CouncilScheduleDTO;

@Service
public class CouncilScheduleServiceImpl implements CouncilScheduleService {
	
	@Inject
	private CouncilScheduleDAO dao;

	@Override
	public void register(CouncilScheduleDTO councilSchedule) {
		dao.register(councilSchedule);
	}

	@Override
	public List<CouncilScheduleDTO> listAllSchedule() {
		return dao.listAllSchedule();
	}

	@Override
	public void deleteSchedule(int councilScheduleNo) {
		dao.deleteSchedule(councilScheduleNo);
	}
}
