package com.webaid.persistence;

import java.util.List;

import com.webaid.domain.QnaVO;
import com.webaid.domain.SearchCriteria;

public interface QnaDao {
	public List<QnaVO> selectAll();
	public QnaVO selectOne(int bno);
	public void insert(QnaVO vo);
	public void update(QnaVO vo);
	public void updateState(int bno);
	public void updateCnt(int bno);
	public void updateStateWait(int bno);
	public void delete(int bno);
	public List<QnaVO> listSearch(SearchCriteria cri) throws Exception;
	public int listSearchCount(SearchCriteria cri) throws Exception;
	public void updateReplyCnt(int bno, int amount) throws Exception;
}
