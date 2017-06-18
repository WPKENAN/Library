<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
	<jsp:include page="head.jsp"></jsp:include>
<script type="text/javascript">

function validate_required(field,alerttxt)
{
with (field)
  {
  if (value==null||value=="")
    {alert(alerttxt);return false}
  else {return true}
  }
}

function validate_form(thisform)
{
with (thisform)
  {
	if (validate_required(username,"用户名必须填写!")==false)
    {username.focus();return false}
  
	if (validate_required(email,"邮箱必须填写!")==false)
    {email.focus();return false}
	if (validate_required(password,"密码必须填写!")==false)
    {password.focus();return false}
	if (validate_required(password2,"请填写重复密码!")==false)
    {password2.focus();return false}
	var emailvalue = document.getElementById("email").value;
  	if (emailvalue != "") {
     var reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
     isok= reg.test(emailvalue );
       if (!isok) {
            alert("邮箱格式不正确，请重新输入！");
            document.getElementById("email").focus();
            return false;
        }
    };
	ps= document.getElementById("password").value;
	if(ps.length<6){
	    alert("密码至少大于等于6位");
	    document.getElementById("password").focus();
	    return false;
	}
	var reg = /^[0-9a-zA-Z]+$/;
	if(!reg.test(ps)){
	    alert("密码只能由数字和字母组成");	
	    document.getElementById("password").focus();
	    return false;
	}
	ps2=document.getElementById("password2").value;
	if (ps2 != ps)
	{
		alert("两次密码不一致");	
	    document.getElementById("password2").focus();
	    return false;
	}
	}
}
function validate_form1(thisform)
{
with (thisform)
  {
	if (validate_required(username,"请填写用户名!")==false)
    {username.focus();return false}
 
	if (validate_required(password,"请填写密码!")==false)
    {password.focus();return false}
  
  }
}
</script>

</head>
<body>
<div class="gtco-loader"></div>
	
	<div id="page">

	
	<div class="page-inner">
	<jsp:include page="navy.jsp"></jsp:include>
	<header id="gtco-header" class="gtco-cover" role="banner" style="background-image: url(images/my_img_9.jpg)">
		<div class="overlay"></div>
		<div class="gtco-container">
			<div class="row">
				<div class="col-md-12 col-md-offset-0 text-left">
					<div class="row row-mt-15em">
						
						
					</div>
						<%
						if(session.getAttribute("name") == null)
						{
							%>
			
							<div class="col-md-4 col-md-push-1 animate-box" data-animate-effect="fadeInRight">
							<div class="form-wrap">
								<div class="tab">
									<ul class="tab-menu">
										<li class="active gtco-first"><a href="#" data-tab="signup">注册</a></li>
										<li class="gtco-second"><a href="#" data-tab="login">登录</a></li>
									</ul>
									<div class="tab-content">
										<div class="tab-content-inner active" data-content="signup">
											<form action="signin.jsp" method="post" onsubmit="return validate_form(this)">
												<div class="row form-group">
													<div class="col-md-12">
														<label for="username">用户名</label>
														<input type="text" class="form-control" id="username" name="username">
													</div>
												</div>
												<div class="row form-group">
													<div class="col-md-12">
														<label for="email">邮箱</label>
														<input type="text" class="form-control" id="email" name="email">
													</div>
												</div>
												
												<div class="row form-group">
													<div class="col-md-12">
														<label for="password">密码</label>
														<input type="password" class="form-control" id="password" name="password">
													</div>
												</div>
												<div class="row form-group">
													<div class="col-md-12">
														<label for="password2">重复密码</label>
														<input type="password" class="form-control" id="password2">
													</div>
												</div>

												<div class="row form-group">
													<div class="col-md-12">
														<input type="submit" class="btn btn-primary" value="注册">
													</div>
												</div>
											

											</form>	
										</div>

										<div class="tab-content-inner" data-content="login">
											<form action="login.jsp" method="post" onsubmit="return validate_form1(this)">
												<div class="row form-group">
													<div class="col-md-12">
														<label for="username">用户名</label>
														<input type="text" class="form-control" id="username" name="username">
													</div>
												</div>
												<div class="row form-group">
													<div class="col-md-12">
														<label for="password">密码</label>
														<input type="password" class="form-control" id="password" name="password">
													</div>
												</div>

												<div class="row form-group">
													<div class="col-md-12">
														<input type="submit" class="btn btn-primary" value="登录">
												
													</div>
												</div>
											
											</form>	
												
										</div>

									</div>
								</div>
							</div>
						</div>
						<%
						}
						%>
					</div>
							
					
				</div>
			</div>
		</div>
			
	</header>
	
	
<jsp:include page="buttom.jsp"></jsp:include>
</body>
</html>