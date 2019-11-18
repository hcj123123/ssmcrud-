package com.atguigu.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.crud.bean.Emloyee;
import com.atguigu.crud.dao.EmloyeeMapper;

@Service
public class EmployeeService {

	@Autowired
	EmloyeeMapper emloyeeMapper;

	public List<Emloyee> getAll() {
		// TODO 自动生成的方法存根
		return emloyeeMapper.selectByExampleWithDept(null);
	}

	public void saveemp(Emloyee emloyee) {
		emloyeeMapper.insertSelective(emloyee);

	}

	public Emloyee getEmp(Integer id) {
		Emloyee selectByPrimaryKey = emloyeeMapper.selectByPrimaryKey(id);
		return selectByPrimaryKey;
	}

	public void updateemp(Emloyee emloyee) {
		emloyeeMapper.updateByPrimaryKeySelective(emloyee);

	}

	public void deleteemp(Integer id) {
		emloyeeMapper.deleteByPrimaryKey(id);
	}

}
