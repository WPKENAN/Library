<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page language="java" import="java.sql.*"%>
    <%@page import="bean.DBConnected"%>
    <%
	//变量声明
	java.sql.Connection sqlCon; //数据库连接对象
	java.sql.Statement sqlStmt; //SQL语句对象
	java.sql.ResultSet sqlRst; //结果集对象
	java.lang.String strCon; //数据库连接字符串
	java.lang.String strSQL; //SQL语句
	int intPageSize; //一页显示的记录数
	int intRowCount; //记录总数
	int intPageCount; //总页数
	int intPage; //待显示页码
	java.lang.String strPage;
	int i;
	//设置一页显示的记录数
	intPageSize = 3;
	//取得待显示页码
	strPage = request.getParameter("page");
	if (strPage == null) {//表明在QueryString中没有page这一个参数，此时显示第一页数据
		intPage = 1;
	} else {//将字符串转换成整型
		intPage = java.lang.Integer.parseInt(strPage);
		if (intPage < 1)
			intPage = 1;
	}
	//装载JDBC驱动程序
	DBConnected db = new DBConnected();
	sqlCon = db.getConnected("Library", "ZLM", "zlm");
	sqlStmt = sqlCon.createStatement(java.sql.ResultSet.TYPE_SCROLL_INSENSITIVE,
			java.sql.ResultSet.CONCUR_READ_ONLY);//准备SQL语句
	String req = request.getParameter("search");
	if (req != null) {
		session.setAttribute("req", req);
	} else {
		req = (String) session.getAttribute("req");
	}
	
	strSQL = "select * from books where name like '%" + req + "%'";
	//执行SQL语句并获取结果集
	sqlRst = sqlStmt.executeQuery(strSQL);
	//获取记录总数
	sqlRst.last();//??光标在最后一行
	intRowCount = sqlRst.getRow();//获得当前行号
	//记算总页数
	intPageCount = (intRowCount + intPageSize - 1) / intPageSize;
	//调整待显示的页码
	if (intPage > intPageCount)
		intPage = intPageCount;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="head.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>scan</title>
<link href="css/bootstrap.min.scan.css" type="text/css" rel="stylesheet">
<link href="css/style.scan.css" type="text/css" rel="stylesheet">
<link type="text/css" href="css/nprogress.scan.css" rel="stylesheet">
<!--[if lt IE 9]>
    <script src="js/html5shiv.min.js" type="text/javascript"></script>
    <script src="js/respond.min.js" type="text/javascript"></script>
    <script src="js/selectivizr-min.js" type="text/javascript"></script>
<![endif]-->

<meta name="Keywords" content="" />
<meta name="description" content="" />
<script type="text/javascript">
//判断浏览器是否支持HTML5
window.onload = function() {
	if (!window.applicationCache) {
		window.location.href="ie.html";
	}
}
</script>
</head>

<body>
<jsp:include page="navy.jsp"></jsp:include>
<br/>
   <br/>
   <br/>
   <br/>
   <br/>
<section class="container user-select">
  
  <!--/超小屏幕可见-->
  <div class="content-wrap"><!--内容-->
    <div class="content">
      <div id="carousel-example-generic" class="carousel slide" data-ride="carousel"> <!--banner-->
        <ol class="carousel-indicators">
          <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
          <li data-target="#carousel-example-generic" data-slide-to="1"></li>
          <li data-target="#carousel-example-generic" data-slide-to="2"></li>
        </ol>
        
      <!--/banner-->
      
      <div class="content-block new-content">
        <h2 class="title"><strong>查询结果</strong></h2>
        <div class="row">
        
          <div class="news-list">
          <%
			if (intPageCount > 0) {
				//将记录指针定位到待显示页的第一条记录上
				sqlRst.absolute((intPage - 1) * intPageSize + 1);
				//显示数据
				i = 0;
				String url, id, name, years, author, publish, describe;
				while (i < intPageSize && !sqlRst.isAfterLast()) {
					url = sqlRst.getString("url");
					id = sqlRst.getString("id");
					name = sqlRst.getString("name");
					years = sqlRst.getString("years");
					author = sqlRst.getString("author");
					publish = sqlRst.getString("publish");
					describe = sqlRst.getString("describe");
		%>
            <div class="news-img col-xs-5 col-sm-5 col-md-4"> <a target="_blank" href=""><img src="<%=url%>" height="150" width="100" alt=""> </a> </div>
            <div class="news-info col-xs-7 col-sm-7 col-md-8">
              <dl>
                <dt> <a href="" target="_blank" > <%=name %> </a> </dt>
                
                                              编号：<%=id%> <br> 作者：<%=author%><br>书名：<%=name%> <br>
				出版社：<%=author%><br>
				年份：<%=years%><br> 本书简介：<%=describe%>
              </dl>
              <br><br>
              <div class="news_bot col-sm-7 col-md-8"> 
              <span class="tags visible-lg visible-md"> <a href="">评论</a> <a href="">点赞</a> 
              </span> <span class="look"> 共 <strong>0</strong> 人浏览 <strong> 0 </strong> 点赞 </span> 
              </div>
           	
            </div>
          </div>
         <%
			sqlRst.next();
					i++;
				}
			}
		%>
        </div>
        <br>
        <br>
        <br><br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <form method="POST" action="scan.jsp" >
		<font size="4">第<%=intPage%>页 共<%=intPageCount%>页
		</font>

		<%
			if (intPage > 1) {
		%><a href="scan.jsp?page=<%=intPage - 1%>"> 上一页</a>
		<%
			}
		%>
		<%
			if (intPage < intPageCount) {
		%><a href="scan.jsp?page=<%=intPage + 1%>">下一页 </a>
		<%
			}
		%>
		<font size="4">转到第:<input type="text" name="page" size="8">
			页
		</font><span><input  class=buttonface type='submit' value='GO'
			name='cndok'></span>
	</form>
        <!--<div class="news-more" id="pagination">
        	<a href="">查看更多</a>
        </div>-->
       <!--   <div class="quotes" style="margin-top:15px"><span class="disabled">首页</span><span class="disabled">上一页</span><span class="current">1</span><a href="">2</a><a href="">下一页</a><a href="">尾页</a></div>
      --></div>
      
    </div>
    
  </div>
  
  </div>
  
  <!--/内容-->
  
  <!--/右侧>992px显示-->
  <jsp:include page="buttom.jsp"></jsp:include>
</body>
</html>
