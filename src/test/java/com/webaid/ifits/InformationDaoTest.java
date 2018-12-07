package com.webaid.ifits;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.webaid.domain.InformationVO;
import com.webaid.persistence.InformationDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class InformationDaoTest {

	@Autowired
	private InformationDao dao;
	
	//@Test
	public void selectAll(){
		dao.selectAll();
	}
	
	//@Test
	public void selectOne(){
		dao.selectOne(96);
	}
	
	//@Test		
	public void insert(){
		InformationVO vo=new InformationVO();
		vo.setBno(0);
		vo.setTitle("testtest");
		vo.setContent("test content~~");
		dao.insert(vo);
	}
	
	//@Test
	public void update(){
		InformationVO vo=new InformationVO();
		
		vo.setBno(1);
		vo.setTitle("update_Test");
		vo.setContent("test_content_update");
		
		dao.update(vo);
	}
	//@Test
	public void delete(){
		dao.delete(1);
	}
}
