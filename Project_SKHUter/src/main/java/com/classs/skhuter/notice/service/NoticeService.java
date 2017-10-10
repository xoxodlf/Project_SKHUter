package com.classs.skhuter.notice.service;

import java.util.List;

import com.classs.skhuter.notice.domain.NoticeDTO;
import com.classs.skhuter.util.Criteria;

public interface NoticeService {
	/** 공지 등록 **/
	public void create(NoticeDTO notice);

	/** 공지 불러오기 **/
	public NoticeDTO read(int noticeNo) throws Exception;

	/** 공지 삭제 **/
	public void delete(int noticeNo) throws Exception;
	
	/**페이징 공지사항 출력**/
	public List<NoticeDTO> listCriteria(Criteria cri) throws Exception;
	
	/** totalCount 변환 기능 **/
	public int countPaging(Criteria cri) throws Exception;
	
	public List<NoticeDTO> listSearch_t(Criteria cri)throws Exception;
	public int listSearchCount_t(Criteria cri)throws Exception;
	  
	public List<NoticeDTO> listSearch_c(Criteria cri)throws Exception;
	public int listSearchCount_c(Criteria cri)throws Exception;
	  
	public List<NoticeDTO> listSearch_tc(Criteria cri)throws Exception;
	public int listSearchCount_tc(Criteria cri)throws Exception;
	
	/** 조회수 처리 **/
	public void updateHitCount(int noticeNo) throws Exception;
}
