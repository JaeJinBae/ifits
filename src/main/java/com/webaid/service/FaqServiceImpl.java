package com.webaid.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webaid.domain.FaqVO;
import com.webaid.domain.SearchCriteria;
import com.webaid.persistence.FaqDao;

@Service
public class FaqServiceImpl implements FaqService {

	@Autowired
	private FaqDao dao;
	
	@Override
	public List<FaqVO> selectAll() {
		return dao.selectAll();
	}

	@Override
	public FaqVO selectOne(int bno) {
		return dao.selectOne(bno);
	}

	@Override
	public void insert(FaqVO vo) {
		dao.insert(vo);
	}

	@Override
	public void update(FaqVO vo) {
		dao.update(vo);
	}
	
	@Override
	public void updateCnt(int bno) {
		dao.updateCnt(bno);
	}

	@Override
	public void delete(int bno) {
		dao.delete(bno);
	}

	@Override
	public List<FaqVO> listSearch(SearchCriteria cri) throws Exception {
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return dao.listSearchCount(cri);
	}

	

}
