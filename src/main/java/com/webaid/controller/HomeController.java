package com.webaid.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.webaid.domain.NoticeVO;
import com.webaid.domain.PageMaker;
import com.webaid.domain.SearchCriteria;
import com.webaid.service.NoticeService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private NoticeService nService;
	
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
	public String information() {
		logger.info("information GET");
		
		
		return "4information/information";
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
	public String faq() {
		logger.info("community_faq GET");
		
		
		return "5community/faq";
	}
	
	@RequestMapping(value = "/qna", method = RequestMethod.GET)
	public String qna() {
		logger.info("community_qna GET");
		
		
		return "5community/qna";
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
