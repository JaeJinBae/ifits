package com.webaid.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.webaid.domain.FaqVO;
import com.webaid.domain.InformationVO;
import com.webaid.domain.MemberVO;
import com.webaid.domain.NoticeVO;
import com.webaid.domain.PReplyVO;
import com.webaid.domain.PageMaker;
import com.webaid.domain.PartnershipVO;
import com.webaid.domain.QReplyVO;
import com.webaid.domain.QnaVO;
import com.webaid.domain.RReplyVO;
import com.webaid.domain.ReviewVO;
import com.webaid.domain.SearchCriteria;
import com.webaid.service.FaqService;
import com.webaid.service.InformationService;
import com.webaid.service.MemberService;
import com.webaid.service.NoticeService;
import com.webaid.service.PReplyService;
import com.webaid.service.PartnershipService;
import com.webaid.service.QReplyService;
import com.webaid.service.QnaService;
import com.webaid.service.RReplyService;
import com.webaid.service.ReviewService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Autowired
	private MemberService mService;
	
	@Autowired
	private NoticeService nService;
	
	@Autowired
	private InformationService iService;
	
	@Autowired
	private FaqService fService;
	
	@Autowired
	private QnaService qService;
	
	@Autowired
	private QReplyService qReplyService;
	
	@Autowired
	private ReviewService rService;
	
	@Autowired
	private RReplyService rReplyService;
	
	@Autowired
	private PartnershipService pService;
	
	@Autowired
	private PReplyService pReplyService;
	

	@RequestMapping(value = "/adminLogin", method = RequestMethod.GET)
	public String adminLogin() throws Exception {
		logger.info("adminLogin GET");

		return "admin/adminLogin";
	}

	@RequestMapping(value = "/loginCheck/{id}/{pw}")
	public ResponseEntity<String> loginCheck(@PathVariable("id") String id, @PathVariable("pw") String pw,
			HttpServletRequest req) throws Exception {
		logger.info("admin Login Check");
		ResponseEntity<String> entity = null;

		HttpSession session = req.getSession();

		if (id.equals("admin") && pw.equals("ifits2744")) {
			entity = new ResponseEntity<String>("ok", HttpStatus.OK);
			session.setAttribute("id", id);
			System.out.println("session 아이디" + session.getAttribute("id"));
		} else {
			entity = new ResponseEntity<String>("no", HttpStatus.OK);
		}

		return entity;
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		
		if (session.getAttribute("id") == null) {
			logger.info("아이디는 null 입니다.");
			return "admin/adminLogin";
		}
		
		session.invalidate();

		return "redirect:/";
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String adminHome(@ModelAttribute("cri") SearchCriteria cri, Model model, HttpServletRequest req)
			throws Exception {
		logger.info("adminHome/adminNotice GET");
		HttpSession session = req.getSession(false);
		if (session.getAttribute("id") == null) {
			logger.info("아이디는 null 입니다.");
			return "admin/adminLogin";
		}

		List<InformationVO> list = iService.listSearch(cri);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.makeSearch(cri.getPage());
		pageMaker.setTotalCount(iService.listSearchCount(cri));

		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pageMaker);

		return "admin/adminInformation";
	}

	@RequestMapping(value = "/adminInformation")
	public String information(@ModelAttribute("cri") SearchCriteria cri, Model model, HttpServletRequest req)
			throws Exception {
		logger.info("admin information get");

		HttpSession session = req.getSession(false);

		if (session.getAttribute("id") == null) {
			logger.info("아이디는 null 입니다.");
			return "admin/adminLogin";
		}

		List<InformationVO> list = iService.listSearch(cri);

		cri.setKeyword(null);
		cri.setSearchType("n");
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.makeSearch(cri.getPage());
		pageMaker.setTotalCount(iService.listSearchCount(cri));

		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pageMaker);

		return "admin/adminInformation";
	}

	@RequestMapping(value = "/adminInformationRead", method = RequestMethod.GET)
	public String readInformation(int bno, @ModelAttribute("cri") SearchCriteria cri, Model model,
			HttpServletRequest req) throws Exception {
		logger.info("admin Information Read Get");

		HttpSession session = req.getSession(false);

		if (session.getAttribute("id") == null) {
			logger.info("아이디는 null 입니다.");
			return "admin/adminLogin";
		}

		InformationVO vo = iService.selectOne(bno);
		iService.updateCnt(bno);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.makeSearch(cri.getPage());
		pageMaker.setTotalCount(iService.listSearchCount(cri));

		model.addAttribute("item", vo);
		model.addAttribute("pageMaker", pageMaker);
		return "admin/adminInformationRead";
	}

	@RequestMapping(value = "/adminInformationRegister", method = RequestMethod.GET)
	public String adminInformationRegisterGet(HttpServletRequest req) {
		logger.info("admin Information Register Get");

		HttpSession session = req.getSession(false);

		if (session.getAttribute("id") == null) {
			logger.info("아이디는 null 입니다.");
			return "admin/adminLogin";
		}

		return "admin/adminInformationRegister";
	}

	@RequestMapping(value = "/adminInformationRegister", method = RequestMethod.POST)
	public String adminInformationRegisterPost(InformationVO vo, HttpServletRequest req) {
		logger.info("admin Information Register post");

		HttpSession session = req.getSession(false);

		if (session.getAttribute("id") == null) {
			logger.info("아이디는 null 입니다.");
			return "admin/adminLogin";
		}

		iService.insert(vo);

		return "redirect:/admin/adminInformation";
	}

	@RequestMapping(value = "/adminInformationUpdate", method = RequestMethod.GET)
	public String adminInformationUpdateGet(int bno, @ModelAttribute("cri") SearchCriteria cri, Model model,
			HttpServletRequest req) throws Exception {
		logger.info("adminInformationUpdate get");

		HttpSession session = req.getSession(false);

		if (session.getAttribute("id") == null) {
			logger.info("아이디는 null 입니다.");
			return "admin/adminLogin";
		}

		InformationVO vo = iService.selectOne(bno);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.makeSearch(cri.getPage());
		pageMaker.setTotalCount(iService.listSearchCount(cri));

		model.addAttribute("item", vo);
		model.addAttribute("pageMaker", pageMaker);

		return "admin/adminInformationUpdate";
	}

	@RequestMapping(value = "/adminInformationUpdate", method = RequestMethod.POST)
	public String adminInformationModifyPost(InformationVO vo, int page, @ModelAttribute("cri") SearchCriteria cri,
			RedirectAttributes rtts, Model model, HttpServletRequest req) throws Exception {
		logger.info("admin Information Update post");

		logger.info("page: " + page);

		HttpSession session = req.getSession(false);

		if (session.getAttribute("id") == null) {
			logger.info("아이디는 null 입니다.");
			return "admin/adminLogin";
		}

		iService.update(vo);

		rtts.addAttribute("bno", vo.getBno());

		PageMaker pageMaker = new PageMaker();

		pageMaker.setCri(cri);
		pageMaker.makeSearch(page);

		pageMaker.setTotalCount(iService.listSearchCount(cri));

		rtts.addAttribute("page", page);

		return "redirect:/admin/adminInformationRead";
	}

	@RequestMapping(value = "/adminInformationDelete", method = RequestMethod.GET)
	public String adminInformationDelete(int bno, SearchCriteria cri, RedirectAttributes rtts, HttpServletRequest req)
			throws Exception {
		logger.info("admin Information Delete");

		HttpSession session = req.getSession(false);

		if (session.getAttribute("id") == null) {
			logger.info("아이디는 null 입니다.");
			return "admin/adminLogin";
		}

		iService.delete(bno);// 게시글, 파일 삭제
		rtts.addAttribute("perPageNum", cri.getPerPageNum());
		rtts.addAttribute("page", cri.getPage());

		return "redirect:/admin/adminInformation";
	}
	
	@RequestMapping(value = "/adminNotice")
	public String adminNotice(@ModelAttribute("cri") SearchCriteria cri, Model model, HttpServletRequest req)
			throws Exception {
		logger.info("adminNotice GET");

		HttpSession session = req.getSession(false);

		if (session.getAttribute("id") == null) {
			logger.info("아이디는 null 입니다.");
			return "admin/adminLogin";
		}

		List<NoticeVO> list = nService.listSearch(cri);
		
		cri.setKeyword(null);
		cri.setSearchType("n");
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.makeSearch(cri.getPage());
		pageMaker.setTotalCount(nService.listSearchCount(cri));

		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pageMaker);

		return "admin/adminNotice";
	}

	@RequestMapping(value = "/adminNoticeRead", method = RequestMethod.GET)
	public String adminNoticeRead(int bno, @ModelAttribute("cri") SearchCriteria cri, Model model,
			HttpServletRequest req) throws Exception {
		logger.info("adminNoticeRead Get");

		HttpSession session = req.getSession(false);

		if (session.getAttribute("id") == null) {
			logger.info("아이디는 null 입니다.");
			return "admin/adminLogin";
		}

		NoticeVO vo = nService.selectOne(bno);
		nService.updateCnt(bno);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.makeSearch(cri.getPage());
		pageMaker.setTotalCount(nService.listSearchCount(cri));

		model.addAttribute("item", vo);
		model.addAttribute("pageMaker", pageMaker);
		return "admin/adminNoticeRead";
	}

	@RequestMapping(value = "/adminNoticeRegister", method = RequestMethod.GET)
	public String adminNoticeRegisterGet(HttpServletRequest req) {
		logger.info("adminNoticeRegister Get");

		HttpSession session = req.getSession(false);

		if (session.getAttribute("id") == null) {
			logger.info("아이디는 null 입니다.");
			return "admin/adminLogin";
		}

		return "admin/adminNoticeRegister";
	}

	@RequestMapping(value = "/adminNoticeRegister", method = RequestMethod.POST)
	public String adminNoticeRegisterPost(NoticeVO vo, HttpServletRequest req) {
		logger.info("adminNoticeRegister post");

		HttpSession session = req.getSession(false);

		if (session.getAttribute("id") == null) {
			logger.info("아이디는 null 입니다.");
			return "admin/adminLogin";
		}

		nService.insert(vo);

		return "redirect:/admin/adminNotice";
	}

	@RequestMapping(value = "/adminNoticeUpdate", method = RequestMethod.GET)
	public String adminNoticeUpdateGet(int bno, @ModelAttribute("cri") SearchCriteria cri, Model model,
			HttpServletRequest req) throws Exception {
		logger.info("adminNoticeUpdate get");

		HttpSession session = req.getSession(false);

		if (session.getAttribute("id") == null) {
			logger.info("아이디는 null 입니다.");
			return "admin/adminLogin";
		}

		NoticeVO vo = nService.selectOne(bno);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.makeSearch(cri.getPage());
		pageMaker.setTotalCount(nService.listSearchCount(cri));

		model.addAttribute("item", vo);
		model.addAttribute("pageMaker", pageMaker);

		return "admin/adminNoticeUpdate";
	}

	@RequestMapping(value = "/adminNoticeUpdate", method = RequestMethod.POST)
	public String modifyPost(NoticeVO vo, int page, @ModelAttribute("cri") SearchCriteria cri, RedirectAttributes rtts,
			Model model, HttpServletRequest req) throws Exception {
		logger.info("adminNoticeUpdate post");

		HttpSession session = req.getSession(false);

		if (session.getAttribute("id") == null) {
			logger.info("아이디는 null 입니다.");
			return "admin/adminLogin";
		}

		nService.update(vo);

		rtts.addAttribute("bno", vo.getBno());

		PageMaker pageMaker = new PageMaker();

		pageMaker.setCri(cri);
		pageMaker.makeSearch(page);

		pageMaker.setTotalCount(nService.listSearchCount(cri));

		rtts.addAttribute("page", page);

		return "redirect:/admin/adminNoticeRead";
	}

	@RequestMapping(value = "/adminNoticeDelete", method = RequestMethod.GET)
	public String adminNoticeDelete(int bno, SearchCriteria cri, RedirectAttributes rtts, HttpServletRequest req)
			throws Exception {
		logger.info("delete");

		HttpSession session = req.getSession(false);

		if (session.getAttribute("id") == null) {
			logger.info("아이디는 null 입니다.");
			return "admin/adminLogin";
		}

		nService.delete(bno);// 게시글, 파일 삭제
		rtts.addAttribute("perPageNum", cri.getPerPageNum());
		rtts.addAttribute("page", cri.getPage());

		return "redirect:/admin/adminNotice";
	}
	

	@RequestMapping(value = "/adminFaq")
	public String Faq(@ModelAttribute("cri") SearchCriteria cri, Model model, HttpServletRequest req)
			throws Exception {
		logger.info("admin Faq get");

		HttpSession session = req.getSession(false);

		if (session.getAttribute("id") == null) {
			logger.info("아이디는 null 입니다.");
			return "admin/adminLogin";
		}

		List<FaqVO> list = fService.listSearch(cri);

		cri.setKeyword(null);
		cri.setSearchType("n");
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.makeSearch(cri.getPage());
		pageMaker.setTotalCount(fService.listSearchCount(cri));

		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pageMaker);

		return "admin/adminFaq";
	}

	@RequestMapping(value = "/adminFaqRead", method = RequestMethod.GET)
	public String readFaq(int bno, @ModelAttribute("cri") SearchCriteria cri, Model model,
			HttpServletRequest req) throws Exception {
		logger.info("admin Faq Read Get");

		HttpSession session = req.getSession(false);

		if (session.getAttribute("id") == null) {
			logger.info("아이디는 null 입니다.");
			return "admin/adminLogin";
		}

		FaqVO vo = fService.selectOne(bno);
		fService.updateCnt(bno);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.makeSearch(cri.getPage());
		pageMaker.setTotalCount(fService.listSearchCount(cri));

		model.addAttribute("item", vo);
		model.addAttribute("pageMaker", pageMaker);
		return "admin/adminFaqRead";
	}

	@RequestMapping(value = "/adminFaqRegister", method = RequestMethod.GET)
	public String adminFaqRegisterGet(HttpServletRequest req) {
		logger.info("admin Faq Register Get");

		HttpSession session = req.getSession(false);

		if (session.getAttribute("id") == null) {
			logger.info("아이디는 null 입니다.");
			return "admin/adminLogin";
		}

		return "admin/adminFaqRegister";
	}

	@RequestMapping(value = "/adminFaqRegister", method = RequestMethod.POST)
	public String adminFaqRegisterPost(FaqVO vo, HttpServletRequest req) {
		logger.info("admin Faq Register post");

		HttpSession session = req.getSession(false);

		if (session.getAttribute("id") == null) {
			logger.info("아이디는 null 입니다.");
			return "admin/adminLogin";
		}

		fService.insert(vo);

		return "redirect:/admin/adminFaq";
	}

	@RequestMapping(value = "/adminFaqUpdate", method = RequestMethod.GET)
	public String adminFaqUpdateGet(int bno, @ModelAttribute("cri") SearchCriteria cri, Model model,
			HttpServletRequest req) throws Exception {
		logger.info("admin Faq Update get");

		HttpSession session = req.getSession(false);

		if (session.getAttribute("id") == null) {
			logger.info("아이디는 null 입니다.");
			return "admin/adminLogin";
		}

		FaqVO vo = fService.selectOne(bno);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.makeSearch(cri.getPage());
		pageMaker.setTotalCount(fService.listSearchCount(cri));

		model.addAttribute("item", vo);
		model.addAttribute("pageMaker", pageMaker);

		return "admin/adminFaqUpdate";
	}

	@RequestMapping(value = "/adminFaqUpdate", method = RequestMethod.POST)
	public String adminFaqModifyPost(FaqVO vo, int page, @ModelAttribute("cri") SearchCriteria cri,
			RedirectAttributes rtts, Model model, HttpServletRequest req) throws Exception {
		logger.info("admin Faq Update post");

		logger.info("page: " + page);

		HttpSession session = req.getSession(false);

		if (session.getAttribute("id") == null) {
			logger.info("아이디는 null 입니다.");
			return "admin/adminLogin";
		}

		fService.update(vo);

		rtts.addAttribute("bno", vo.getBno());

		PageMaker pageMaker = new PageMaker();

		pageMaker.setCri(cri);
		pageMaker.makeSearch(page);

		pageMaker.setTotalCount(fService.listSearchCount(cri));

		rtts.addAttribute("page", page);

		return "redirect:/admin/adminFaqRead";
	}

	@RequestMapping(value = "/adminFaqDelete", method = RequestMethod.GET)
	public String adminFaqDelete(int bno, SearchCriteria cri, RedirectAttributes rtts, HttpServletRequest req)
			throws Exception {
		logger.info("admin Faq Delete");

		HttpSession session = req.getSession(false);

		if (session.getAttribute("id") == null) {
			logger.info("아이디는 null 입니다.");
			return "admin/adminLogin";
		}

		fService.delete(bno);// 게시글, 파일 삭제
		rtts.addAttribute("perPageNum", cri.getPerPageNum());
		rtts.addAttribute("page", cri.getPage());

		return "redirect:/admin/adminFaq";
	}
	
	@RequestMapping(value = "/adminQna", method = RequestMethod.GET)
	public String qna(@ModelAttribute("cri") SearchCriteria cri, Model model, HttpServletRequest req)
			throws Exception {
		logger.info("Qna get");

		HttpSession session = req.getSession(false);

		if (session.getAttribute("id") == null) {
			logger.info("아이디는 null 입니다.");
			return "admin/adminLogin";
		}

		List<QnaVO> list = qService.listSearch(cri);

		cri.setKeyword(null);
		cri.setSearchType("n");
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.makeSearch(cri.getPage());
		pageMaker.setTotalCount(qService.listSearchCount(cri));

		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pageMaker);

		return "admin/adminQna";
	}

	@RequestMapping(value = "/adminQnaRead", method = RequestMethod.GET)
	public String adminQnaRead(int bno, @ModelAttribute("cri") SearchCriteria cri, Model model,
			HttpServletRequest req) throws Exception {
		logger.info("admin Qna Read Get");

		HttpSession session = req.getSession(false);

		if (session.getAttribute("id") == null) {
			logger.info("아이디는 null 입니다.");
			return "admin/adminLogin";
		}
		
		qService.updateCnt(bno);
		
		QnaVO vo = qService.selectOne(bno);
		QReplyVO rvo = qReplyService.select(bno);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.makeSearch(cri.getPage());
		pageMaker.setTotalCount(qService.listSearchCount(cri));

		model.addAttribute("item", vo);
		model.addAttribute("reply", rvo);
		model.addAttribute("pageMaker", pageMaker);
		return "admin/adminQnaRead";
	}

	@RequestMapping(value = "/adminQnaAddReply", method = RequestMethod.POST)
	public String adminQnaAddReply(QReplyVO vo, HttpServletRequest req) throws Exception {
		logger.info("admin Qna AddReply POSt");

		HttpSession session = req.getSession(false);

		if (session.getAttribute("id") == null) {
			logger.info("아이디는 null 입니다.");
			return "admin/adminLogin";
		}

		qReplyService.insert(vo);

		return "redirect:/admin/adminQna";
	}

	@RequestMapping(value = "/adminQnaUpdate", method = RequestMethod.GET)
	public String adminQnaUpdateGet(int bno, @ModelAttribute("cri") SearchCriteria cri, Model model,
			HttpServletRequest req) throws Exception {
		logger.info("admin Qna Update Get");

		HttpSession session = req.getSession(false);

		if (session.getAttribute("id") == null) {
			logger.info("아이디는 null 입니다.");
			return "admin/adminLogin";
		}

		QnaVO vo = qService.selectOne(bno);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.makeSearch(cri.getPage());
		pageMaker.setTotalCount(qService.listSearchCount(cri));

		model.addAttribute("item", vo);
		model.addAttribute("pageMaker", pageMaker);

		return "admin/adminQnaUpdate";
	}

	@RequestMapping(value = "/adminQnaUpdate", method = RequestMethod.POST)
	public String adminQnaUpdatePost(QnaVO vo, @ModelAttribute("cri") SearchCriteria cri, Model model,
			HttpServletRequest req) throws Exception {
		logger.info("admin Qna Post");

		HttpSession session = req.getSession(false);

		if (session.getAttribute("id") == null) {
			logger.info("아이디는 null 입니다.");
			return "admin/adminLogin";
		}

		qService.update(vo);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);

		return "redirect:/admin/adminQnaRead" + pageMaker.makeSearch(cri.getPage()) + "&bno=" + vo.getBno();
	}

	@RequestMapping(value = "/adminQnaDelete")
	public String adminQnaDelete(int bno, @ModelAttribute("cri") SearchCriteria cri, Model model,
			HttpServletRequest req) throws Exception {
		logger.info("admin Qna Delete");

		HttpSession session = req.getSession(false);

		if (session.getAttribute("id") == null) {
			logger.info("아이디는 null 입니다.");
			return "admin/adminLogin";
		}

		qService.delete(bno);
		qReplyService.delete(bno);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);

		return "redirect:/admin/adminQna" + pageMaker.makeSearch(cri.getPage());
	}

	@RequestMapping(value = "/adminQnaReplyUpdate", method = RequestMethod.GET)
	public String adminQnaReplyUpdateGet(int bno, @ModelAttribute("cri") SearchCriteria cri, Model model,
			HttpServletRequest req) throws Exception {
		logger.info("admin Qna ReplyUpdate Get");

		HttpSession session = req.getSession(false);

		if (session.getAttribute("id") == null) {
			logger.info("아이디는 null 입니다.");
			return "admin/adminLogin";
		}

		QReplyVO rvo = qReplyService.select(bno);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.makeSearch(cri.getPage());
		pageMaker.setTotalCount(qService.listSearchCount(cri));

		model.addAttribute("reply", rvo);
		model.addAttribute("pageMaker", pageMaker);

		return "admin/adminQnaReplyUpdate";
	}

	@RequestMapping(value = "/adminQnaReplyUpdate", method = RequestMethod.POST)
	public String adminQnaReplyUpdatePost(QReplyVO vo, @ModelAttribute("cri") SearchCriteria cri, Model model,
			HttpServletRequest req) throws Exception {
		logger.info("admin Qna Reply Update Post");

		HttpSession session = req.getSession(false);

		if (session.getAttribute("id") == null) {
			logger.info("아이디는 null 입니다.");
			return "admin/adminLogin";
		}

		qReplyService.update(vo);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);

		return "redirect:/admin/adminQnaRead" + pageMaker.makeSearch(cri.getPage()) + "&bno=" + vo.getBno();
	}

	@RequestMapping(value = "/adminQnaReplyDelete")
	public String adminQnaReplyDelete(int bno, @ModelAttribute("cri") SearchCriteria cri, Model model,
			HttpServletRequest req) throws Exception {
		logger.info("admin Qna Reply Delete");

		HttpSession session = req.getSession(false);

		if (session.getAttribute("id") == null) {
			logger.info("아이디는 null 입니다.");
			return "admin/adminLogin";
		}

		qReplyService.delete(bno);
		qService.updateStateWait(bno);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);

		return "redirect:/admin/adminQnaRead" + pageMaker.makeSearch(cri.getPage()) + "&bno=" + bno;
	}
	
	//review
	@RequestMapping(value = "/adminReview", method = RequestMethod.GET)
	public String review(@ModelAttribute("cri") SearchCriteria cri, Model model, HttpServletRequest req)
			throws Exception {
		logger.info("Review get");

		HttpSession session = req.getSession(false);

		if (session.getAttribute("id") == null) {
			logger.info("아이디는 null 입니다.");
			return "admin/adminLogin";
		}

		List<ReviewVO> list = rService.listSearch(cri);

		cri.setKeyword(null);
		cri.setSearchType("n");
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.makeSearch(cri.getPage());
		pageMaker.setTotalCount(rService.listSearchCount(cri));

		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pageMaker);

		return "admin/adminReview";
	}

	@RequestMapping(value = "/adminReviewRead", method = RequestMethod.GET)
	public String adminReviewRead(int bno, @ModelAttribute("cri") SearchCriteria cri, Model model,
			HttpServletRequest req) throws Exception {
		logger.info("admin Review Read Get");

		HttpSession session = req.getSession(false);

		if (session.getAttribute("id") == null) {
			logger.info("아이디는 null 입니다.");
			return "admin/adminLogin";
		}
		
		rService.updateCnt(bno);
		
		ReviewVO vo = rService.selectOne(bno);
		RReplyVO rvo = rReplyService.select(bno);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.makeSearch(cri.getPage());
		pageMaker.setTotalCount(rService.listSearchCount(cri));

		model.addAttribute("item", vo);
		model.addAttribute("reply", rvo);
		model.addAttribute("pageMaker", pageMaker);
		return "admin/adminReviewRead";
	}

	@RequestMapping(value = "/adminReviewAddReply", method = RequestMethod.POST)
	public String adminReviewAddReply(RReplyVO vo, HttpServletRequest req) throws Exception {
		logger.info("admin Review AddReply POSt");

		HttpSession session = req.getSession(false);

		if (session.getAttribute("id") == null) {
			logger.info("아이디는 null 입니다.");
			return "admin/adminLogin";
		}

		rReplyService.insert(vo);

		return "redirect:/admin/adminReview";
	}

	@RequestMapping(value = "/adminReviewUpdate", method = RequestMethod.GET)
	public String adminReviewUpdateGet(int bno, @ModelAttribute("cri") SearchCriteria cri, Model model,
			HttpServletRequest req) throws Exception {
		logger.info("admin Review Update Get");

		HttpSession session = req.getSession(false);

		if (session.getAttribute("id") == null) {
			logger.info("아이디는 null 입니다.");
			return "admin/adminLogin";
		}

		ReviewVO vo = rService.selectOne(bno);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.makeSearch(cri.getPage());
		pageMaker.setTotalCount(rService.listSearchCount(cri));

		model.addAttribute("item", vo);
		model.addAttribute("pageMaker", pageMaker);

		return "admin/adminReviewUpdate";
	}

	@RequestMapping(value = "/adminReviewUpdate", method = RequestMethod.POST)
	public String adminReviewUpdatePost(ReviewVO vo, @ModelAttribute("cri") SearchCriteria cri, Model model,
			HttpServletRequest req) throws Exception {
		logger.info("admin Review Post");

		HttpSession session = req.getSession(false);

		if (session.getAttribute("id") == null) {
			logger.info("아이디는 null 입니다.");
			return "admin/adminLogin";
		}

		rService.update(vo);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);

		return "redirect:/admin/adminReviewRead" + pageMaker.makeSearch(cri.getPage()) + "&bno=" + vo.getBno();
	}

	@RequestMapping(value = "/adminReviewDelete")
	public String adminReviewDelete(int bno, @ModelAttribute("cri") SearchCriteria cri, Model model,
			HttpServletRequest req) throws Exception {
		logger.info("admin Review Delete");

		HttpSession session = req.getSession(false);

		if (session.getAttribute("id") == null) {
			logger.info("아이디는 null 입니다.");
			return "admin/adminLogin";
		}

		rService.delete(bno);
		rReplyService.delete(bno);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);

		return "redirect:/admin/adminReview" + pageMaker.makeSearch(cri.getPage());
	}

	@RequestMapping(value = "/adminReviewReplyUpdate", method = RequestMethod.GET)
	public String adminReviewReplyUpdateGet(int bno, @ModelAttribute("cri") SearchCriteria cri, Model model,
			HttpServletRequest req) throws Exception {
		logger.info("admin Review ReplyUpdate Get");

		HttpSession session = req.getSession(false);

		if (session.getAttribute("id") == null) {
			logger.info("아이디는 null 입니다.");
			return "admin/adminLogin";
		}

		RReplyVO rvo = rReplyService.select(bno);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.makeSearch(cri.getPage());
		pageMaker.setTotalCount(rService.listSearchCount(cri));

		model.addAttribute("reply", rvo);
		model.addAttribute("pageMaker", pageMaker);

		return "admin/adminReviewReplyUpdate";
	}

	@RequestMapping(value = "/adminReviewReplyUpdate", method = RequestMethod.POST)
	public String adminReviewReplyUpdatePost(RReplyVO vo, @ModelAttribute("cri") SearchCriteria cri, Model model,
			HttpServletRequest req) throws Exception {
		logger.info("admin Review Reply Update Post");

		HttpSession session = req.getSession(false);

		if (session.getAttribute("id") == null) {
			logger.info("아이디는 null 입니다.");
			return "admin/adminLogin";
		}

		rReplyService.update(vo);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);

		return "redirect:/admin/adminReviewRead" + pageMaker.makeSearch(cri.getPage()) + "&bno=" + vo.getBno();
	}

	@RequestMapping(value = "/adminReviewReplyDelete")
	public String adminReviewReplyDelete(int bno, @ModelAttribute("cri") SearchCriteria cri, Model model,
			HttpServletRequest req) throws Exception {
		logger.info("admin Review Reply Delete");

		HttpSession session = req.getSession(false);

		if (session.getAttribute("id") == null) {
			logger.info("아이디는 null 입니다.");
			return "admin/adminLogin";
		}

		rReplyService.delete(bno);
		rService.updateStateWait(bno);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);

		return "redirect:/admin/adminReviewRead" + pageMaker.makeSearch(cri.getPage()) + "&bno=" + bno;
	}
	
	//partnership
	@RequestMapping(value = "/adminPartnership", method = RequestMethod.GET)
	public String Partnership(@ModelAttribute("cri") SearchCriteria cri, Model model, HttpServletRequest req)
			throws Exception {
		logger.info("Partnership get");

		HttpSession session = req.getSession(false);

		if (session.getAttribute("id") == null) {
			logger.info("아이디는 null 입니다.");
			return "admin/adminLogin";
		}

		List<PartnershipVO> list = pService.listSearch(cri);

		cri.setKeyword(null);
		cri.setSearchType("n");
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.makeSearch(cri.getPage());
		pageMaker.setTotalCount(pService.listSearchCount(cri));

		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pageMaker);

		return "admin/adminPartnership";
	}

	@RequestMapping(value = "/adminPartnershipRead", method = RequestMethod.GET)
	public String adminPartnershipRead(int bno, @ModelAttribute("cri") SearchCriteria cri, Model model,
			HttpServletRequest req) throws Exception {
		logger.info("admin Partnership Read Get");

		HttpSession session = req.getSession(false);

		if (session.getAttribute("id") == null) {
			logger.info("아이디는 null 입니다.");
			return "admin/adminLogin";
		}
		
		pService.updateCnt(bno);
		
		PartnershipVO vo = pService.selectOne(bno);
		PReplyVO rvo = pReplyService.select(bno);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.makeSearch(cri.getPage());
		pageMaker.setTotalCount(pService.listSearchCount(cri));

		model.addAttribute("item", vo);
		model.addAttribute("reply", rvo);
		model.addAttribute("pageMaker", pageMaker);
		return "admin/adminPartnershipRead";
	}

	@RequestMapping(value = "/adminPartnershipAddReply", method = RequestMethod.POST)
	public String adminPartnershipAddReply(PReplyVO vo, HttpServletRequest req) throws Exception {
		logger.info("admin Partnership AddReply POSt");

		HttpSession session = req.getSession(false);

		if (session.getAttribute("id") == null) {
			logger.info("아이디는 null 입니다.");
			return "admin/adminLogin";
		}

		pReplyService.insert(vo);

		return "redirect:/admin/adminPartnership";
	}

	@RequestMapping(value = "/adminPartnershipUpdate", method = RequestMethod.GET)
	public String adminPartnershipUpdateGet(int bno, @ModelAttribute("cri") SearchCriteria cri, Model model,
			HttpServletRequest req) throws Exception {
		logger.info("admin Partnership Update Get");

		HttpSession session = req.getSession(false);

		if (session.getAttribute("id") == null) {
			logger.info("아이디는 null 입니다.");
			return "admin/adminLogin";
		}

		PartnershipVO vo = pService.selectOne(bno);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.makeSearch(cri.getPage());
		pageMaker.setTotalCount(pService.listSearchCount(cri));

		model.addAttribute("item", vo);
		model.addAttribute("pageMaker", pageMaker);

		return "admin/adminPartnershipUpdate";
	}

	@RequestMapping(value = "/adminPartnershipUpdate", method = RequestMethod.POST)
	public String adminPartnershipUpdatePost(PartnershipVO vo, @ModelAttribute("cri") SearchCriteria cri, Model model,
			HttpServletRequest req) throws Exception {
		logger.info("admin Partnership Post");

		HttpSession session = req.getSession(false);

		if (session.getAttribute("id") == null) {
			logger.info("아이디는 null 입니다.");
			return "admin/adminLogin";
		}

		pService.update(vo);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);

		return "redirect:/admin/adminPartnershipRead" + pageMaker.makeSearch(cri.getPage()) + "&bno=" + vo.getBno();
	}

	@RequestMapping(value = "/adminPartnershipDelete")
	public String adminPartnershipDelete(int bno, @ModelAttribute("cri") SearchCriteria cri, Model model,
			HttpServletRequest req) throws Exception {
		logger.info("admin Partnership Delete");

		HttpSession session = req.getSession(false);

		if (session.getAttribute("id") == null) {
			logger.info("아이디는 null 입니다.");
			return "admin/adminLogin";
		}

		pService.delete(bno);
		pReplyService.delete(bno);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);

		return "redirect:/admin/adminPartnership" + pageMaker.makeSearch(cri.getPage());
	}

	@RequestMapping(value = "/adminPartnershipReplyUpdate", method = RequestMethod.GET)
	public String adminPartnershipReplyUpdateGet(int bno, @ModelAttribute("cri") SearchCriteria cri, Model model,
			HttpServletRequest req) throws Exception {
		logger.info("admin Partnership ReplyUpdate Get");

		HttpSession session = req.getSession(false);

		if (session.getAttribute("id") == null) {
			logger.info("아이디는 null 입니다.");
			return "admin/adminLogin";
		}

		PReplyVO rvo = pReplyService.select(bno);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.makeSearch(cri.getPage());
		pageMaker.setTotalCount(pService.listSearchCount(cri));

		model.addAttribute("reply", rvo);
		model.addAttribute("pageMaker", pageMaker);

		return "admin/adminPartnershipReplyUpdate";
	}

	@RequestMapping(value = "/adminPartnershipReplyUpdate", method = RequestMethod.POST)
	public String adminPartnershipReplyUpdatePost(PReplyVO vo, @ModelAttribute("cri") SearchCriteria cri, Model model,
			HttpServletRequest req) throws Exception {
		logger.info("admin Partnership Reply Update Post");

		HttpSession session = req.getSession(false);

		if (session.getAttribute("id") == null) {
			logger.info("아이디는 null 입니다.");
			return "admin/adminLogin";
		}

		pReplyService.update(vo);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);

		return "redirect:/admin/adminPartnershipRead" + pageMaker.makeSearch(cri.getPage()) + "&bno=" + vo.getBno();
	}

	@RequestMapping(value = "/adminPartnershipReplyDelete")
	public String adminPartnershipReplyDelete(int bno, @ModelAttribute("cri") SearchCriteria cri, Model model,
			HttpServletRequest req) throws Exception {
		logger.info("admin Partnership Reply Delete");

		HttpSession session = req.getSession(false);

		if (session.getAttribute("id") == null) {
			logger.info("아이디는 null 입니다.");
			return "admin/adminLogin";
		}

		pReplyService.delete(bno);
		pService.updateStateWait(bno);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);

		return "redirect:/admin/adminPartnershipRead" + pageMaker.makeSearch(cri.getPage()) + "&bno=" + bno;
	}
	
	//회원관리
	@RequestMapping(value="/member", method=RequestMethod.GET)
	public String memberGet(Model model, @ModelAttribute("cri") SearchCriteria cri) throws Exception{
		logger.info("admin member controller Get");
		
		List<MemberVO> list = mService.listSearch(cri);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.makeSearch(cri.getPage());
		pageMaker.setTotalCount(mService.listSearchCount(cri));

		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pageMaker);
		
		return "admin/adminMember";
	}
	
	@RequestMapping(value="/memberUpdate", method=RequestMethod.GET)
	public String memberUpdateGet(String id, Model model, @ModelAttribute("cri") SearchCriteria cri) throws Exception{
		logger.info("admin member update Get");
		
		MemberVO vo = mService.selectOne(id);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.makeSearch(cri.getPage());
		pageMaker.setTotalCount(mService.listSearchCount(cri));
		
		model.addAttribute("vo", vo);
		model.addAttribute("pageMaker", pageMaker);
		
		return "admin/adminMemberUpdate";
	}
	
	@RequestMapping(value="/memberUpdate/{id}/{pw}/{mail:.+}", method=RequestMethod.POST)
	public ResponseEntity<String> memberUpdatePost(@PathVariable("id") String id, @PathVariable("pw") String pw, @PathVariable("mail") String mail, Model model, @ModelAttribute("cri") SearchCriteria cri) throws Exception{
		logger.info("admin member update Post");
		
		ResponseEntity<String> entity=null;
		try {
			MemberVO vo = mService.selectOne(id);
			vo.setPw(pw);
			vo.setMail(mail);
			
			mService.update(vo);
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.makeSearch(cri.getPage());
			pageMaker.setTotalCount(mService.listSearchCount(cri));
			
			
			model.addAttribute("pageMaker", pageMaker);
			entity=new ResponseEntity<String>("ok",HttpStatus.OK);
			return entity;
		} catch (Exception e) {
			entity=new ResponseEntity<String>("no",HttpStatus.OK);
			return entity;
		}
	}
	
	@RequestMapping(value="/memberDelete/{id}")
	public ResponseEntity<String> memberDelete(@PathVariable("id") String id){
		ResponseEntity<String> entity=null;
		try {
			mService.delete(id);
			entity=new ResponseEntity<String>("ok", HttpStatus.OK);
			return entity;
		} catch (Exception e) {
			entity=new ResponseEntity<String>("no", HttpStatus.OK);
			return entity;
		}
	}

	//이미지 업로드
	@ResponseBody
	@RequestMapping("/imgUpload")
	public Map<String, Object> imgaeUpload(HttpServletRequest req, @RequestParam MultipartFile upload, Model model)
			throws Exception {
		logger.info("image upload!!!!!");

		// http body
		OutputStream out = null;

		Map<String, Object> map = new HashMap<String, Object>();

		// 오리지날 파일명
		String originalName = upload.getOriginalFilename();

		// 랜덤이름 생성(중복 방지용)
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() + "_" + originalName;

		// 업로드한 파일 이름
		String fileName = savedName;

		// 바이트 배열로 변환
		byte[] bytes = upload.getBytes();

		// 이미지를 업로드할 디렉토리(배포경로로 설정)
		String innerUploadPath = "resources/upload/";
		String uploadPath = (req.getSession().getServletContext().getRealPath("/")) + innerUploadPath;
		logger.info(uploadPath);

		out = new FileOutputStream(new File(uploadPath + fileName));// 서버에 파일 저장
		// 서버에 저장됨
		out.write(bytes);

		String fileUrl = "/" + innerUploadPath + fileName;

		System.out.println(fileUrl);

		map.put("uploaded", 1);
		map.put("fileName", fileName);
		map.put("url", fileUrl);

		return map;
	}

}
