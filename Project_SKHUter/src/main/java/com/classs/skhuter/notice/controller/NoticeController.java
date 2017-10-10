package com.classs.skhuter.notice.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

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
import com.classs.skhuter.user.domain.UserDTO;
import com.classs.skhuter.util.Criteria;
import com.classs.skhuter.util.PageMaker;


@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);

	@Inject
	private NoticeService service;
	
	@RequestMapping(value="/noticeList", method=RequestMethod.GET)
	public String noticeList(@ModelAttribute("cri") Criteria cri,Model model) throws Exception {
		
		List<NoticeDTO> list;
		if(cri.getSearchType()!=null) {
			if(cri.getSearchType().equals("t")) {
				list = service.listSearch_t(cri);
			}
			else if(cri.getSearchType().equals("c")) list = service.listSearch_c(cri);
			else if(cri.getSearchType().equals("tc"))list = service.listSearch_tc(cri);
			else {
				list = service.listCriteria(cri);
			}
			}else {
				logger.info(cri.toString());
				list = service.listCriteria(cri);
			}
		
		model.addAttribute("noticeList",list);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		if(cri.getSearchType()=="t") pageMaker.setTotalCount(service.listSearchCount_t(cri));
		else if(cri.getSearchType()=="c") pageMaker.setTotalCount(service.listSearchCount_c(cri));
		else if(cri.getSearchType()=="tc")pageMaker.setTotalCount(service.listSearchCount_tc(cri));
		else pageMaker.setTotalCount(service.countPaging(cri));

		model.addAttribute("pageMaker", pageMaker);
		return "notice/noticeList.lay";
	}
	
	@RequestMapping(value="/noticeDetail", method=RequestMethod.GET)
	public String noticeDetail(@RequestParam("noticeNo") int noticeNo, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		service.updateHitCount(noticeNo);
		model.addAttribute(cri);
		model.addAttribute(service.read(noticeNo));
		
		return "notice/noticeDetail.lay";
	}
	
	
	
	
	@RequestMapping(value="/noticeForm", method=RequestMethod.GET)
	public String noticeForm(Model model) {
		return "notice/noticeForm.lay";
	}
	@RequestMapping(value = "/noticeForm", method = RequestMethod.POST)
	public String registPOST(NoticeDTO notice, RedirectAttributes rttr) throws Exception {

		service.create(notice);
		rttr.addFlashAttribute("message", "createsuccess");
		logger.info(notice.toString());

		return "redirect:/notice/noticeList";
	}
	
	@RequestMapping(value = "/noticeList/deleteList", method = RequestMethod.POST)
	public String deleteNoticeList(@RequestParam(value="check", required=true) List<String> checks) throws Exception {
		for(String check:checks) {
			service.delete(Integer.parseInt(check));
		}
		return "redirect:/notice/noticeList";
	}	
	@RequestMapping(value = "/noticeDetail/delete", method = RequestMethod.POST)
	public String deleteNotice(@RequestParam("noticeNo") int noticeNo, Criteria cri, RedirectAttributes rttr) throws Exception {
			service.delete(noticeNo);

	      rttr.addAttribute("page", cri.getPage());
	      rttr.addAttribute("perPageNum", cri.getPerPageNum());
	      rttr.addFlashAttribute("message", "deletesuccess");

	      return "redirect:/notice/noticeList";
	}
	
	///////////////////////모바일 컨트롤러구현/////////////////////////////////////
	
	@RequestMapping(value="/noticeListM", method=RequestMethod.GET)
	public String noticeListM(@ModelAttribute("cri") Criteria cri,Model model, UserDTO user,HttpServletRequest req) throws Exception {
		if (user != null) {
		      req.getSession().setAttribute("login", user);
		   } else {
		      user = (UserDTO) req.getSession().getAttribute("login");
		   }
		List<NoticeDTO> list;
		if(cri.getSearchType()!=null) {
			if(cri.getSearchType().equals("t")) {
				list = service.listSearch_t(cri);
			}
			else if(cri.getSearchType().equals("c")) list = service.listSearch_c(cri);
			else if(cri.getSearchType().equals("tc"))list = service.listSearch_tc(cri);
			else {
				list = service.listCriteria(cri);
			}
			}else {
				logger.info(cri.toString());
				list = service.listCriteria(cri);
			}
		
		model.addAttribute("noticeList",list);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		if(cri.getSearchType()=="t") pageMaker.setTotalCount(service.listSearchCount_t(cri));
		else if(cri.getSearchType()=="c") pageMaker.setTotalCount(service.listSearchCount_c(cri));
		else if(cri.getSearchType()=="tc")pageMaker.setTotalCount(service.listSearchCount_tc(cri));
		else pageMaker.setTotalCount(service.countPaging(cri));
		model.addAttribute("UserDTO",user);
		model.addAttribute("pageMaker", pageMaker);
		return "notice/noticeListM";
	}
	
	@RequestMapping(value="/noticeDetailM", method=RequestMethod.GET)
	public String noticeDetailM(@RequestParam("noticeNo") int noticeNo, @ModelAttribute("cri") Criteria cri, Model model,HttpServletRequest req) throws Exception {
		service.updateHitCount(noticeNo);
		model.addAttribute(cri);
		model.addAttribute(service.read(noticeNo));
		UserDTO user = (UserDTO) req.getSession().getAttribute("login");
		model.addAttribute("UserDTO",user);
		return "notice/noticeDetailM";
	}
	
	@RequestMapping(value="/noticeFormM", method=RequestMethod.GET)
	public String noticeFormM(Model model,HttpServletRequest req) {
		return "notice/noticeFormM";
	}
	@RequestMapping(value = "/noticeFormM", method = RequestMethod.POST)
	public String registPOSTM(NoticeDTO notice, RedirectAttributes rttr,Model model,HttpServletRequest req) throws Exception {
		UserDTO user = (UserDTO) req.getSession().getAttribute("login");
		notice.setUserNo(user.getUserNo());
		service.create(notice);
		rttr.addFlashAttribute("message", "createsuccess");
		model.addAttribute(user);
		logger.info(notice.toString());

		return "redirect:/notice/noticeListM";
	}
	
	@RequestMapping(value = "/noticeDetail/deleteM", method = RequestMethod.POST)
	public String deleteNoticeM(@RequestParam("noticeNo") int noticeNo, Criteria cri, RedirectAttributes rttr,HttpServletRequest req, Model model) throws Exception {
		UserDTO user = (UserDTO) req.getSession().getAttribute("login");	
		service.delete(noticeNo);
			
	      rttr.addAttribute("page", cri.getPage());
	      rttr.addAttribute("perPageNum", cri.getPerPageNum());
	      rttr.addFlashAttribute("message", "deletesuccess");
	      return "redirect:/notice/noticeListM";
	}
}
