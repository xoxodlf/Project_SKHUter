package com.classs.skhuter.council.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.classs.skhuter.council.domain.MeetingNoteDTO;
import com.classs.skhuter.council.service.MeetingNoteService;
import com.classs.skhuter.user.domain.UserDTO;
import com.classs.skhuter.user.service.UserService;
import com.classs.skhuter.util.MediaUtils;
import com.classs.skhuter.util.UploadFileUtils;

@Controller
public class MeetingNoteController {
	private static final Logger logger = LoggerFactory.getLogger(MeetingNoteController.class);

	@Inject
	private MeetingNoteService noteService;

	
	@Inject
	private UserService userService;

	@Resource(name = "uploadPath")
	private String uploadPath;

	/** 페이지 조회 기능 */
	@RequestMapping("/council/meetingNote")
	public String meetingNote(Model model) {
		logger.info("여기는 학생회 회의록!!!");

		List<MeetingNoteDTO> NoteList = noteService.listAll();
		List<UserDTO> name = new ArrayList<UserDTO>();

		for (MeetingNoteDTO meetingNote : NoteList) {
			name.add(userService.get(meetingNote.getUserNo()));
		}

		model.addAttribute("list", NoteList);
		model.addAttribute("name", name);

		return "council/meetingNote.lay";
	}

	/**
	 * 
	 * 데이터베이스에 게시글 등록
	 * 
	 * @param file
	 * @param uuidName
	 * @param libraryList
	 * @param rttr
	 * @return
	 */
	@RequestMapping(value = "/council/meetingNote/registMeetingNote", method = RequestMethod.POST)
	public String meetingNoteRegist(int userNo, @RequestParam("file") MultipartFile file, String uuidName,
			MeetingNoteDTO meetingNote, RedirectAttributes rttr) {

		meetingNote.setOriginName(file.getOriginalFilename());
		meetingNote.setFileName(file.getOriginalFilename());
		meetingNote.setUuidName(uuidName);
		meetingNote.setUserNo(userNo);

		noteService.register(meetingNote); // 매퍼를 통해 등록 메소드 호출

		rttr.addFlashAttribute("msg", "success");

		return "redirect:/council/meetingNote";
	}

	/**
	 * 
	 * 파일 업로드 처리
	 * 
	 * @param file
	 *            POST 방식으로 들어온 파일 데이터
	 * @param model
	 *            스프링 MVC에서 제공하는 데이터 전달용 객체
	 * @throws Exception
	 */
	@RequestMapping(value = "/council/meetingNote/upload", method = RequestMethod.POST)
	public void upload(MeetingNoteDTO meetingNote, Model model, MultipartFile file, RedirectAttributes rttr)
			throws Exception {

		logger.info("userNo: " + meetingNote.getUserNo());
		logger.info("title: " + meetingNote.getTitle());
		logger.info("originalName: " + file.getOriginalFilename());
		logger.info("size: " + file.getSize());
		logger.info("contentType: " + file.getContentType());

		String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());

