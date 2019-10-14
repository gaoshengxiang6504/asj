<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/addNews.css"/>
<title>添加新闻</title>
<script src="js/jquery-1.12.4.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
  function verify(){
	  if($("select option:selected").text()== "请选择主题"){
		  alert("请选择主题");
		  return false;
	  }
	  else if ($("#intitle").val()=='') {
		  alert("请输入新闻标题");
		  return false;
	}
	return true;
  }
</script>
</head>
<body>
  <form action="${pageContext.request.contextPath}/add" method="post" onsubmit="return verify()">
	<fieldset id="fid">
		<legend>添加新闻</legend>
		<select name="title">
			<option value="1" selected="selected">请选择主题</option>
			<c:forEach var="titles" items="${titles}">
			<c:if test="${(titles.title)!='全部'}">
			<option >${titles.title}</option>
			</c:if>
		    </c:forEach>
		</select> <input type="text" id="intitle"  name="name" placeholder="请输入新闻标题" />
		<textarea rows="10" cols="50" name="content" placeholder="请输入新闻内容"></textarea>
		<input type="submit" value="确定"> 
		<input type="reset" value="重置">
		<a href="${pageContext.request.contextPath }/admin"><input type="button" value="返回"></a>
	</fieldset>
	</form>
</body>
</html>