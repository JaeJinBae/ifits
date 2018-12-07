package com.webaid.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webaid.domain.QnaVO;
import com.webaid.domain.SearchCriteria;
import com.webaid.persistence.QnaDao;

@Service
public class QnaServiceImpl implements QnaService{

	@Autowired
	private QnaDao dao;
	

	@Override
	public List<QnaVO> selectAll() {
		return dao.selectAll();
	}

	@Override
	public QnaVO selectOne(int bno) {
		return dao.selectOne(bno);
	}

	@Override
	public void insert(QnaVO vo) {
		dao.insert(vo);
	}

	@Override
	public void update(QnaVO vo) {
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
	public List<QnaVO> listSearch(SearchCriteria cri) throws Exception {
		return dao.listSearch(cri);
	}
	
	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return dao.listSearchCount(cri);
	}

}
