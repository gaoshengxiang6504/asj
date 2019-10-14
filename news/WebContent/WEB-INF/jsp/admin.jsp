<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员界面</title>
<link rel="stylesheet" type="text/css" href="css/admin.css"/>
<script src="js/jquery-1.12.4.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
 jQuery(function() {
		$("#a4").click(function() {
			$("#ul2 li a").toggle();
		});
		$("#a3").click(function() {
			$("#fid").toggle();
		});
		$("#ul2 li").children(":first-child").click(function() {
			$(this).siblings("form").find("input").toggle();
		});
		
	});
</script>
</head>
<body>
<div id="global">
	<div id="div1"><img src="images/01.PNG" ></div>
	<div id="div2">
		<p>欢迎管理员：${user.username}</p>
		<hr >
		<ul id="ul1">
			<li><a href="${pageContext.request.contextPath}/addnews">添加新闻</a></li>
			<li><a href="#">编辑新闻</a></li>
			<li><a href="javascript:;" id="a3">添加主题</a></li>
			<li><a href="javascript:;" id="a4">编辑主题</a></li>
		</ul>
		<form action="${pageContext.request.contextPath }/addtitle" method="post" >
			<fieldset id="fid">
			<legend>添加主题</legend>
			<input type="text" id="i1" name="title"  placeholder="请输入主题" />
			<input type="submit"  id="i2"  value="确定" />
		</fieldset>
		</form>
		<ul id="ul2">
			<c:forEach var="titles" items="${titles}">
			<c:if test="${(titles.title)!='全部'}">
			<li>${titles.title}
			<a   href="javascript:;">修改</a>
			<a href="${pageContext.request.contextPath }/deleteTitle?title=${titles.title}">删除</a>
			<form action="${pageContext.request.contextPath}/updateTitle?id=${titles.id}" method="post"><input name="title" type="text" value="${titles.title}"/><input type="submit" value="确定"/></form>
			</li>
			</c:if>
		    </c:forEach>
		</ul>
	</div>
</div>
</body>
</html>