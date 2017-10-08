package com.classs.skhuter.notice.service;

import java.util.List;

import com.classs.skhuter.notice.domain.StuScheduleDTO;

public interface StuScheduleService {
	
	public void register(StuScheduleDTO schoolSchedule);
	public List<StuScheduleDTO> listAllSchedule();
	public void deleteSchedule(int schoolScheduleNo);
}
