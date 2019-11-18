<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工列表</title>
<%
pageContext.setAttribute("app_path",request.getContextPath());
%>
<script src="${app_path}/static/js/jquery-1.11.0.min.js" type="text/javascript"></script>
<link href="${app_path}/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="${app_path}/static/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

</head>
<body>


<!-员工修改的模态框 -->
<div class="modal fade" id="empUpdateModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">员工修改</h4>
      </div>
      <div class="modal-body">
        
        
        <form class="form-horizontal">
  <div class="form-group">
    <label for="emp_name_input" class="col-sm-2 control-label">empName</label>
    <div class="col-sm-10">
      <p class="form-control-static" id="empName_update"></p>
    </div>
  </div>
  <div class="form-group">
   <label for="emp_name_input" class="col-sm-2 control-label">email</label>
    <div class="col-sm-10">
      <input type="text"    name="email"  class="form-control" id="email_update_input" placeholder="email">
    </div>
  </div>
 
  <div class="form-group">
   <label for="emp_name_input" class="col-sm-2 control-label">gender</label>
    <div class="col-sm-10">
    <label class="radio-inline">
  <input type="radio" name="gender" id="gender1_update" value="M"  checked="checked">男
</label>
<label class="radio-inline">
  <input type="radio" name="gender" id="gender2_update" value="F">女
</label>
    </div>
  </div>
 
   <div class="form-group">
   <label for="emp_name_input" class="col-sm-2 control-label">deptName</label>
    <div class="col-sm-4">
      <select class="form-control" name="dId" id="depts2">

</select>
    </div>
  </div>
 
 
</form>
        
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="emp_update">更新</button>
      </div>
    </div>
  </div>
</div>



<!-员工添加的模态框 -->
<div class="modal fade" id="empAddModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">员工添加</h4>
      </div>
      <div class="modal-body">
        
        
        <form class="form-horizontal">
  <div class="form-group">
    <label for="emp_name_input" class="col-sm-2 control-label">empName</label>
    <div class="col-sm-10">
      <input type="text"  name="empName"  class="form-control" id="emp_name_input" placeholder="empName">
    </div>
  </div>
  <div class="form-group">
   <label for="emp_name_input" class="col-sm-2 control-label">email</label>
    <div class="col-sm-10">
      <input type="text"    name="email"  class="form-control" id="email_name_input" placeholder="email">
    </div>
  </div>
 
  <div class="form-group">
   <label for="emp_name_input" class="col-sm-2 control-label">gender</label>
    <div class="col-sm-10">
    <label class="radio-inline">
  <input type="radio" name="gender" id="gender1" value="M"  checked="checked">男
</label>
<label class="radio-inline">
  <input type="radio" name="gender" id="gender2" value="F">女
</label>
    </div>
  </div>
 
   <div class="form-group">
   <label for="emp_name_input" class="col-sm-2 control-label">deptName</label>
    <div class="col-sm-4">
      <select class="form-control" name="dId" id="depts1">

</select>
    </div>
  </div>
 
 
</form>
        
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="emp_save">保存</button>
      </div>
    </div>
  </div>
</div>


<div class="container">
<!-- 标题 -->
<div class="row">	
<div class="col-md-12"><h1>SSM-CRUD</h1></div>
</div>
<!-- 按钮 -->
<div class="row">
 <div class="col-md-4 col-md-offset-8">
<button class="btn btn-primary" id="empAddModelBtn">新增</button>
<button  class="btn btn-danger">删除</button>
</div>
</div>
<!-- 表格数据 -->
<div class="row">
 <div class="col-md-12">
 
 <table class="table table-hover" id="emps_tables">
 <thead>
 
  <tr>
 <th>#</th>
  <th>empname</th>
   <th>gender</th>
    <th>email</th>
     <th>deptname</th>
      <th>操作</th>
 </tr>
 </thead>
 <tbody >
 
 </tbody>

