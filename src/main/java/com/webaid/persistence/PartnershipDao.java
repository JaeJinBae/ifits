package com.webaid.persistence;

import java.util.List;

import com.webaid.domain.PartnershipVO;
import com.webaid.domain.SearchCriteria;

public interface PartnershipDao {
	public List<PartnershipVO> selectAll();
	public PartnershipVO selectOne(int bno);
	public void insert(PartnershipVO vo);
	public void update(PartnershipVO vo);
	public void updateState(int bno);
	public void updateCnt(int bno);
	public void updateStateWait(int bno);
	public void delete(int bno);
	public List<PartnershipVO> listSearch(SearchCriteria cri) throws Exception;
	public int listSearchCount(SearchCriteria cri) throws Exception;
	public void updateReplyCnt(int bno, int amount) throws Exception;
}
