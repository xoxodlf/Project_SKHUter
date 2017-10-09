package com.classs.skhuter.notice.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.classs.skhuter.notice.domain.AccountingDTO;
import com.classs.skhuter.notice.service.AccountingService;
import com.classs.skhuter.user.domain.UserDTO;
import com.classs.skhuter.util.Criteria;
import com.classs.skhuter.util.MediaUtils;
import com.classs.skhuter.util.PageMaker;
import com.classs.skhuter.util.UploadFileUtils;

@Controller
public class AccountingController {
	private static final Logger logger = LoggerFactory.getLogger(AccountingController.class);

	@Inject
	private AccountingService accountingService;
	
	Criteria cri = new Criteria();

	@Resource(name = "uploadPath")
	private String uploadPath;

	@RequestMapping(value = "/notice/accountingList", method = RequestMethod.GET)
	public String accountingList(@ModelAttribute("cri") Criteria cri,Model model) throws Exception {
		logger.info("여기는 회계내역 페이지!!!");

		List<AccountingDTO> accountingList = accountingService.listAll();
		List<AccountingDTO> accountingPagedList = accountingService.listCriteria(cri);
		
		String[] listFileName = new String[accountingList.size()];
		
		int count = accountingList.size();
		int i = 0;
		int Money = 0;
		
		for (int listsize = accountingList.size(); i < listsize; i++) {
			int length = accountingList.get(i).getUuidName().length();
			
			String front = accountingList.get(i).getUuidName().substring(0, 9);
			String end = accountingList.get(i).getUuidName().substring(11, length);
			String realName = front + end;
			
			listFileName[i] = realName;
		}
		
		i = 0;
		
		for (int listsize = accountingList.size(); i < listsize; i++) {
			if (accountingList.get(i).getStatus() == 0) {
				Money += accountingList.get(i).getPrice();
			} else {
				Money -= accountingList.get(i).getPrice();
			}
		}
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(accountingService.ListCountCriteria(cri));
		


		model.addAttribute("pageMaker", pageMaker);
		
		model.addAttribute("listFileName", listFileName);
		model.addAttribute("money", Money);
		model.addAttribute("size", count);
		model.addAttribute("list", accountingList);
		model.addAttribute("listpaged",accountingPagedList);

		return "notice/accountingList.lay";
	}


	/**
	 * 회계내역 등록
	 * 
	 * @param userNo
	 *            로그인한 사용자 번호
	 * @param content
	 *            학생회비 사용 내역
	 * @param status
	 *            지출or수입을 체크하는 변수
	 * @param price
	 *            사용자가 입력한 값
	 * @param file
	 *            영수증 사진
	 * @return
	 */
	@RequestMapping(value = "/notice/accountingList/accountingRegist", method = RequestMethod.POST)
	public String accountingRegist(@RequestParam("file") MultipartFile file, RedirectAttributes rttr,
			AccountingDTO accounting) {
		logger.info("이름:  "+file.getName());
		accounting.setFileName(file.getOriginalFilename());

		System.out.println("satus: " + accounting.getStatus());

		accountingService.register(accounting);

		rttr.addFlashAttribute("msg", "success");

		return "redirect:/notice/accountingList";
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
	@RequestMapping(value = "/notice/accountingList/upload", method = RequestMethod.POST)
	public void upload(AccountingDTO accounting, Model model, MultipartFile file, RedirectAttributes rttr)
			throws Exception {

		logger.info("userNo: " + accounting.getUserNo());
		logger.info("content: " + accounting.getContent());
		logger.info("originalName: " + file.getOriginalFilename());
		logger.info("size: " + file.getSize());
		logger.info("contentType: " + file.getContentType());

		String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());

		model.addAttribute("savedName", savedName);
	}

	@RequestMapping(value = "/notice/accountingList/uploadForm", method = RequestMethod.POST)
	public String uploadForm(MultipartFile file, Model model) throws Exception {

		logger.info("original: " + file.getOriginalFilename());
		logger.info("size: " + file.getSize());
		logger.info("contentType: " + file.getContentType());

		String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());

		model.addAttribute("savedName", savedName);

		return "redirect:/notice/accountingList";
	}

	private String uploadFile(String originalName, byte[] fileData) throws Exception {
		UUID uid = UUID.randomUUID();

		String savedName = uid.toString() + "_" + originalName;

		File target = new File(uploadPath, savedName);

		FileCopyUtils.copy(fileData, target);

		return savedName;
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
	@RequestMapping("/notice/accountingList/displayFile")
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
				// headers.setContentType(mType);
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
	@RequestMapping(value = "/notice/accountingList/uploadAjax", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception {
		logger.info("originalName: " + file.getOriginalFilename());
		return new ResponseEntity<>(UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()),
				HttpStatus.CREATED);
	}

	/**
	 * 업로드 파일 삭제 처리
	 * 
	 */
	@ResponseBody
	@RequestMapping(value = "/notice/accountingList/deleteFile", method = RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName) {
		logger.info("delete file: " + fileName);

		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);

		MediaType mType = MediaUtils.getMediaType(formatName);

		if (mType != null) {
			String front = fileName.substring(0, 9);
			String end = fileName.substring(11);
			new File(uploadPath + (front + end).replace('/', File.separatorChar)).delete();
		}

		new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();

		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}

	/**
	 * 
	 * 자료 내역 삭제
	 * 
	 * @param meetingNoteNo
	 *            삭제할 자료 내역 번호
	 * @param rttr
	 * @return
	 */
	@RequestMapping(value = "/notice/accountingList/remove", method = RequestMethod.POST)
	public String remove(@RequestParam(value = "check", required = true) List<String> checks, RedirectAttributes rttr) {

		for (String accountingNo : checks) {
			accountingService.remove(Integer.parseInt(accountingNo));
		}

		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/notice/accountingList";
	}
	
	
	/** 모바일 전용 컨트롤러 */
	
	   
	/**
	 * 모바일용 회계 내역 목록 조회
	 *
	 * @Method Name : getmeetingNoteMobile
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/notice/accountingListMobile", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getaccountingListMobile () {
		Map<String, Object> accountingMap = new HashMap<String, Object>();
		
		int i = 0;
		int money = 0;

		List<AccountingDTO> accountingList = accountingService.listAll();

		for (int listsize = accountingList.size(); i < listsize; i++) {
			if (accountingList.get(i).getStatus() == 0) {
				money += accountingList.get(i).getPrice();
			} else {
				money -= accountingList.get(i).getPrice();
			}
		}

		accountingMap.put("money", money);
		accountingMap.put("list", accountingList);
		
		return accountingMap;
	}
}
