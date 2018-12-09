package com.webaid.persistence;

import com.webaid.domain.PReplyVO;

public interface PReplyDao {
	public PReplyVO select(int bno) throws Exception;
	public void insert(PReplyVO vo) throws Exception;
	public void update(PReplyVO vo) throws Exception;
	public void delete(int rno) throws Exception;
	
}
