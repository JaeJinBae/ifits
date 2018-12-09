package com.webaid.persistence;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.webaid.domain.PartnershipVO;
import com.webaid.domain.SearchCriteria;

@Repository
public class PartnershipDaoImpl implements PartnershipDao {

	private static final String namespace="com.webaid.mappers.PartnershipMapper";
	
	@Autowired
	private SqlSession session;

	@Override
	public List<PartnershipVO> selectAll() {
		return session.selectList(namespace+".selectAll");
	}
	
	@Override
	public PartnershipVO selectOne(int bno) {
		return session.selectOne(namespace+".selectOne",bno);
	}

	@Override
	public void insert(PartnershipVO vo) {
		session.insert(namespace+".insert",vo);
	}

	@Override
	public void update(PartnershipVO vo) {
		session.update(namespace+".update",vo);
	}

	@Override
	public void updateState(int bno) {
		session.update(namespace+".updateState", bno);	
	}
	
	@Override
	public void updateCnt(int bno) {
		session.update(namespace+".updateCnt",bno);
		
	}
	
	@Override
	public void updateStateWait(int bno) {
		session.update(namespace+".updateStateWait",bno);
	}
	
	@Override
	public void delete(int bno) {
		session.delete(namespace+".delete",bno);
	}

	@Override
	public List<PartnershipVO> listSearch(SearchCriteria cri) throws Exception {
		return session.selectList(namespace+".listSearch",cri);
	}
	
	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return session.selectOne(namespace+".listSearchCount",cri);
	}

	@Override
	public void updateReplyCnt(int bno, int amount) throws Exception {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("bno", bno);
		map.put("amount", amount);
		
		session.update(namespace+".updateReplyCnt",map);
	}

}
