package com.webaid.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webaid.domain.PartnershipVO;
import com.webaid.domain.SearchCriteria;
import com.webaid.persistence.PartnershipDao;

@Service
public class PartnershipServiceImpl implements PartnershipService{

	@Autowired
	private PartnershipDao dao;
	

	@Override
	public List<PartnershipVO> selectAll() {
		return dao.selectAll();
	}

	@Override
	public PartnershipVO selectOne(int bno) {
		return dao.selectOne(bno);
	}

	@Override
	public void insert(PartnershipVO vo) {
		dao.insert(vo);
	}

	@Override
	public void update(PartnershipVO vo) {
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
	public List<PartnershipVO> listSearch(SearchCriteria cri) throws Exception {
		return dao.listSearch(cri);
	}
	
	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return dao.listSearchCount(cri);
	}

}
