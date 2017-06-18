<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="bean.DBConnected"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>log in </title>
</head>
<body>
<%
	DBConnected db = new DBConnected();
	Connection conn=db.getConnected("JavaWeb", "ZLM", "zlm");
	ResultSet rst;
	Statement stmt = conn.createStatement(java.sql.ResultSet.TYPE_SCROLL_INSENSITIVE,
			java.sql.ResultSet.CONCUR_READ_ONLY);//准备SQL语句
	String name=request.getParameter("username");
	String password=request.getParameter("password");
	String sql = "select * from users where username ='" + name + "' AND password_='"+password+"'";
	rst = stmt.executeQuery(sql);
	if(rst.next())
	{
	session.setAttribute("name", name);
	%>
	<script type="text/javascript">
	alert("登录成功！");
	location.href = document.referrer;//返回上一页并刷新页面
//	window.history.go(-1);
	</script>	
<% 
	}
	else
	{
		%>
		<script type="text/javascript">
		alert("登录失败，请重新登录！");
		window.history.go(-1);
		</script>
		<%
	}
%>

</body>
</html>
<%
db.DBClose(conn);
%>