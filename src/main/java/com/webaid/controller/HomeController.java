package com.webaid.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.webaid.domain.FaqVO;
import com.webaid.domain.InformationVO;
import com.webaid.domain.NoticeVO;
import com.webaid.domain.PageMaker;
import com.webaid.domain.QnaVO;
import com.webaid.domain.ReplyVO;
import com.webaid.domain.SearchCriteria;
import com.webaid.service.FaqService;
import com.webaid.service.InformationService;
import com.webaid.service.NoticeService;
import com.webaid.service.QnaService;
import com.webaid.service.ReplyService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private NoticeService nService;
	
	@Autowired
	private InformationService iService;
	
	@Autowired
	private FaqService fService;
	
	@Autowired
	private QnaService qService;
	
	@Autowired
	private ReplyService rService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		logger.info("main GET");
			
		return "0main/index";
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
			
			ReplyVO rvo=rService.select(bno);
			
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
		ReplyVO rvo=rService.select(bno);
		
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
	public String review() {
		logger.info("community_review GET");
		
		
		return "5community/review";
	}
	
	@RequestMapping(value = "/partnership", method = RequestMethod.GET)
	public String partnership() {
		logger.info("community_partnership GET");
		
		
		return "5community/partnership";
	}
	
}
