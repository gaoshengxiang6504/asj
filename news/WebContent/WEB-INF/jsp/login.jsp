<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录页</title>
<link rel="stylesheet" type="text/css" href="css/login.css"/>
</head>
<body>
<div id="forms">
		<div  id="div1"><img src="images/新闻01.PNG" ></div>
		<form action="${pageContext.request.contextPath}/login" method="post">
			<div id="div2">
			<ul>
			<li><label>用户名:</label><input type="text" name="username"/></li>
			<li><label>密&nbsp;&nbsp;&nbsp;码:</label><input type="password" name="password"/></li>
			<li><input class="in" type="submit" value="登录" /><input class="in" type="reset" value="重置"></li>
			</ul>
		</div>
		</form>
	</div>
</body>
</html>