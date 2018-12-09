package com.webaid.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webaid.domain.ReviewVO;
import com.webaid.domain.SearchCriteria;
import com.webaid.persistence.ReviewDao;

@Service
public class ReviewServiceImpl implements ReviewService{

	@Autowired
	private ReviewDao dao;
	

	@Override
	public List<ReviewVO> selectAll() {
		return dao.selectAll();
	}

	@Override
	public ReviewVO selectOne(int bno) {
		return dao.selectOne(bno);
	}

	@Override
	public void insert(ReviewVO vo) {
		dao.insert(vo);
	}

	@Override
	public void update(ReviewVO vo) {
		dao.update(vo);
	}
	
	@Override
	public void updateCnt(int bno) {
		dao.updateCnt(bno);
	}
	
	@Override
	public void updateStateWait(int bno) {
		dao.updateStateWait(bno);
	}

	@Override
	public void delete(int bno) {
		dao.delete(bno);
	}

	@Override
	public List<ReviewVO> listSearch(SearchCriteria cri) throws Exception {
		return dao.listSearch(cri);
	}
	
	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return dao.listSearchCount(cri);
	}

}
