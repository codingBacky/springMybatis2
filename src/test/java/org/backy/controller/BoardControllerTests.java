package org.backy.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
						"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j
@WebAppConfiguration
public class BoardControllerTests {
	
	@Autowired
	private WebApplicationContext context;//가상 서버
	
	private MockMvc mockMvc;
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
	}
	
	@Test
	public void testList() throws Exception{
		mockMvc.perform(
				MockMvcRequestBuilders.get("/board/list"))
				.andReturn()
				.getModelAndView()
				.getModelMap();
		
	}
	@Test
	public void testGet() throws Exception{
		
										
		log.info(mockMvc.perform(
				MockMvcRequestBuilders.get("/board/get")
				.param("bno", "11"))
				.andReturn()
				.getModelAndView()
				.getModelMap());
		
		
	}
	
	@Test
	public void testRegister() throws Exception{
		String resultPage = mockMvc.perform(
				MockMvcRequestBuilders.post("/board/register")
										.param("title", "수정 제목")
										.param("content", "수정 내용")
										.param("writer","수정 저자"))
										.andReturn()
										.getModelAndView()
										.getViewName();
										
		log.info("view name : " + resultPage);
		
	}
	@Test
	public void testModify() throws Exception{
		String resultPage = mockMvc.perform(
				MockMvcRequestBuilders.post("/board/modify")
				.param("bno", "11")
				.param("title", "재수정 제목")
				.param("content", "재수정 내용")
				.param("writer","재수정 저자"))
				.andReturn()
				.getModelAndView()
				.getViewName();
		
		log.info("view name : " + resultPage);
		
	}
	
	@Test
	public void testRemove() throws Exception{
		String resultPage = mockMvc.perform(
				MockMvcRequestBuilders.post("/board/remove")
										.param("bno", "13")
										.param("title", "수정 제목")
										.param("content", "수정 내용")
										.param("writer","수정 저자"))
										.andReturn()
										.getModelAndView()
										.getViewName();
										
		log.info("view name : " + resultPage);
		
	}
}
