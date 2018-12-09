package com.webaid.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.webaid.domain.QReplyVO;

@Repository
public class QReplyDaoImpl implements QReplyDao {

	private static final String namespace="com.webaid.mappers.QReplyMapper";
	
	@Autowired
	private SqlSession session;

	@Override
	public QReplyVO select(int bno) throws Exception {
		return session.selectOne(namespace+".select",bno);
	}

	@Override
	public void insert(QReplyVO vo) throws Exception {
		session.insert(namespace+".insert", vo);
	}

	@Override
	public void update(QReplyVO vo) throws Exception {
		session.update(namespace+".update", vo);
	}

	@Override
	public void delete(int rno) throws Exception {
		session.delete(namespace+".delete", rno);
	}
	
	
}
