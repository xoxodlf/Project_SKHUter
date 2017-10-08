package com.classs.skhuter.notice.dao;

import java.util.List;

import com.classs.skhuter.notice.domain.StuScheduleDTO;

public interface StuScheduleDAO {

	public void register(StuScheduleDTO schoolSchedule);
	public List<StuScheduleDTO> listAllSchedule();
	public void deleteSchedule(int schoolScheduleNo);
	
}
