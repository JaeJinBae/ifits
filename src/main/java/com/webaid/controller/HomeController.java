package com.webaid.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
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
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		logger.info("main GET");
			
		return "0main/index";
	}
	
	//========================== member login ===============================
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginGet(Model model, HttpServletRequest req) throws UnsupportedEncodingException {
		logger.info("login Get");	
					
		return "6membership/login";
	}
	
	@RequestMapping(value="/logout",method=RequestMethod.GET)
	public String logout(HttpServletRequest req){
		HttpSession session=req.getSession(false);
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/memberLoginCheck/{id}/{pw}")
	public ResponseEntity<String> memberLoginCheck(@PathVariable("id") String id,@PathVariable("pw") String pw, HttpServletRequest req, Model model) throws Exception{
		logger.info("member Login Check");
		ResponseEntity<String> entity=null;
		
		HttpSession session=req.getSession();
		logger.info(id+", "+pw);
		
		try {
			MemberVO vo=mService.selectOne(id);
			
			String getId=vo.getId();
			String getPw=vo.getPw();
			
			if(id.equals(getId)&&pw.equals(getPw)){
				entity=new ResponseEntity<String>("ok",HttpStatus.OK);
				session.setAttribute("id", id);
				System.out.println("session 아이디"+session.getAttribute("id"));
				model.addAttribute("vo",vo);
			}else{
				entity=new ResponseEntity<String>("no",HttpStatus.OK);
			}
			
			return entity;
		} catch (Exception e) {
			entity=new ResponseEntity<String>("no",HttpStatus.OK);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/userInfo", method=RequestMethod.GET)
	public String userUpdateGet(HttpServletRequest req, Model model){
		HttpSession session=req.getSession();
		MemberVO vo = mService.selectOne(session.getAttribute("id")+"");
		model.addAttribute("vo", vo);
		return "6membership/updateInfo";
	}
	
	@RequestMapping(value="/userUpdate/{id}/{pw}/{mail:.+}")
	public ResponseEntity<String> userUpdatePost(@PathVariable("id") String id, @PathVariable("pw") String pw, @PathVariable("mail") String mail, HttpServletRequest req, Model model) throws Exception{
		logger.info("userUpdate post");
		logger.info(mail);
		ResponseEntity<String> entity=null;
		
		try {
			MemberVO vo=mService.selectOne(id);
			
			//vo.setId(id);
			if(pw.equals("no")){
				vo.setPw(vo.getPw());
			}else{
				vo.setPw(pw);
			}
			vo.setMail(mail);
			
			mService.update(vo);
			entity=new ResponseEntity<String>("ok",HttpStatus.OK);
			return entity;
		} catch (Exception e) {
			entity=new ResponseEntity<String>("no",HttpStatus.OK);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/delUser/{id}")
	public String userRemove(@PathVariable("id") String id, HttpServletRequest req){
		logger.info("remove user");
		
		mService.delete(id);
		HttpSession session=req.getSession(false);
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping(value="/userSignIn", method=RequestMethod.GET)
	public String userSignInGet(){
		logger.info("userSignIn Get");
		
		return "6membership/signIn";
	}
	
	@RequestMapping(value="/userSignIn", method=RequestMethod.POST)
	public String userSignInPost(MemberVO vo){
		logger.info("signIn Post");
		mService.insert(vo);
		
		return "6membership/login";
	}
	
	//회원가입 아이디 중복확인
	@RequestMapping(value="/idCheck/{id}", method=RequestMethod.POST)
	public ResponseEntity<String> userUpdatePost(@PathVariable("id") String id, HttpServletRequest req, Model model){
		logger.info("idCheck");
		ResponseEntity<String> entity= null;
		try {
			MemberVO vo=mService.selectOne(id);
			if(vo.getClass() == null){
				entity=new ResponseEntity<String>("ok",HttpStatus.OK);
			}else if(vo.getClass() != null){
				entity=new ResponseEntity<String>("no",HttpStatus.OK);
			}
		} catch (Exception e) {
			entity=new ResponseEntity<String>("ok",HttpStatus.OK);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/userLoginChk", method=RequestMethod.POST)
	public ResponseEntity<String> userLoginChk(HttpServletRequest req, Model model){
		logger.info("user login check");
		ResponseEntity<String> entity= null;
		HttpSession session=req.getSession();
		String loginId=(String) session.getAttribute("id");
		
		try {
		
			if(loginId==null || loginId.equals("")){
				entity=new ResponseEntity<String>("no",HttpStatus.OK);
			}else{
				entity=new ResponseEntity<String>("ok",HttpStatus.OK);
			}
		} catch (Exception e) {
			entity=new ResponseEntity<String>("no",HttpStatus.OK);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/userFindInfo", method=RequestMethod.GET)
	public String userFindInfoGet(){
		logger.info("userFindInfo Get");
		
		return "6membership/findUserInfo";
	}
	
	@RequestMapping(value="/userInfoReq/{mail:.+}", method=RequestMethod.POST)
	public ResponseEntity<String> userInfoReqPost(@PathVariable("mail") String mail, HttpServletRequest req, Model model){
		logger.info("userInfoReq Get");
		ResponseEntity<String> entity= null;
		
		try {
			MemberVO vo=mService.selectByMail(mail);
			if(vo==null || vo.equals("")){
				entity=new ResponseEntity<String>("no",HttpStatus.OK);
			}else{
				SendEmail(vo);
				entity=new ResponseEntity<String>("ok",HttpStatus.OK);
			}
		} catch (Exception e) {
			entity=new ResponseEntity<String>("no",HttpStatus.OK);
		}
		
		return entity;
	}
	
	//회원정보 메일발송
	private void SendEmail(MemberVO vo) throws UnsupportedEncodingException {
		logger.info("sendmail 진입");
		String host = "smtp.naver.com";
		final String user = "youhanhospital";
		final String password = "63xy67$$";
		int port=465;
		
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", host);

		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});

		// Compose the message
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user,"유한마취통증의학과"));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(vo.getMail()));

			// Subject
			String subject = "유한통증의학과에서 보내드리는 "+vo.getName()+"님의 가입정보입니다.";
			try {
				message.setSubject(MimeUtility.encodeText(subject, "UTF-8", "B"));
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			/*String PwMeg = "이름 : " + vo.getName() + "<br>" + "아이디 : " + vo.getId() + "<br>" + "비밀번호 : " + vo.getPw()
					+ "<br>" + "이메일 : " + vo.getMail()+"<br>"+"가입일 : "+vo.getRegdate();

			message.setText(PwMeg, "UTF-8");*/
			message.setContent("<img src='http://www.uhan-hospital.com/resources/images/mailBanner.png'><br>이름 : " + vo.getName() + "<br>" 
					+ "아이디 : " + vo.getId() + "<br>" + "비밀번호 : " + vo.getPw()
					+ "<br>" + "이메일 : " + vo.getMail()+"<br>"+"가입일 : "+vo.getRegdate(), "text/html; charset=utf-8");
			message.setHeader("content-Type", "text/html");

			// send the message
			Transport.send(message);
			System.out.println("전송성공");

		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
		
			
	@RequestMapping(value = "/ourbrand", method = RequestMethod.GET)
	public String brand() {
		logger.info("our brand GET");
		
		
		return "1brand/brand";
	}
	
	@RequestMapping(value = "/product", method = RequestMethod.GET)
	public String product() {
		logger.info("product GET");
		
		
		return "2product/product";
	}
	
	@RequestMapping(value = "/technique", method = RequestMethod.GET)
	public String technique() {
		logger.info("technique GET");
		
		
		return "3technique/technique";
	}
	
	@RequestMapping(value = "/information", method = RequestMethod.GET)
	public String information(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		logger.info("information GET");
		
		List<InformationVO> list = iService.listSearch(cri);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.makeSearch(cri.getPage());
		pageMaker.setTotalCount(iService.listSearchCount(cri));

		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pageMaker);
		
		return "4information/information";
	}
	
	@RequestMapping(value = "/informationRead", method = RequestMethod.GET)
	public String informationRead(int bno, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		logger.info("informationRead GET");
		
		iService.updateCnt(bno);
		InformationVO vo=iService.selectOne(bno);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.makeSearch(cri.getPage());
		pageMaker.setTotalCount(iService.listSearchCount(cri));
		
		model.addAttribute("item", vo);
		model.addAttribute("pageMaker", pageMaker);
		
		return "4information/informationRead";
	}
	
	@RequestMapping(value = "/notice", method = RequestMethod.GET)
	public String notice(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		logger.info("community_notice GET");
		
		List<NoticeVO> list = nService.listSearch(cri);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.makeSearch(cri.getPage());
		pageMaker.setTotalCount(nService.listSearchCount(cri));

		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pageMaker);
		
		return "5community/notice";
	}
	
	@RequestMapping(value = "/noticeRead", method = RequestMethod.GET)
	public String noticeRead(int bno, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		logger.info("noticeRead GET");
		
		nService.updateCnt(bno);
		NoticeVO vo=nService.selectOne(bno);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.makeSearch(cri.getPage());
		pageMaker.setTotalCount(nService.listSearchCount(cri));
		
		model.addAttribute("item", vo);
		model.addAttribute("pageMaker", pageMaker);
		
		return "5community/noticeRead";
	}
	
	@RequestMapping(value = "/faq", method = RequestMethod.GET)
	public String faq(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		logger.info("community_faq GET");
		
		List<FaqVO> list = fService.listSearch(cri);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.makeSearch(cri.getPage());
		pageMaker.setTotalCount(fService.listSearchCount(cri));

		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pageMaker);
		
		return "5community/faq";
	}
	
	@RequestMapping(value = "/faqRead", method = RequestMethod.GET)
	public String faqRead(int bno, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		logger.info("faqRead GET");
		
		fService.updateCnt(bno);
		FaqVO vo=fService.selectOne(bno);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.makeSearch(cri.getPage());
		pageMaker.setTotalCount(fService.listSearchCount(cri));
		
		model.addAttribute("item", vo);
		model.addAttribute("pageMaker", pageMaker);
		
		return "5community/faqRead";
	}
	
	@RequestMapping(value = "/qna", method = RequestMethod.GET)
	public String qna(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		logger.info("community_qna GET");
		
		List<QnaVO> list = qService.listSearch(cri);
		logger.info(cri.getKeyword());
		
		cri.setKeyword(null);
		cri.setSearchType("n");
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.makeSearch(cri.getPage());
		pageMaker.setTotalCount(qService.listSearchCount(cri));
		 
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pageMaker);
		
		return "5community/qna";
	}
	
	@RequestMapping(value = "/qnaRegister", method = RequestMethod.GET)
	public String qnaRegisterGet(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		logger.info("qnaRegister Get");
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.makeSearch(cri.getPage());
		pageMaker.setTotalCount(qService.listSearchCount(cri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "5community/qnaRegister";
	}
	
	@RequestMapping(value = "/qnaRegister", method = RequestMethod.POST)
	public String qnaRegisterPost(QnaVO vo) {
		logger.info("qnaRegister post");
		
		logger.info(vo.toString());
		
		qService.insert(vo);
		
		return "redirect:/qna";
	}
	
	@RequestMapping(value = "/qnaPwType", method = RequestMethod.GET)
	public String qnaPWcheck(int bno, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		logger.info("qnaPWcheck Get");
		
		QnaVO vo=qService.selectOne(bno);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.makeSearch(cri.getPage());
		pageMaker.setTotalCount(qService.listSearchCount(cri));
		
		model.addAttribute("item", vo);
		model.addAttribute("pageMaker", pageMaker);
		
		String pwtype=vo.getPwtype();
		
		if(pwtype.equals("x")){
			logger.info("go Read");
			
			qService.updateCnt(bno);
			
			QReplyVO rvo=qReplyService.select(bno);
			
			model.addAttribute("reply", rvo);
			
			return "5community/qnaRead";
		}
		
		return "5community/qnaPwCheck";
	}
	
	@RequestMapping(value = "/qnaPWcheck2", method = RequestMethod.POST)
	public ResponseEntity<String> qnaPWCheckPost(@RequestBody QnaVO voo) {
		logger.info("qnaPWcheck post");
		
		ResponseEntity<String> entity=null;
		try{
			QnaVO vo=qService.selectOne(voo.getBno());
			String realPW=vo.getPw();
			
			if(realPW.equals(voo.getPw())){
				logger.info("패스워드 맞음");
				entity=new ResponseEntity<String>("ok",HttpStatus.OK);
				return entity;
			}else{
				logger.info("패스워드 틀림");
				entity=new ResponseEntity<String>("no",HttpStatus.OK);
				return entity;
			}
		}catch (Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<String>("no",HttpStatus.BAD_REQUEST);
			
		}
		
		return entity;
	}
	
	@RequestMapping(value="/qnaRead")
	public String qnaRead(int bno, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		logger.info("adviceRead GET");
		
		qService.updateCnt(bno);
		
		QnaVO vo=qService.selectOne(bno);
		QReplyVO rvo=qReplyService.select(bno);
		
		cri.setKeyword(null);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.makeSearch(cri.getPage());
		pageMaker.setTotalCount(qService.listSearchCount(cri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		
		model.addAttribute("item",vo);
		model.addAttribute("reply", rvo);
		
		return "5community/qnaRead";
	}
	
	@RequestMapping(value="/qnaUpdate", method=RequestMethod.GET)
	public String qnaUpdateGet(int bno, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		logger.info("qnaUpdate");
		
		QnaVO vo=qService.selectOne(bno);
		
		PageMaker pageMaker = new PageMaker();
		
		pageMaker.setCri(cri);
		pageMaker.makeSearch(cri.getPage());
		pageMaker.setTotalCount(qService.listSearchCount(cri));
		
		
		model.addAttribute("item",vo);
		model.addAttribute("pageMaker", pageMaker);
		
		return "5community/qnaUpdate";
	}
	
	@RequestMapping(value="/qnaUpdate", method=RequestMethod.POST)
	public String qnaUpdatePost(QnaVO vo, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		logger.info("qnaUpdate Post");
		
		qService.update(vo);
		
		PageMaker pageMaker = new PageMaker();
		
		pageMaker.setCri(cri);
		
		return "redirect:/qnaRead"+pageMaker.makeSearch(cri.getPage())+"&bno="+vo.getBno();
	}
	
	@RequestMapping(value="/qnaDelete")
	public String qnaDelete(int bno, @ModelAttribute("cri") SearchCriteria cri) throws Exception{
		logger.info("qnaDelete");
		qService.delete(bno);
		
		PageMaker pageMaker = new PageMaker();
		
		pageMaker.setCri(cri);
		
		return "redirect:/qna"+pageMaker.makeSearch(cri.getPage());
	}
	
	@RequestMapping(value = "/review", method = RequestMethod.GET)
	public String review(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		logger.info("community_review GET");
		
		List<ReviewVO> list = rService.listSearch(cri);
		logger.info(cri.getKeyword());
		
		cri.setKeyword(null);
		cri.setSearchType("n");
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.makeSearch(cri.getPage());
		pageMaker.setTotalCount(rService.listSearchCount(cri));
		 
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pageMaker);
		
		return "5community/review";
	}
	
	@RequestMapping(value = "/reviewRegister", method = RequestMethod.GET)
	public String reviewRegisterGet(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		logger.info("review Register Get");
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.makeSearch(cri.getPage());
		pageMaker.setTotalCount(rService.listSearchCount(cri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "5community/reviewRegister";
	}
	
	@RequestMapping(value = "/reviewRegister", method = RequestMethod.POST)
	public String reviewRegisterPost(ReviewVO vo) {
		logger.info("review Register post");
		
		logger.info(vo.toString());
		
		rService.insert(vo);
		
		return "redirect:/review";
	}
	
	@RequestMapping(value = "/reviewPwType", method = RequestMethod.GET)
	public String reviewPWcheck(int bno, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		logger.info("review PWcheck Get");
		
		ReviewVO vo=rService.selectOne(bno);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.makeSearch(cri.getPage());
		pageMaker.setTotalCount(rService.listSearchCount(cri));
		
		model.addAttribute("item", vo);
		model.addAttribute("pageMaker", pageMaker);
		
		String pwtype=vo.getPwtype();
		
		if(pwtype.equals("x")){
			logger.info("go Read");
			
			rService.updateCnt(bno);
			
			RReplyVO rvo=rReplyService.select(bno);
			
			model.addAttribute("reply", rvo);
			
			return "5community/reviewRead";
		}
		
		return "5community/reviewPwCheck";
	}
	
	@RequestMapping(value = "/reviewPWcheck2", method = RequestMethod.POST)
	public ResponseEntity<String> reviewPWCheckPost(@RequestBody QnaVO voo) {
		logger.info("review PWcheck post");
		
		ResponseEntity<String> entity=null;
		try{
			ReviewVO vo=rService.selectOne(voo.getBno());
			String realPW=vo.getPw();
			
			if(realPW.equals(voo.getPw())){
				logger.info("패스워드 맞음");
				entity=new ResponseEntity<String>("ok",HttpStatus.OK);
				return entity;
			}else{
				logger.info("패스워드 틀림");
				entity=new ResponseEntity<String>("no",HttpStatus.OK);
				return entity;
			}
		}catch (Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<String>("no",HttpStatus.BAD_REQUEST);
			
		}
		
		return entity;
	}
	
	@RequestMapping(value="/reviewRead")
	public String reviewRead(int bno, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		logger.info("review Read GET");
		
		rService.updateCnt(bno);
		
		ReviewVO vo=rService.selectOne(bno);
		RReplyVO rvo=rReplyService.select(bno);
		
		cri.setKeyword(null);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.makeSearch(cri.getPage());
		pageMaker.setTotalCount(rService.listSearchCount(cri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		
		model.addAttribute("item",vo);
		model.addAttribute("reply", rvo);
		
		return "5community/reviewRead";
	}
	
	@RequestMapping(value="/reviewUpdate", method=RequestMethod.GET)
	public String reviewUpdateGet(int bno, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		logger.info("review Update");
		
		ReviewVO vo=rService.selectOne(bno);
		
		PageMaker pageMaker = new PageMaker();
		
		pageMaker.setCri(cri);
		pageMaker.makeSearch(cri.getPage());
		pageMaker.setTotalCount(rService.listSearchCount(cri));
		
		
		model.addAttribute("item",vo);
		model.addAttribute("pageMaker", pageMaker);
		
		return "5community/reviewUpdate";
	}
	
	@RequestMapping(value="/reviewUpdate", method=RequestMethod.POST)
	public String reviewUpdatePost(ReviewVO vo, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		logger.info("review Update Post");
		
		rService.update(vo);
		
		PageMaker pageMaker = new PageMaker();
		
		pageMaker.setCri(cri);
		
		return "redirect:/reviewRead"+pageMaker.makeSearch(cri.getPage())+"&bno="+vo.getBno();
	}
	
	@RequestMapping(value="/reviewDelete")
	public String reviewDelete(int bno, @ModelAttribute("cri") SearchCriteria cri) throws Exception{
		logger.info("review Delete");
		rService.delete(bno);
		
		PageMaker pageMaker = new PageMaker();
		
		pageMaker.setCri(cri);
		
		return "redirect:/review"+pageMaker.makeSearch(cri.getPage());
	}
	
	
	@RequestMapping(value = "/partnership", method = RequestMethod.GET)
	public String partnership(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		logger.info("community_partnership GET");
		
		List<PartnershipVO> list = pService.listSearch(cri);
		logger.info(cri.getKeyword());
		
		cri.setKeyword(null);
		cri.setSearchType("n");
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.makeSearch(cri.getPage());
		pageMaker.setTotalCount(pService.listSearchCount(cri));
		 
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pageMaker);
		
		return "5community/partnership";
	}
	
	@RequestMapping(value = "/partnershipRegister", method = RequestMethod.GET)
	public String partnershipRegisterGet(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		logger.info("partnership Register Get");
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.makeSearch(cri.getPage());
		pageMaker.setTotalCount(pService.listSearchCount(cri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "5community/partnershipRegister";
	}
	
	@RequestMapping(value = "/partnershipRegister", method = RequestMethod.POST)
	public String partnershipRegisterPost(PartnershipVO vo) {
		logger.info("partnership Register post");
		
		logger.info(vo.toString());
		
		pService.insert(vo);
		
		return "redirect:/partnership";
	}
	
	@RequestMapping(value = "/partnershipPwType", method = RequestMethod.GET)
	public String partnershipPWcheck(int bno, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		logger.info("qnaPWcheck Get");
		
		PartnershipVO vo=pService.selectOne(bno);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.makeSearch(cri.getPage());
		pageMaker.setTotalCount(pService.listSearchCount(cri));
		
		model.addAttribute("item", vo);
		model.addAttribute("pageMaker", pageMaker);
		
		String pwtype=vo.getPwtype();
		
		if(pwtype.equals("x")){
			logger.info("go Read");
			
			pService.updateCnt(bno);
			
			PReplyVO rvo=pReplyService.select(bno);
			
			model.addAttribute("reply", rvo);
			
			return "5community/partnershipRead";
		}
		
		return "5community/partnershipPwCheck";
	}
	
	@RequestMapping(value = "/partnershipPWcheck2", method = RequestMethod.POST)
	public ResponseEntity<String> partnershipPWCheckPost(@RequestBody QnaVO voo) {
		logger.info("partnership PWcheck post");
		
		ResponseEntity<String> entity=null;
		try{
			PartnershipVO vo=pService.selectOne(voo.getBno());
			String realPW=vo.getPw();
			
			if(realPW.equals(voo.getPw())){
				logger.info("패스워드 맞음");
				entity=new ResponseEntity<String>("ok",HttpStatus.OK);
				return entity;
			}else{
				logger.info("패스워드 틀림");
				entity=new ResponseEntity<String>("no",HttpStatus.OK);
				return entity;
			}
		}catch (Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<String>("no",HttpStatus.BAD_REQUEST);
			
		}
		
		return entity;
	}
	
	@RequestMapping(value="/partnershipRead")
	public String partnershipRead(int bno, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		logger.info("partnership Read GET");
		
		pService.updateCnt(bno);
		
		PartnershipVO vo=pService.selectOne(bno);
		PReplyVO rvo=pReplyService.select(bno);
		
		cri.setKeyword(null);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.makeSearch(cri.getPage());
		pageMaker.setTotalCount(pService.listSearchCount(cri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		
		model.addAttribute("item",vo);
		model.addAttribute("reply", rvo);
		
		return "5community/partnershipRead";
	}
	
	@RequestMapping(value="/partnershipUpdate", method=RequestMethod.GET)
	public String partnershipUpdateGet(int bno, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		logger.info("partnership Update");
		
		PartnershipVO vo=pService.selectOne(bno);
		
		PageMaker pageMaker = new PageMaker();
		
		pageMaker.setCri(cri);
		pageMaker.makeSearch(cri.getPage());
		pageMaker.setTotalCount(pService.listSearchCount(cri));
		
		
		model.addAttribute("item",vo);
		model.addAttribute("pageMaker", pageMaker);
		
		return "5community/partnershipUpdate";
	}
	
	@RequestMapping(value="/partnershipUpdate", method=RequestMethod.POST)
	public String partnershipUpdatePost(PartnershipVO vo, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		logger.info("partnership Update Post");
		
		pService.update(vo);
		
		PageMaker pageMaker = new PageMaker();
		
		pageMaker.setCri(cri);
		
		return "redirect:/partnershipRead"+pageMaker.makeSearch(cri.getPage())+"&bno="+vo.getBno();
	}
	
	@RequestMapping(value="/partnershipDelete")
	public String partnershipDelete(int bno, @ModelAttribute("cri") SearchCriteria cri) throws Exception{
		logger.info("partnershipDelete");
		pService.delete(bno);
		
		PageMaker pageMaker = new PageMaker();
		
		pageMaker.setCri(cri);
		
		return "redirect:/partnership"+pageMaker.makeSearch(cri.getPage());
	}
	
}
