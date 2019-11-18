package com.atguigu.crud.test;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.atguigu.crud.bean.Emloyee;
import com.github.pagehelper.PageInfo;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = { "classpath:applicationContext.xml", "classpath:mvc.xml" })
public class MvcTest {

	@Autowired
	WebApplicationContext context;

	MockMvc mockMvc;

	@Before
	public void initmockmvc() {

		mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
	}

	@Test
	public void testpage() throws Exception {
		MockHttpServletRequestBuilder param = MockMvcRequestBuilders.get("/emps").param("pn", "5");
		System.out.println(param);
		ResultActions perform = mockMvc.perform(param);
		System.out.println(perform);
		MvcResult result = perform.andReturn();
		MockHttpServletRequest request = result.getRequest();
		PageInfo pi = (PageInfo) request.getAttribute("pageinfo");
		System.out.println("当前页码" + pi.getPageNum());
		System.out.println("总页码" + pi.getPages());
		System.out.println("总记录数" + pi.getTotal());
		int[] list = pi.getNavigatepageNums();
		for (int i : list) {
			System.out.println(" " + i);
		}

		List<Emloyee> list2 = pi.getList();
		for (Emloyee emloyee : list2) {
			System.out.println("ID" + emloyee.getEmpId() + "==>name" + emloyee.getEmpName());
		}
	}

	@Test
	public void name() {
		System.out.println(123);
	}
}
