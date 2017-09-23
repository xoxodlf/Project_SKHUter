package com.classs.skhuter.council.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.classs.skhuter.council.dao.MeetingNoteDAO;
import com.classs.skhuter.council.domain.MeetingNoteDTO;

@Service
public class MeetingNoteServiceImpl implements MeetingNoteService {
	
	@Inject
	private MeetingNoteDAO dao;

	@Override
	public void register(MeetingNoteDTO meetingNote) {
		// TODO Auto-generated method stub
		dao.register(meetingNote);
	}

	@Override
	public void remove(int meetingNoteNo) {
		// TODO Auto-generated method stub
		dao.remove(meetingNoteNo);
	}

	@Override
	public List<MeetingNoteDTO> listAll() {
		// TODO Auto-generated method stub
		return dao.listAll();
	}
	

}
