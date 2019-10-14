<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
h2{
  margin-bottom: 0;
}
#p1{
 margin-top: 0;
 color: lightgrey;
}
a{
float: right;
}
</style>
</head>
<body>
<fieldset>
<legend>新闻详情</legend>
 <h2>${contents.name}</h2>
 <p id="p1"><span>主题:</span>${title2.title}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>发布时间:</span> ${contents.date}</p>
 <p>${contents.content}</p>
 <a href="${pageContext.request.contextPath }/index"><input type="button" value="返回"></a>
 </fieldset>
</body>
</html>