		model.addAttribute("savedName", savedName);
	}

	@RequestMapping(value = "/council/meetingNote/uploadForm", method = RequestMethod.POST)
	public String uploadForm(MultipartFile file, Model model) throws Exception {

		logger.info("original: " + file.getOriginalFilename());
		logger.info("size: " + file.getSize());
		logger.info("contentType: " + file.getContentType());

		String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());

		model.addAttribute("savedName", savedName);

		return "redirect:/council/meetingNote";
	}

	private String uploadFile(String originalName, byte[] fileData) throws Exception {
		UUID uid = UUID.randomUUID();

		String savedName = uid.toString() + "_" + originalName;

		File target = new File(uploadPath, savedName);

		FileCopyUtils.copy(fileData, target);

		return savedName;
	}

	/** 회의록 게시글 등록하기 */
	@RequestMapping(value = "/council/meetingNote/registList", method = RequestMethod.POST)
	public String register(int userNo, @RequestParam("file") MultipartFile file, String uuidName,
			MeetingNoteDTO meetingNote, RedirectAttributes rttr) {
		meetingNote.setOriginName(file.getOriginalFilename());
		meetingNote.setUuidName(uuidName);
		meetingNote.setUserNo(userNo);

		noteService.register(meetingNote);

		rttr.addFlashAttribute("msg", "success");

		return "redirect:/council/meetingNote";
	}

	/**
	 * 
	 * 특정 URI를 호출했을 때 업로드 된 파일이 제대로 보이게 처리
	 * 
	 * @param fileName
	 *            브라우저에서 전송받기를 원하는 파일 이름
	 * @return
	 * @throws Exception
	 */

	@ResponseBody
	@RequestMapping("/council/meetingNote/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;

		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1); // 파일 확장자 이름

			MediaType mType = MediaUtils.getMediaType(formatName); // 파일 이름에서 확장자 추출하고, 이미지 타입일 경우 적절한 MIME 타입 지정

			HttpHeaders headers = new HttpHeaders();

			in = new FileInputStream(uploadPath + fileName);

			if (mType != null) {
				int length = fileName.length();
				String front = fileName.substring(0, 9);
				String end = fileName.substring(11, length);
				String realImage = front + end;

				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM); // 이미지가 아닌 경우 MIME 타입을 다운로드용으로 지정
				headers.add("Content-Disposition", "attachment; filename=\"" + realImage + "\"");
//				headers.setContentType(mType);
			} else {
				fileName = fileName.substring(fileName.indexOf("_") + 1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM); // 이미지가 아닌 경우 MIME 타입을 다운로드용으로 지정
				headers.add("Content-Disposition",
						"attachment; filename=\"" + new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");
			}

			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);

		} catch (FileNotFoundException e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			in.close();
		}

		return entity;
	}

	/**
	 * 
	 * 실제 파일 업로드
	 * 
	 * @param originalName
	 *            원본 파일 이름
	 * @param fileData
	 *            파일 데이터를 byte[]로 변환한 정보
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/council/meetingNote/uploadAjax", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception {
		logger.info("originalName: "+file.getOriginalFilename());
		return new ResponseEntity<>(UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()),
				HttpStatus.CREATED);
	}
	
	/**
	 * 업로드 파일 삭제 처리
	 * 
	 */
	@ResponseBody
	@RequestMapping(value = "/council/meetingNote/deleteFile", method = RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName){
		logger.info("delete file: "+fileName);
		
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		
		MediaType mType = MediaUtils.getMediaType(formatName);
		
		if(mType != null) {
			String front = fileName.substring(0, 9);
			String end = fileName.substring(11);
			new File(uploadPath+(front+end).replace('/', File.separatorChar)).delete();
		}
		
		new File(uploadPath+fileName.replace('/', File.separatorChar)).delete();
		
		return new ResponseEntity<String>("deleted",HttpStatus.OK);
	}
	   /**
	    * 
	    * 자료 내역 삭제
	    * 
	    * @param meetingNoteNo 삭제할 자료 내역 번호
	    * @param rttr
	    * @return
	    */
	   @RequestMapping(value = "/council/meetingNote/remove", method = RequestMethod.POST)
	   public String remove(@RequestParam int meetingNoteNo, RedirectAttributes rttr) {
	      
	      noteService.remove(meetingNoteNo);
	      
	      rttr.addFlashAttribute("msg", "SUCCESS");
	      
	      return "redirect:/council/meetingNote";
	   }
	   
	   
		/** 모바일 전용 컨트롤러 */
		
	   
	   	/**
	   	 * 모바일용 회의록 목록 조회
	   	 *
	   	 * @Method Name : getmeetingNoteMobile
	   	 * @return
	   	 */
		@RequestMapping(value = "/council/meetingNoteMobile", method = RequestMethod.GET)
		@ResponseBody
		public Map<String, Object> getmeetingNoteMobile () {
			Map<String, Object> noteMap = new HashMap<String, Object>();
			
			List<MeetingNoteDTO> NoteList = noteService.listAll();
			List<UserDTO> name = new ArrayList<UserDTO>();

			for (MeetingNoteDTO meetingNote : NoteList) {
				name.add(userService.get(meetingNote.getUserNo()));
			}

			noteMap.put("list", NoteList);
			noteMap.put("name", name);
			
			return noteMap;
		}
}
