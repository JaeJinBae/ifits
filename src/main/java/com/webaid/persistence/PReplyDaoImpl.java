package com.webaid.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.webaid.domain.PReplyVO;

@Repository
public class PReplyDaoImpl implements PReplyDao {

	private static final String namespace="com.webaid.mappers.PReplyMapper";
	
	@Autowired
	private SqlSession session;

	@Override
	public PReplyVO select(int bno) throws Exception {
		return session.selectOne(namespace+".select",bno);
	}

	@Override
	public void insert(PReplyVO vo) throws Exception {
		session.insert(namespace+".insert", vo);
	}

	@Override
	public void update(PReplyVO vo) throws Exception {
		session.update(namespace+".update", vo);
	}

	@Override
	public void delete(int rno) throws Exception {
		session.delete(namespace+".delete", rno);
	}
	
	
}
