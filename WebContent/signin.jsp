<%@page import="javax.swing.JOptionPane"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="bean.DBConnected"%>
    <%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>sigin in </title>
</head>
<body>
<%
	DBConnected db = new DBConnected();
	Connection conn=db.getConnected("JavaWeb", "ZLM", "zlm");
	ResultSet rst;
	Statement stmt = conn.createStatement(java.sql.ResultSet.TYPE_SCROLL_INSENSITIVE,
			java.sql.ResultSet.CONCUR_READ_ONLY);//准备SQL语句
			
	String name=request.getParameter("username");
	String email=request.getParameter("email");
	String password=request.getParameter("password");
	String sql = "select * from users where username ='" + name + "'";
	//执行SQL语句并获取结果集
	rst = stmt.executeQuery(sql);
	if(rst.next())
	{%>
	<script type="text/javascript">
	alert("该用户名已存在!重新注册");
	window.history.go(-1);
	</script>	
<% 
	}
	else
	{
		stmt.executeUpdate("insert into users(username,email,password_) values('"+name+"','"+email+"','"+password+"')");
		%>
		<script type="text/javascript">
		alert("注册成功！");
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