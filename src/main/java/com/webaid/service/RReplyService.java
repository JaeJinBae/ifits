package com.webaid.service;

import com.webaid.domain.RReplyVO;

public interface RReplyService {
	public RReplyVO select(int bno) throws Exception;
	public void insert(RReplyVO vo) throws Exception;
	public void update(RReplyVO vo) throws Exception;
	public void delete(int rno) throws Exception;
}
