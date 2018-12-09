package com.webaid.persistence;

import com.webaid.domain.RReplyVO;

public interface RReplyDao {
	public RReplyVO select(int bno) throws Exception;
	public void insert(RReplyVO vo) throws Exception;
	public void update(RReplyVO vo) throws Exception;
	public void delete(int rno) throws Exception;
	
}
