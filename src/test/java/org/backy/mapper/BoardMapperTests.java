package org.backy.mapper;

import org.backy.domain.BoardVO;
import org.backy.mapper.BoardMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {
	
	@Autowired
	private BoardMapper mapper;
	
	@Test
	public void testGetList() {
//		List<BoardVO> list = mapper.getList();
//		
//		for(BoardVO vo :list)
//			log.info(vo);
		
		mapper.getList().forEach(board -> log.info(board));
	}
	
	@Test
	public void testInsert() {
		BoardVO vo = BoardVO.builder()
		.title("인서트3")
		.content("인서트 내용")
		.writer("루루")
		.build();
		mapper.insert(vo);
	}
	
	@Test
	public void testinsertSelectKey() {
		BoardVO vo = BoardVO.builder()
				.title("인서트4")
				.content("인서트 내용")
				.writer("루루")
				.build();
		mapper.insertSelectKey(vo);
	}
	
	@Test
	public void testRead() {
		BoardVO vo = mapper.read(1L);
		log.info("vovovovovo : " + vo);
	}
	
	@Test
	public void testDelete() {
		mapper.delete(3L);
	}
	
	@Test
	public void testUpdate() {
		BoardVO vo = BoardVO.builder()
				.title("제목")
				.content("내용")
				.writer("글쓴이")
				.bno(2L)
				.build();
		
		int result = mapper.update(vo);
		log.info(result);
	}
}
