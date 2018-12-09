package com.webaid.service;

import com.webaid.domain.QReplyVO;

public interface QReplyService {
	public QReplyVO select(int bno) throws Exception;
	public void insert(QReplyVO vo) throws Exception;
	public void update(QReplyVO vo) throws Exception;
	public void delete(int rno) throws Exception;
}
