<%@page import="javax.swing.JOptionPane"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<nav class="gtco-nav" role="navigation">
		<div class="gtco-container">
			
			<div class="row">
				<div class="col-sm-4 col-xs-12">
					<div id="gtco-logo"><a href="index.jsp">欢迎来到我的图书馆网站 <em>.</em></a></div>
				</div>
				<div class="col-xs-8 text-right menu-1">
					<ul>
						<li class="btn-cta"><a href="search.jsp"><span>图书查询</span></a></li>
						<li class="btn-cta"><a href="BAR.jsp"><span>借书还书 </span></a></li>
						<li class="btn-cta"><a href="report.jsp"><span>新书架</span></a></li>
						<%
							if(session.getAttribute("name") != null)
							{
						%>
							<li class="btn-cta"><a href="index.jsp"><span>欢迎你：<%=session.getAttribute("name").toString() %></span></a></li>
							
							<li class="btn-cta"><a href="logoff.jsp"><span>注销</span></a></li>
							
						<% 
						}
						else
						{
							%>
							<li class="btn-cta"><a href="logandsign.jsp"><span>登录/注册</span></a></li>
							<li class="btn-cta"><a href="help.jsp"><span>找回密码</span></a></li>
						<%}
						%>
					</ul>
				</div>
			</div>
			
		</div>
	</nav>
	
</body>
</html>