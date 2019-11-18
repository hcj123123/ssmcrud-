package com.atguigu.crud.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.atguigu.crud.bean.Emloyee;
import com.atguigu.crud.bean.EmloyeeExample;

public interface EmloyeeMapper {
	long countByExample(EmloyeeExample example);

	int deleteByExample(EmloyeeExample example);

	int deleteByPrimaryKey(Integer empId);

	int insert(Emloyee record);

	int insertSelective(Emloyee record);

	List<Emloyee> selectByExample(EmloyeeExample example);

	Emloyee selectByPrimaryKey(Integer empId);

	List<Emloyee> selectByExampleWithDept(EmloyeeExample example);

	Emloyee selectByPrimaryKeyWithDept(Integer empId);

	int updateByExampleSelective(@Param("record") Emloyee record, @Param("example") EmloyeeExample example);

	int updateByExample(@Param("record") Emloyee record, @Param("example") EmloyeeExample example);

	int updateByPrimaryKeySelective(Emloyee record);

	int updateByPrimaryKey(Emloyee record);
}