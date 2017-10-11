package com.classs.skhuter.board.controller;

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
import com.classs.skhuter.board.service.BoardService;
import com.classs.skhuter.user.domain.UserDTO;
import com.classs.skhuter.util.Criteria;
import com.classs.skhuter.util.PageMaker;

/**
 ** 익명게시판 관련 프로젝트 Controller @RequestMapping("/board") URI 매칭
 **/

@Controller
@RequestMapping("/board")
public class BoardController {
   private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

   @Inject
   private BoardService service;
   
   /** 게시글 등록 GET방식 **/
   @RequestMapping(value = "/boardForm", method = RequestMethod.GET)
   public String boardForm(Model model) {

      return "board/boardForm.lay";
   }
   
   /** 게시글 등록 POST방식 **/
   @RequestMapping(value = "/boardForm", method = RequestMethod.POST)
   public String registPOST(BoardDTO board, RedirectAttributes rttr) throws Exception {

      service.create(board);
      rttr.addFlashAttribute("message", "createsuccess");

      return "redirect:/board/boardList";
   }
   
   /** 게시글 불러오기 **/
   @RequestMapping(value = "/boardDetail", method = RequestMethod.GET)
   public String read(@RequestParam("boardNo") int boardNo, @RequestParam("userNo") int userNo, @ModelAttribute("cri") Criteria cri, Model model)
         throws Exception {
	   BoardDTO board=new BoardDTO();
	   
	   board.setBoardNo(boardNo);
	   board.setIslike(service.isLike(boardNo, userNo));
	   board.setIshate(service.ishate(boardNo, userNo));
	   model.addAttribute(cri);
	   model.addAttribute("board",board);
	   model.addAttribute(service.read(boardNo));
      
      return "board/boardDetail.lay";
   }
   
   /** 체크박스로 게시글 삭제하기 **/
   @RequestMapping(value = "/boardList/deleteList", method = RequestMethod.POST)
	public String deleteBoardList(@RequestParam(value = "check", required = true) List<String> checks)
			throws Exception {
		for (String check : checks) {
			service.delete(Integer.parseInt(check));
		}
		return "redirect:/board/boardList/";
	}
   
   /** 게시글 삭제하기 **/
   @RequestMapping(value = "boardDetail/delete", method = RequestMethod.POST)
   public String remove(@RequestParam("boardNo") int boardNo, Criteria cri, RedirectAttributes rttr) throws Exception {
      service.delete(boardNo);

      rttr.addAttribute("page", cri.getPage());
      rttr.addAttribute("perPageNum", cri.getPerPageNum());
      rttr.addFlashAttribute("message", "deletesuccess");

      return "redirect:/board/boardList";
   }

