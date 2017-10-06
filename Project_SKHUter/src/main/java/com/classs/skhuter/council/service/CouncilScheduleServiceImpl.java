package com.classs.skhuter.council.service;

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
}
