package com.webaid.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webaid.domain.QReplyVO;
import com.webaid.persistence.QnaDao;
import com.webaid.persistence.QReplyDao;

@Service
public class QReplyServiceImpl implements QReplyService {

	@Autowired
	private QReplyDao dao;
	
	@Autowired
	private QnaDao QnaDao;

	@Override
	public QReplyVO select(int bno) throws Exception {
		return dao.select(bno);
	}

	@Override
	public void insert(QReplyVO vo) throws Exception {
		dao.insert(vo);
		QnaDao.updateState(vo.getBno());
	}

	@Override
	public void update(QReplyVO vo) throws Exception {
		dao.update(vo);
	}

	@Override
	public void delete(int rno) throws Exception {
		dao.delete(rno);
	}
	
}