   /**
    * 게시판 리스트 구현 페이징 기능 검색 기능
    **/
   @RequestMapping(value = "/boardList", method = RequestMethod.GET)
   public String listPage(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {

      List<BoardDTO> list;
      
      if(cri.getSearchType()!=null) {
      if(cri.getSearchType().equals("t")) {
         list = service.listSearch_t(cri);
      }
      else if(cri.getSearchType().equals("c")) list = service.listSearch_c(cri);
      else if(cri.getSearchType().equals("tc"))list = service.listSearch_tc(cri);
      else {
         list = service.listCriteria(cri);
      }
      }else list = service.listCriteria(cri);

      
      BoardDTO tmp = new BoardDTO();
      for (BoardDTO board : list) {
         tmp.setBoardNo(board.getBoardNo());
         //댓글수
         int replyCount = service.countReply(tmp);
         board.setReplyCount(replyCount);
         //좋아요 갯수
         int likeCount=service.countLike(tmp);
         board.setLikeCount(likeCount);
         //싫어요 갯수
         int hateCount=service.counthate(tmp);
         board.setHateCount(hateCount);
      }

      model.addAttribute("boardList", list);
      
      PageMaker pageMaker = new PageMaker();
      pageMaker.setCri(cri);
      
      if(cri.getSearchType()=="t") pageMaker.setTotalCount(service.listSearchCount_t(cri));
      else if(cri.getSearchType()=="c") pageMaker.setTotalCount(service.listSearchCount_c(cri));
      else if(cri.getSearchType()=="tc")pageMaker.setTotalCount(service.listSearchCount_tc(cri));
      else pageMaker.setTotalCount(service.listCountCriteria(cri));

      model.addAttribute("pageMaker", pageMaker);
      model.addAttribute("size", list.size());

      return "board/boardList.lay";

   }
   
    /**
     * 좋아요했을 때 좋아요 수 올리기
     */
   @RequestMapping(value="/boardDetail/uplike", method = RequestMethod.POST)
   public String uplike(@RequestParam("boardNo") int boardNo, @RequestParam("userNo") int userNo,
		   @RequestParam("page") int page, @RequestParam("perPageNum") int perPageNum, @RequestParam("keyword") String keyword,
		   @RequestParam("searchType") String searchType, RedirectAttributes rttr) {
	   String url = "redirect:/board/boardDetail?page="+page+"&perPageNum="+perPageNum
	    		  +"&searchType="+searchType+"&keyword="+keyword+"&boardNo="+boardNo+"&userNo="+userNo;
	   rttr.addFlashAttribute("message", "successuplike");
      service.createlike(boardNo, userNo);
      service.uplikeCount(boardNo);
	  
      return url; 
   }
   
   /**
    * 싫어요했을 때 싫어요 수 올리기
    */
  @RequestMapping(value="/boardDetail/uphate", method = RequestMethod.POST)
  public String uphate(@RequestParam("boardNo") int boardNo, @RequestParam("userNo") int userNo,
		   @RequestParam("page") int page, @RequestParam("perPageNum") int perPageNum, @RequestParam("keyword") String keyword,
		   @RequestParam("searchType") String searchType, RedirectAttributes rttr) {
	   String url = "redirect:/board/boardDetail?page="+page+"&perPageNum="+perPageNum
	    		  +"&searchType="+searchType+"&keyword="+keyword+"&boardNo="+boardNo+"&userNo="+userNo;
	   rttr.addFlashAttribute("message", "successuphate");
     service.createhate(boardNo, userNo);
     service.uphateCount(boardNo);
	  
     return url; 
  }
    
   
   /**
    * (모바일 웹)게시판 리스트 구현 페이징 기능 검색 기능
    **/
   @RequestMapping(value = "/boardListM", method = RequestMethod.GET)
   public String listPageMV(@ModelAttribute("cri") Criteria cri, Model model, UserDTO user,HttpServletRequest req) throws Exception {
	   if (user != null && user.getUserNo() > 0 && user.getStatus() >= 0) {
		      req.getSession().setAttribute("login", user);
		   } else {
		      user = (UserDTO) req.getSession().getAttribute("login");
		   }
	   List<BoardDTO> list;
	      
	      if(cri.getSearchType()!=null) {
	      if(cri.getSearchType().equals("t")) {
	         list = service.listSearch_t(cri);
	      }
	      else if(cri.getSearchType().equals("c")) list = service.listSearch_c(cri);
	      else if(cri.getSearchType().equals("tc"))list = service.listSearch_tc(cri);
	      else {
	         list = service.listCriteria(cri);
	      }
	      }else list = service.listCriteria(cri);

	      
	      BoardDTO tmp = new BoardDTO();
	      for (BoardDTO board : list) {
	         tmp.setBoardNo(board.getBoardNo());
	         //댓글수
	         int replyCount = service.countReply(tmp);
	         board.setReplyCount(replyCount);
	         //좋아요 갯수
	         int likeCount=service.countLike(tmp);
	         board.setLikeCount(likeCount);
	         //싫어요 갯수
	         int hateCount=service.counthate(tmp);
	         board.setHateCount(hateCount);
	      }

	      model.addAttribute("boardList", list);
	      
	      PageMaker pageMaker = new PageMaker();
	      pageMaker.setCri(cri);
	      
	      if(cri.getSearchType()=="t") pageMaker.setTotalCount(service.listSearchCount_t(cri));
	      else if(cri.getSearchType()=="c") pageMaker.setTotalCount(service.listSearchCount_c(cri));
	      else if(cri.getSearchType()=="tc")pageMaker.setTotalCount(service.listSearchCount_tc(cri));
	      else pageMaker.setTotalCount(service.listCountCriteria(cri));

	      model.addAttribute("pageMaker", pageMaker);
	      model.addAttribute("size", list.size());
	      model.addAttribute("UserDTO",user);

      return "board/boardListM";

   }
   
   
   /** 게시글 불러오기 **/
   @RequestMapping(value = "/boardDetailM", method = RequestMethod.GET)
   public String readM(@RequestParam("boardNo") int boardNo, @RequestParam("userNo") int userNo, @ModelAttribute("cri") Criteria cri, Model model,HttpServletRequest req)
         throws Exception {
	   BoardDTO board=new BoardDTO();
	   
	   board.setBoardNo(boardNo);
	   board.setIslike(service.isLike(boardNo, userNo));
	   board.setIshate(service.ishate(boardNo, userNo));
	   UserDTO user = (UserDTO) req.getSession().getAttribute("login");
		logger.info(user.toString());
		model.addAttribute("UserDTO",user);
	   model.addAttribute(cri);
	   model.addAttribute("board",board);
	   model.addAttribute(service.read(boardNo));
      
      return "board/boardDetailM";
   }
   
   @RequestMapping(value = "/boardFormM", method = RequestMethod.GET)
   public String boardFormM(Model model,HttpServletRequest req) {
	   UserDTO user = (UserDTO) req.getSession().getAttribute("login");
		logger.info(user.toString()+"이거 폼임");
		model.addAttribute(user);
      return "board/boardFormM";
   }
   
   /** 게시글 등록 POST방식 **/
   @RequestMapping(value = "/boardFormM", method = RequestMethod.POST)
   public String registPOSTM(BoardDTO board, RedirectAttributes rttr,HttpServletRequest req) throws Exception {
	   UserDTO user = (UserDTO) req.getSession().getAttribute("login");
	   logger.info("이거등록전임"+user.toString());
	   board.setUserNo(user.getUserNo());
	   int userNo=user.getUserNo();
		int status=user.getStatus();
      service.create(board);
      rttr.addFlashAttribute("message", "createsuccess");
      rttr.addFlashAttribute("userNo",userNo);
		rttr.addFlashAttribute("status",status);
      return "redirect:/board/boardListM";
   }
   
   /**
    * 좋아요했을 때 좋아요 수 올리기
    */
  @RequestMapping(value="/boardDetail/uplikeM", method = RequestMethod.POST)
  public String uplikeM(@RequestParam("boardNo") int boardNo, @RequestParam("userNo") int userNo,
		   @RequestParam("page") int page, @RequestParam("perPageNum") int perPageNum, @RequestParam("keyword") String keyword,
		   @RequestParam("searchType") String searchType, RedirectAttributes rttr,HttpServletRequest req) {
	   String url = "redirect:/board/boardDetailM?page="+page+"&perPageNum="+perPageNum
	    		  +"&searchType="+searchType+"&keyword="+keyword+"&boardNo="+boardNo+"&userNo="+userNo;
	   rttr.addFlashAttribute("message", "successuplike");
     service.createlike(boardNo, userNo);
     service.uplikeCount(boardNo);
	  
     return url; 
  }
  
  /**
   * 싫어요했을 때 싫어요 수 올리기
   */
 @RequestMapping(value="/boardDetail/uphateM", method = RequestMethod.POST)
 public String uphateM(@RequestParam("boardNo") int boardNo, @RequestParam("userNo") int userNo,
		   @RequestParam("page") int page, @RequestParam("perPageNum") int perPageNum, @RequestParam("keyword") String keyword,
		   @RequestParam("searchType") String searchType, RedirectAttributes rttr,HttpServletRequest req) {
	   String url = "redirect:/board/boardDetailM?page="+page+"&perPageNum="+perPageNum
	    		  +"&searchType="+searchType+"&keyword="+keyword+"&boardNo="+boardNo+"&userNo="+userNo;
	   rttr.addFlashAttribute("message", "successuphate");
    service.createhate(boardNo, userNo);
    service.uphateCount(boardNo);
	  
    return url; 
 }

   

}