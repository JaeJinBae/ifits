package com.webaid.persistence;

import java.util.List;

import com.webaid.domain.InformationVO;
import com.webaid.domain.SearchCriteria;

public interface InformationDao {
	public List<InformationVO> selectAll();
	public InformationVO selectOne(int bno);
	public void insert(InformationVO vo);
	public void update(InformationVO vo);
	public void updateCnt(int bno);
	public void delete(int bno);
	public List<InformationVO> listSearch(SearchCriteria cri) throws Exception;
	public int listSearchCount(SearchCriteria cri) throws Exception;
}
