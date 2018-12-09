package com.webaid.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webaid.domain.RReplyVO;
import com.webaid.persistence.QnaDao;
import com.webaid.persistence.RReplyDao;
import com.webaid.persistence.ReviewDao;

@Service
public class RReplyServiceImpl implements RReplyService {

	@Autowired
	private RReplyDao dao;
	
	@Autowired
	private ReviewDao reviewDao;

	@Override
	public RReplyVO select(int bno) throws Exception {
		return dao.select(bno);
	}

	@Override
	public void insert(RReplyVO vo) throws Exception {
		dao.insert(vo);
		reviewDao.updateState(vo.getBno());
	}

	@Override
	public void update(RReplyVO vo) throws Exception {
		dao.update(vo);
	}

	@Override
	public void delete(int rno) throws Exception {
		dao.delete(rno);
	}
	
}
