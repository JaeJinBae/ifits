package com.webaid.persistence;

import com.webaid.domain.QReplyVO;

public interface QReplyDao {
	public QReplyVO select(int bno) throws Exception;
	public void insert(QReplyVO vo) throws Exception;
	public void update(QReplyVO vo) throws Exception;
	public void delete(int rno) throws Exception;
	
}
