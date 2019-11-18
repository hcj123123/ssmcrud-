package com.atguigu.crud.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.atguigu.crud.bean.Emloyee;
import com.atguigu.crud.bean.Msg;
import com.atguigu.crud.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class EmployeeController {
	@Autowired
	EmployeeService employeeservice;

	/*
	 * @RequestMapping("/emps") public String getemps(@RequestParam(value = "pn",
	 * defaultValue = "1") Integer pn, Model model) { // 引入PageHelper插件,传入页码和大小
	 * PageHelper.startPage(pn, 5);
	 * 
	 * List<Emloyee> emps = employeeservice.getAll();
	 * 
	 * PageInfo page = new PageInfo(emps, 5);
	 * 
	 * model.addAttribute("pageinfo", page); return "list"; }
	 */
	@RequestMapping("/emps")
	@ResponseBody
	public Msg getEmpsWithJson(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
		PageHelper.startPage(pn, 5);
		List<Emloyee> emps = employeeservice.getAll();
		PageInfo page = new PageInfo(emps, 5);
		return Msg.success().add("pageinfo", page);
	}

	@ResponseBody
	@RequestMapping(value = "/emp", method = RequestMethod.POST)
	public Msg saveemp(Emloyee emloyee) {
		employeeservice.saveemp(emloyee);
		return Msg.success();
	}

	@RequestMapping(value = "/emp/{id}", method = RequestMethod.GET)
	@ResponseBody
	public Msg getEMmp(@PathVariable("id") Integer id) {
		Emloyee emloyee = employeeservice.getEmp(id);
		return Msg.success().add("emp", emloyee);
	}

	@RequestMapping(value = "/emp/{empId}", method = RequestMethod.PUT)
	@ResponseBody
	public Msg updateemp(Emloyee emloyee) {
		employeeservice.updateemp(emloyee);
		return Msg.success();
	}

	@ResponseBody
	@RequestMapping(value = "/emp/{id}", method = RequestMethod.DELETE)
	public Msg deleteemp(@PathVariable("id") Integer id) {
		employeeservice.deleteemp(id);
		return Msg.success();
	}
}
