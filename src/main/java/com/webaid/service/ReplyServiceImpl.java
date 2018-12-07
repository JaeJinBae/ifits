package com.webaid.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webaid.domain.ReplyVO;
import com.webaid.persistence.QnaDao;
import com.webaid.persistence.ReplyDao;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyDao dao;
	
	@Autowired
	private QnaDao QnaDao;

	@Override
	public ReplyVO select(int bno) throws Exception {
		return dao.select(bno);
	}

	@Override
	public void insert(ReplyVO vo) throws Exception {
		dao.insert(vo);
		QnaDao.updateState(vo.getBno());
	}

	@Override
	public void update(ReplyVO vo) throws Exception {
		dao.update(vo);
	}

	@Override
	public void delete(int rno) throws Exception {
		dao.delete(rno);
	}
	
}
