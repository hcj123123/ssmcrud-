package com.atguigu.crud.test;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.atguigu.crud.bean.Emloyee;
import com.atguigu.crud.dao.DepartmentMapper;
import com.atguigu.crud.dao.EmloyeeMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:applicationContext.xml" })
public class MapperTest {
	@Autowired
	DepartmentMapper departmentMapper;
	@Autowired
	EmloyeeMapper emloyeeMapper;

	@Autowired
	SqlSession sqlseesion;

	@Test
	public void testCRUD() {
		/*
		 * ApplicationContext ioc=new
		 * ClassPathXmlApplicationContext("applicationContext.xml"); DepartmentMapper
		 * bean=ioc.getBean(DepartmentMapper.class);
		 */
		/*
		 * System.out.println(departmentMapper); departmentMapper.insertSelective(new
		 * Department(null, "开发部")); departmentMapper.insertSelective(new
		 * Department(null, "测试部"));
		 */
		/*
		 * emloyeeMapper.insertSelective(new Emloyee(null, "Jerry", "M",
		 * "Jerry@atguigu.com", 1));
		 */
		EmloyeeMapper mapper = sqlseesion.getMapper(EmloyeeMapper.class);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		System.out.println(df.format(new Date()));
		for (int i = 0; i < 1000; i++) {
			String uid = UUID.randomUUID().toString().substring(0, 5) + i;
			mapper.insertSelective(new Emloyee(null, uid, "M", "@atguigu.com", 1));
		}
		System.out.println(df.format(new Date()));
		System.out.println("批量操作");
	}
}
