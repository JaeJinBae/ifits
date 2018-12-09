package com.webaid.service;

import java.util.List;

import com.webaid.domain.ReviewVO;
import com.webaid.domain.SearchCriteria;

public interface ReviewService {
	public List<ReviewVO> selectAll();
	public ReviewVO selectOne(int bno);
	public void insert(ReviewVO vo);
	public void update(ReviewVO vo);
	public void updateCnt(int bno);
	public void updateStateWait(int bno);
	public void delete(int bno);
	public List<ReviewVO> listSearch(SearchCriteria cri) throws Exception;
	public int listSearchCount(SearchCriteria cri) throws Exception;
}
