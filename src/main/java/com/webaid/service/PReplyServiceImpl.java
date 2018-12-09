package com.webaid.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webaid.domain.PReplyVO;
import com.webaid.persistence.PReplyDao;
import com.webaid.persistence.PartnershipDao;

@Service
public class PReplyServiceImpl implements PReplyService {

	@Autowired
	private PReplyDao dao;
	
	@Autowired
	private PartnershipDao PartnershipDao;

	@Override
	public PReplyVO select(int bno) throws Exception {
		return dao.select(bno);
	}

	@Override
	public void insert(PReplyVO vo) throws Exception {
		dao.insert(vo);
		PartnershipDao.updateState(vo.getBno());
	}

	@Override
	public void update(PReplyVO vo) throws Exception {
		dao.update(vo);
	}

	@Override
	public void delete(int rno) throws Exception {
		dao.delete(rno);
	}
	
}
