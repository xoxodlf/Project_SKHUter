package com.classs.skhuter.notice.dao;

import java.util.List;

import com.classs.skhuter.notice.domain.NoticeDTO;
import com.classs.skhuter.util.Criteria;
 
public interface NoticeDAO {
	/** 게시물 등록 **/
	public void create(NoticeDTO notice);

	/** 게시물 불러오기 **/
	public NoticeDTO read(int noticeNo) throws Exception;

	/** 게시물 삭제 **/
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
}
