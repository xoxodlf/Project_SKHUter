package com.classs.skhuter.council.dao;

import java.util.List;

import com.classs.skhuter.council.domain.MeetingNoteDTO;

public interface MeetingNoteDAO {
	
	public void register(MeetingNoteDTO meetingNote);
	
	public void remove(int meetingNoteNo);
	
	public List<MeetingNoteDTO> listAll();
	
}
