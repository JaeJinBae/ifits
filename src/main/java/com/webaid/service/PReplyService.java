package com.webaid.service;

import com.webaid.domain.PReplyVO;

public interface PReplyService {
	public PReplyVO select(int bno) throws Exception;
	public void insert(PReplyVO vo) throws Exception;
	public void update(PReplyVO vo) throws Exception;
	public void delete(int rno) throws Exception;
}
