package com.classs.skhuter.notice.service;

import java.util.List;

import com.classs.skhuter.notice.domain.StuScheduleDTO;

public interface StuScheduleService {
	
	/**
	 * 
	 * 스케쥴등록
	 */
	public void register(StuScheduleDTO schoolSchedule);
	
	/**
	 * 
	 * 스케쥴 목록을 리스트로 불러오기
	 */
	public List<StuScheduleDTO> listAllSchedule();
	
	/**
	 * 
	 * 스케쥴 삭제
	 */
	public void deleteSchedule(int schoolScheduleNo);
}
