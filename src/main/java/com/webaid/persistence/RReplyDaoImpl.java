package com.webaid.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.webaid.domain.RReplyVO;

@Repository
public class RReplyDaoImpl implements RReplyDao {

	private static final String namespace="com.webaid.mappers.RReplyMapper";
	
	@Autowired
	private SqlSession session;

	@Override
	public RReplyVO select(int bno) throws Exception {
		return session.selectOne(namespace+".select",bno);
	}

	@Override
	public void insert(RReplyVO vo) throws Exception {
		session.insert(namespace+".insert", vo);
	}

	@Override
	public void update(RReplyVO vo) throws Exception {
		session.update(namespace+".update", vo);
	}

	@Override
	public void delete(int rno) throws Exception {
		session.delete(namespace+".delete", rno);
	}
	
	
}
