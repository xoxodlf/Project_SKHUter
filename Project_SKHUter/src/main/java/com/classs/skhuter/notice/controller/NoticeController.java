package com.classs.skhuter.notice.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.classs.skhuter.board.domain.BoardDTO;
import com.classs.skhuter.notice.domain.NoticeDTO;
import com.classs.skhuter.notice.service.NoticeService;
import com.classs.skhuter.util.Criteria;
import com.classs.skhuter.util.PageMaker;

/**
 * 공지사항 관련 프로젝트 Controller @RequestMapping("/board") URI 매칭
 * 
 * @패키지 : com.classs.skhuter.notice.controller
 * @파일명 : NoticeController.java
 * @작성자 : 양태일
 * @작성일 : 2017. 10. 09.
 *
 */
@Controller
@RequestMapping("/notice")
public class NoticeController {

	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);

	@Inject
	private NoticeService service;

	/**
	 * 공지사항 리스트 목록 조회
	 * 
	 * @Method Name : noticeList
	 * @param cri
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/noticeList", method = RequestMethod.GET)
	public String noticeList(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {

		List<NoticeDTO> list;

		if (cri.getSearchType() != null) {
			if (cri.getSearchType().equals("t")) {
				list = service.listSearch_t(cri);
			} else if (cri.getSearchType().equals("c")) {
				list = service.listSearch_c(cri);
			} else if (cri.getSearchType().equals("tc")) {
				list = service.listSearch_tc(cri);
			} else {
				list = service.listCriteria(cri);
			}
		} else {
			logger.info(cri.toString());
			list = service.listCriteria(cri);
		}

		model.addAttribute("noticeList", list);
		
		PageMaker pageMaker = new PageMaker();
		
		pageMaker.setCri(cri);
		if (cri.getSearchType() == "t")
			pageMaker.setTotalCount(service.listSearchCount_t(cri));
		else if (cri.getSearchType() == "c")
			pageMaker.setTotalCount(service.listSearchCount_c(cri));
		else if (cri.getSearchType() == "tc")
			pageMaker.setTotalCount(service.listSearchCount_tc(cri));
		else
			pageMaker.setTotalCount(service.countPaging(cri));

		model.addAttribute("pageMaker", pageMaker);
		
		return "notice/noticeList.lay";
		
	}

	/**
	 * 공지사항 상세 보기
	 *
	 * @Method Name : noticeDetail
	 * @param noticeNo
	 * @param cri
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/noticeDetail", method = RequestMethod.GET)
	public String noticeDetail(@RequestParam("noticeNo") int noticeNo, @ModelAttribute("cri") Criteria cri, Model model)
			throws Exception {
		
		service.updateHitCount(noticeNo);
		
		model.addAttribute(cri);
		model.addAttribute(service.read(noticeNo));

		return "notice/noticeDetail.lay";
	}

	/**
	 * 공지사항 등록 (GET 방식)
	 * 
	 *
	 * @Method Name : noticeForm
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/noticeForm", method = RequestMethod.GET)
	public String noticeForm(Model model) {
		return "notice/noticeForm.lay";
	}

	/**
	 * 공지사항 등록 (POST 방식)
	 *
	 * @Method Name : registPOST
	 * @param notice
	 * @param rttr
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/noticeForm", method = RequestMethod.POST)
	public String registPOST(NoticeDTO notice, RedirectAttributes rttr) throws Exception {

		service.create(notice);
		
		rttr.addFlashAttribute("message", "createsuccess");
		
		logger.info(notice.toString());

		return "redirect:/notice/noticeList";
	}

	
	@RequestMapping(value = "/noticeList/deleteList", method = RequestMethod.POST)
	public String deleteNoticeList(@RequestParam(value = "check", required = true) List<String> checks)
			throws Exception {
		for (String check : checks) {
			service.delete(Integer.parseInt(check));
		}
		return "redirect:/notice/noticeList";
	}

	@RequestMapping(value = "/noticeDetail/delete", method = RequestMethod.POST)
	public String deleteNotice(@RequestParam("noticeNo") int noticeNo, Criteria cri, RedirectAttributes rttr)
			throws Exception {
		service.delete(noticeNo);

		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addFlashAttribute("message", "deletesuccess");

		return "redirect:/notice/noticeList";
	}

	
	/** 모바일 전용 컨트롤러 */
	
	/**
	 * 모바일용 공지사항 조회
	 *
	 * @Method Name : noticeListM
	 * @param cri
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/noticeListM", method = RequestMethod.GET)
	public String noticeListM(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {

		List<NoticeDTO> list;
		if (cri.getSearchType() != null) {
			if (cri.getSearchType().equals("t")) {
				list = service.listSearch_t(cri);
			} else if (cri.getSearchType().equals("c"))
				list = service.listSearch_c(cri);
			else if (cri.getSearchType().equals("tc"))
				list = service.listSearch_tc(cri);
			else {
				list = service.listCriteria(cri);
			}
		} else {
			logger.info(cri.toString());
			list = service.listCriteria(cri);
		}

		model.addAttribute("noticeList", list);
		
		PageMaker pageMaker = new PageMaker();
		
		pageMaker.setCri(cri);
		
		if (cri.getSearchType() == "t")
			pageMaker.setTotalCount(service.listSearchCount_t(cri));
		else if (cri.getSearchType() == "c")
			pageMaker.setTotalCount(service.listSearchCount_c(cri));
		else if (cri.getSearchType() == "tc")
			pageMaker.setTotalCount(service.listSearchCount_tc(cri));
		else
			pageMaker.setTotalCount(service.countPaging(cri));

		model.addAttribute("pageMaker", pageMaker);
		
		return "notice/noticeListM";
	}

	/**
	 * 모바일용 공지사항 상세보기
	 *
	 * @Method Name : noticeDetailM
	 * @param noticeNo
	 * @param cri
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/noticeDetailM", method = RequestMethod.GET)
	public String noticeDetailM(@RequestParam("noticeNo") int noticeNo, @ModelAttribute("cri") Criteria cri,
			Model model) throws Exception {
		service.updateHitCount(noticeNo);
		model.addAttribute(cri);
		model.addAttribute(service.read(noticeNo));

		return "notice/noticeDetailM";
	}

	/**
	 * 모바일용 공지사항 등록 (GET)
	 * 
	 * @Method Name : noticeFormM
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/noticeFormM", method = RequestMethod.GET)
	public String noticeFormM(Model model) {
		return "notice/noticeFormM";
	}

	/**
	 * 모바일용 공지사항 등록 (POST)
	 * 
	 * @Method Name : registPOSTM
	 * @param notice
	 * @param rttr
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/noticeFormM", method = RequestMethod.POST)
	public String registPOSTM(NoticeDTO notice, RedirectAttributes rttr) throws Exception {

		service.create(notice);
		
		rttr.addFlashAttribute("message", "createsuccess");
		
		logger.info(notice.toString());

		return "redirect:/notice/noticeListM";
	}
}