<%--  <c:forEach items="${pageinfo.list}"  var="emp" >
   <tr>
  <th>${emp.empId}</th>
  <th>${emp.empName} </th>
   <th>${emp.gender=='M'?"男":"女"} </th>
    <th>${emp.email} </th>
     <th>${emp.department.deptName} </th>
      <th>
      <button class="btn btn-primary btn-sm">
  <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
      编辑</button>
       <button class="btn btn-danger btn-sm">
     <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>    
       删除</button>
      </th>
  
  </tr>
 
 </c:forEach> --%>

 </table>
 
 </div>
</div>
<!-- 分页 -->

<div class="row"></div>
<div class="col-md-6" id="page_info_area">

</div>
<div class="col-md-6"  id="page_nav_area">
<%-- <nav aria-label="Page navigation">
  <ul class="pagination">
   <li><a href="${app_path}/emps?pn=1">首页</a></li>
  <c:if test="${pageinfo.hasPreviousPage}">
    <li>
      <a href="${app_path}/emps?pn=${pageinfo.pageNum-1}" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
  </c:if>
    <c:forEach items="${pageinfo.navigatepageNums}" var="pagenum">
    <c:if test="${pagenum==pageinfo.pageNum}">
       <li class="active"><a href="#">${pagenum}</a></li>
    </c:if>
    <c:if test="${pagenum!=pageinfo.pageNum}">
       <li ><a href="${app_path}/emps?pn=${pagenum}">${pagenum}</a></li>
    </c:if>
    </c:forEach>
<c:if test="${pageinfo.hasNextPage}">
  <li>
      <a href="${app_path}/emps?pn=${pageinfo.pageNum+1}" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
</c:if>
     <li><a href="${app_path}/emps?pn=${pageinfo.pages}">末页</a></li>
  </ul>
