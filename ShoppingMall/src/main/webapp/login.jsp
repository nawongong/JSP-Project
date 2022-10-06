<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<link rel="stylesheet" href="resource/css/style.css" type="text/css">
<script src="resource/js/jquery-1.10.2.js"></script>
<style>
	footer{	
		height:85%;
	}
</style>
</head>
<body>
	<%@ include file="header.jsp" %>
	<!-- 로그인 폼 -->
	<section id="login">
		<div id="login_wrap">
			<div id="login_con">
				<div class="login_txt">
					<h1 class="login_title">로그인</h1>
				</div>
				<form id="login_form" action="sp?action=login" method="POST">
					<div class="login_input_txt">
						<input type="text" id="id" name="id" placeholder="아이디" required><br>
						<input type="password" id="pw" name="pw" placeholder="비밀번호" required>
					</div>
					<div class="login_checkbox">
						<input type="checkbox" id="remember_id" name="remember_id">
						<label for="remember_id">아이디 저장</label><br>
						<input type="hidden" id="remember_id_chk" name="remember_id_chk" value="false">
					</div>
					<input type="submit" id="login_btn" name="login_btn" value="로그인">
				</form>
				<div class="login_util_btn">
					<ul>
						<li><a href="#">아이디/비밀번호를 잊으셨나요?</a></li>
						<li><a href="register.jsp">회원이 아니신가요?</a></li>
					</ul>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="footer.jsp" %>
</body>
<script>
	
	var search_img = document.getElementById("search_img");
	var basket_img = document.getElementById("basket_img");
	var sub_menu = document.querySelectorAll("#sub_menu");
	var re_id = "${id}";
	
	
	$("#id").val(re_id);
	if(re_id!=""){
		$("#remember_id").prop("checked", true);
	}else{
		$("#remember_id").prop("checked", false);
	}
	$("#all_con a").css({"color":"#000"});
    search_img.src = "resource/img/search_black.png";
    basket_img.src = "resource/img/basket_black.png";
    $("#all_con").css({"height":"100px", "background-color":"#fff"});
    
	// 메뉴 영역 hover시 서브 메뉴 내려오게
	$(function(){
	    for(var i=0; i<sub_menu.length; i++){
	        sub_menu[i].style.display = "none";
	    }
	    $("#all_con").hover(function(){
	        $(this).parent().find(sub_menu).slideDown(300);
	        $("#all_con").css({"height":"300px", "background-color":"#fff"});
	        
	        $(this).hover(function(){
	        }, function(){
	            $(this).parent().find(sub_menu).slideUp(300);
	            $("#all_con a").css({"color":"#000"});
                search_img.src = "resource/img/search_black.png";
                basket_img.src = "resource/img/basket_black.png";
                $("#all_con").css({"height":"100px", "background-color":"#fff"});
	        });
	    });
	});
	
	$("#remember_id").click(function(){
		if($(this).is(":checked")){
			$("#remember_id_chk").val("true");
		}else{
			$("#remember_id_chk").val("false");
		}
	});
	


</script>
</html>