package com.classs.skhuter.council.service;

import java.util.List;

import com.classs.skhuter.council.domain.CouncilScheduleDTO;

public interface CouncilScheduleService {
	
	/** 일정 등록 */
	public void register(CouncilScheduleDTO councilSchedule);
	public List<CouncilScheduleDTO> listAllSchedule();
	public void deleteSchedule(int councilScheduleNo);
}
