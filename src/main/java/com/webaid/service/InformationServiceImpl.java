package com.webaid.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webaid.domain.InformationVO;
import com.webaid.domain.SearchCriteria;
import com.webaid.persistence.InformationDao;

@Service
public class InformationServiceImpl implements InformationService {

	@Autowired
	private InformationDao dao;
	
	@Override
	public List<InformationVO> selectAll() {
		return dao.selectAll();
	}

	@Override
	public InformationVO selectOne(int bno) {
		return dao.selectOne(bno);
	}

	@Override
	public void insert(InformationVO vo) {
		dao.insert(vo);
	}

	@Override
	public void update(InformationVO vo) {
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
	public List<InformationVO> listSearch(SearchCriteria cri) throws Exception {
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return dao.listSearchCount(cri);
	}

	

}
