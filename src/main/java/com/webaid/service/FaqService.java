package com.webaid.service;

import java.util.List;

import com.webaid.domain.FaqVO;
import com.webaid.domain.SearchCriteria;

public interface FaqService {
	public List<FaqVO> selectAll();
	public FaqVO selectOne(int bno);
	public void insert(FaqVO vo);
	public void update(FaqVO vo);
	public void updateCnt(int bno);
	public void delete(int bno);
	public List<FaqVO> listSearch(SearchCriteria cri) throws Exception;
	public int listSearchCount(SearchCriteria cri) throws Exception;
}