</nav> --%>
</div>
</div>
<script type="text/javascript">
var totalpage,currentpage;
$(function() {
to_page(1);
});
function to_page(pn) {
	
	$.ajax({
		url:"${app_path}/emps",
		data:"pn="+pn,
		type:"get",
		success:function(result)
		{
			 build_emps_table(result);
			 build_page_nav(result);
		}
	});
}
function build_emps_table(result) {
	$("#emps_tables tbody").empty();
	var emps=result.extend.pageinfo.list;
	$.each(emps,function(index,item){
		var empIdtd=$("<td></td>").append(item.empId);
		var empNametd=$("<td></td>").append(item.empName);
		var empgendertd=$("<td></td>").append(item.gender=='M'?"男":"女");	
		var emailtd=$("<td></td>").append(item.email);
		var deptNametd=$("<td></td>").append(item.department.deptName);
		
		var editbtn=$("<button></button>").addClass("btn btn-primary btn-sm edit_btn").
		append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
		editbtn.attr("edit_id",item.empId);
	var deletebtn=$("<button></button>").addClass("btn btn-danger btn-sm delete_btn").
	append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
	var btntd=$("<td></td>").append(editbtn).append(" ").append(deletebtn);
	deletebtn.attr("delete_id",item.empId);
		$("<tr></tr>").append(empIdtd).append(empNametd).append(empgendertd).append(emailtd).append(deptNametd).append(btntd).appendTo("#emps_tables tbody");
	   /*   <button class="btn btn-primary btn-sm">
	     <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
	         编辑</button>
	          <button class="btn btn-danger btn-sm">
	        <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>    
	          删除</button> */
		
	});
}
function build_page_nav(result) {
	$("#page_info_area").empty();
	$("#page_nav_area").empty();
	$("#page_info_area").append("当前"+result.extend.pageinfo.pageNum+"页,总页数:"+result.extend.pageinfo.pages+",总记录数:"+result.extend.pageinfo.total);
	totalpage=result.extend.pageinfo.total;
	currentpage=result.extend.pageinfo.pageNum;
	var ul=$("<ul></ul>").addClass("pagination");

	var firstpage=$("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
	var prepage=$("<li></li>").append($("<a></a>").append("&laquo;"));


	if(result.extend.pageinfo.hasPreviousPage==false)
	{
	firstpage.addClass("disabled");
	prepage.addClass("disabled");
	}
	else
		{
		firstpage.click(function()
				{
			to_page(1);
				}
		);
		
		prepage.click(function()
				{
			to_page(result.extend.pageinfo.pageNum-1);
				}
		);
		}
	var nextpage=$("<li></li>").append($("<a></a>").append("&raquo;"));
	var lastpage=$("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
	
	if(result.extend.pageinfo.hasNextPage==false)
	{
		nextpage.addClass("disabled");
		lastpage.addClass("disabled");
	}
	else
		{
		nextpage.click(function()
				{
			to_page(result.extend.pageinfo.pageNum+1);
				}
	);	
		lastpage.click(function()
				{
			to_page(result.extend.pageinfo.pages);
				}
		);
		}
	ul.append(firstpage).append(prepage);
	$.each(result.extend.pageinfo.navigatepageNums,function(index,item)
			{
		var numli=$("<li></li>").append($("<a></a>").append(item));
		ul.append(numli);
		
		if(result.extend.pageinfo.pageNum==item)
		{
		numli.addClass("active");
		}
		
		numli.click(function()
				{
			to_page(item);
				}
			);
			})

	ul.append(nextpage).append(lastpage);
	var nav=$("<nav></nav>").append(ul);
	nav.appendTo("#page_nav_area");
}
function validate_add_form()
{
	var empName=$("#emp_name_input").val();
	var regname=/(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
	if(!regname.test(empName))
		{
		alert("用户名可以是2-5w位中文或者6-16位英文组合");
		return false;
		}
	return true;
	
	}
$("#emp_save").click(function(){
	if(!validate_add_form())
		{
		return false;
		};
	$.ajax({
		url:"${app_path}/emp",
		type:"POST",
		data:$("#empAddModel form").serialize(),
		success:function(result){
			$("#empAddModel").modal('hide');
			to_page(totalpage);
			console.log(result);
		}
	});
});
$("#empAddModelBtn").click(function(){
	//查部门信息
	$("#emp_name_input").val("");
	$("#email_name_input").val("");
	
	getdept("#depts1");
	
	$("#empAddModel").modal({
		
		backtop:"static"
	});
});
function  getdept(ele){
	$(ele).empty();
	$.ajax({
		url:"${app_path}/depts",
		type:"get",
		success:function(result)
		{
			$.each(result.extend.dept,function(){
				var option=$("<option></option>").append(this.deptName).attr("value",this.deptId);
				option.appendTo(ele);
			})
		}
	});
}
$(document).on("click",".edit_btn",function(){
	 
	getdept("#depts2");
	getEmp($(this).attr("edit_id"));
	$("#emp_update").attr("edit_id",$(this).attr("edit_id"));
$("#empUpdateModel").modal({
	
		backtop:"static"
	});
});
$(document).on("click",".delete_btn",function(){
	 
var deletename=$(this).parents("tr").find("td:eq(1)").text();
 var deleteid=$(this).attr("delete_id");
if(confirm("确认删除【"+deletename+"】吗?"))
	{
	$.ajax({
		url:"${app_path}/emp/"+deleteid,
		type:"delete",
		success:function(result)
		{
			to_page(currentpage);
		}
	});
	}
});
function  getEmp(id)
{
	$.ajax({
		url:"${app_path}/emp/"+id,
		type:"GET",
		success:function(result){
			var empData =result.extend.emp;
			$("#empName_update").text(empData.empName);
			$("#email_update_input").val(empData.email);
			$("#empUpdateModel input[name=gender]").val([empData.gender]);
			$("#empUpdateModel select").val([empData.dId]);
		}
		
	});
	
	}
	$("#emp_update").click(function(){
		$.ajax({
			url:"${app_path}/emp/"+$(this).attr("edit_id"),
			type:"POST",
			data:$("#empUpdateModel form").serialize()+"&_method=PUT",
			success:function(result){
				$("#empUpdateModel").modal("hide");
				to_page(currentpage);
			}
		});
	});
</script>
</body>
</html>