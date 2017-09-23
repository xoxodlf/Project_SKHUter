package com.classs.skhuter.council.service;

import java.util.List;

import com.classs.skhuter.council.domain.MeetingNoteDTO;

public interface MeetingNoteService {
	/*회의록 등록*/
	public void register(MeetingNoteDTO meetingNote);
	/*게시글 삭제*/
	public void remove(int meetingNoteNo);
	/*게시되어 있는 목록을 모두 가져오기*/
	public List<MeetingNoteDTO> listAll();
}
