<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/head.css"/>


<script src="js/jquery-1.12.4.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
	jQuery(function(){
			jQuery("#nave li").click(function(){
			var title=this.innerHTML;
			jQuery.ajax({
				url:"${pageContext.request.contextPath}/findByTitle",
				type:"post",
				data:JSON.stringify({title:title}),
				contentType:"application/json;charset=UTF-8",
				success:function(datas){
					if(datas!=null){
						var ls=jQuery("#title ");
						ls.empty();
						for ( var i = 0; i < datas.length; i++) {
							ls.append("<li><a href='${pageContext.request.contextPath}/listContent?name="+datas[i].name+"'>"+datas[i].name+"</a></li>");
							ls.append("<span>"+datas[i].date+"</span>"); 
							if((i+1)%5==0){ls.append("<br><br><br>");}
						}
					}
				}
			});
		}).mousemove(function(){
			jQuery(this).css({"text-decoration":"underline","color":"red"});
		}).mouseout(function(){
			jQuery(this).css({"text-decoration":"none","color":"#000000"});
		});
	   
	});
</script>
<title>用户界面</title>
</head>
<body>
<div id="global">
	 <!-- 头部 -->
	<div id="div1"><img src="images/01.PNG" ></div>
	<!-- 左侧边框 -->
	<div id="div2">
	<div class="div"><h3>国际新闻</h3><p>英国政治危机：四面楚歌之下，约翰逊下一步怎么走？<br>日美签署贸易协定最快年内生效 汽车关税或对美让步<br></p></div>
	<div class="div"><h3>国内新闻</h3><p>习近平出席投运仪式并宣布 北京大兴国际机场正式投入运营 韩正出席仪式并致辞 <br></p></div>
	<!-- 中间数据 -->
	<div id="div3">
		<img src="images/02.PNG" ><p>分类新闻</p>
		<ul id="nave">
		<c:forEach var="titles" items="${titles}">
		<li>${titles.title}</li>
		</c:forEach>
	    </ul>
		<hr >
		<ul id="title">
		<c:forEach var="nave" items="${nave}" varStatus="status" >
		<li><a href="${pageContext.request.contextPath}/listContent?name=${nave.name}">${nave.name}</a></li><span>${nave.date}</span>
		<c:if test="${((status.count)%5)==0}"><br><br><br></c:if>
		</c:forEach>
		</ul>
		<div id="paging">
			<script>
			/* layui.use('laypage', function(){
			  var laypage = layui.laypage;
			  
			  //执行一个laypage实例
			  laypage.render({
			    elem: 'paging', //注意，这里的 test1 是 ID，不用加 # 号
			    count: 50 ,//数据总数，从服务端得到
				limit:10,//每页显示的条数
			    // first:1,//首页
				// prev:   ,//上一页
				// next:   ,//下一页
			    // last:   ,//尾页
				jump: function(obj, first){
				    //obj包含了当前分页的所有参数，比如：
				    console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
				    console.log(obj.limit); //得到每页显示的条数
				    
				    //首次不执行
				    if(!first){
				      //do something
				    }
				  }
			  });
			}); */
			</script>	
		</div>
	</div>
	<div id="font">
	 <span>版权归本网站所有</span>	
	</div>
</div>
</div>
</body>
</html>