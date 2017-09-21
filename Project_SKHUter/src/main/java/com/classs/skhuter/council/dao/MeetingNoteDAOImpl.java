package com.classs.skhuter.council.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.classs.skhuter.council.domain.MeetingNoteDTO;

@Repository
public class MeetingNoteDAOImpl implements MeetingNoteDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static String namespace = "com.classs.skhuter.mappers.meetingNoteMapper";
	
	
	@Override
	public void register(MeetingNoteDTO meetingNote) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace+".insertMeetingNote",meetingNote);
	}
	
}
