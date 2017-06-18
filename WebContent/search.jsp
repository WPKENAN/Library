<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="head.jsp"></jsp:include>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<title>Wellcome!</title>
	<link rel="stylesheet" type="text/css" href="css/normalize.css" />
	<link rel="stylesheet" type="text/css" href="css/default.css">
	<link rel="stylesheet" type="text/css" href="css/search-form.css">
	
	<!--[if IE]>
		<script src="http://libs.useso.com/js/html5shiv/3.7/html5shiv.min.js"></script>
	<![endif]-->
</head>
<body>
<jsp:include page="navy.jsp"></jsp:include>
<br>
<br>
	<header class="htmleaf-header">
		<h1>欢迎你使用本图书馆 <span>You are wellcome to use this library!</span></h1>
		<div class="htmleaf-links">
			<!-- <a class="htmleaf-icon icon-htmleaf-home-outline" href="http://www.jb51.net/" title="脚本之家" target="_blank"><span> 脚本之家</span></a>
			<a class="htmleaf-icon icon-htmleaf-arrow-forward-outline" href="http://www.jb51.net/" title="返回下载页" target="_blank"><span> 返回下载页</span></a>-->
		</div>
	</header>
	<section class="htmleaf-container">
		<form action="scan.jsp">
            <div class="search-wrapper">
                <div class="input-holder">
                    <input name="search" id="search" type="text" class="search-input" placeholder="search......" />
                      	
                      <button class="search-icon" onclick="searchToggle(this, event);"><span></span></button>
                </div>
                <span class="close" onclick="searchToggle(this, event);"></span>
                <div class="result-container">

                </div>
            </div>
        </form>
	</section>
	
	 <!-- <script src="http://libs.baidu.com/jquery/2.1.1/jquery.min.js" type="text/javascript"></script> -->
	<script>window.jQuery || document.write('<script src="js/jquery-1.11.0.min.js"><\/script>')</script>
	<script type="text/javascript">
        function searchToggle(obj, evt){
            var container = $(obj).closest('.search-wrapper');

            if(!container.hasClass('active')){
                  container.addClass('active');
                  evt.preventDefault();
            }
            else if(container.hasClass('active') && $(obj).closest('.input-holder').length == 0){
                  container.removeClass('active');
                  // clear input
                  container.find('.search-input').val('');
                  // clear and hide result container when we press close
                  container.find('.result-container').fadeOut(100, function(){$(this).empty();});
            }
        }

        function submitFn(obj, evt){
            value = $(obj).find('.search-input').val().trim();

            _html = "Yup yup! Your search text sounds like this: ";
            if(!value.length){
                _html = "Yup yup! Add some text friend :D";
            }
            else{
                _html += "<b>" + value + "</b>";
            }

            $(obj).find('.result-container').html('<span>' + _html + '</span>');
            $(obj).find('.result-container').fadeIn(100);

            evt.preventDefault();
        }
        
    </script> 
</body>
</html>