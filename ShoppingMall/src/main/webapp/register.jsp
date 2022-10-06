<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>register</title>
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
	<!-- 회원가입 폼 -->
	<section id="register">
		<div id="register_wrap">
			<div id="register_con">
				<div class="register_txt">
					<h1 class="register_title">회원가입</h1>
				</div>
				<form id="register_form" action="sp?action=register" method="POST">
					<table id="register_table">
						<tr>
							<td style="width:30%">아이디</td>
							<td style="width:70%">
								<input type="text" id="id" name="id" required>
								<span id="id_check"></span>
								<input type="hidden" id="chk_id" name="chk_id">
							</td>
						</tr>
						<tr>
							<td style="width:30%">비밀번호</td>
							<td style="width:70%"><input type="password" id="pw" name="pw" required></td>
						</tr>
						<tr>
							<td style="width:30%">비밀번호 확인</td>
							<td style="width:70%">
								<input type="password" id="pwc" name="pwc" required>
								<span id="pw_check"></p>
							</td>
						</tr>
						<tr>
							<td style="width:30%">이름</td>
							<td style="width:70%"><input type="text" id="name" name="name" required></td>
						</tr>
						<tr>
							<td style="width:30%">이메일</td>
							<td style="width:70%"><input type="text" id="email" name="email" required></td>
						</tr>
						<tr>
							<td style="width:30%">전화번호</td>
							<td style="width:70%"><input type="text" id="tel" name="tel" required></td>
						</tr>
					</table>
					<div id="register_btn">
						<input type="reset" value="취소" id="register_cancel">
						<input type="submit" value="회원가입" id="register_confirm">
					</div>	
				</form>
			</div>
		</div>
	</section>
	<%@ include file="footer.jsp" %>
</body>
<script>
	var search_img = document.getElementById("search_img");
	var basket_img = document.getElementById("basket_img");
	var sub_menu = document.querySelectorAll("#sub_menu");
	
	$("#chk_id").val("false");
	$("#all_con a").css({"color":"#000"});
	$("#all_con").css({"height":"100px", "background-color":"#fff"});
    search_img.src = "resource/img/search_black.png";
    basket_img.src = "resource/img/basket_black.png";
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
	            $("#all_con").css({"height":"100px", "background-color":"#fff"});
                search_img.src = "resource/img/search_black.png";
                basket_img.src = "resource/img/basket_black.png";
	            
	        });
	    });
	});


	var pw;
	var pwc;
	$("#pw").on("propertychange change keyup paste input", function(){
		pw = $(this).val();
	});
	$("#pwc").on("propertychange change keyup paste input", function(){
		pwc = $(this).val();
		if(pw!=pwc){
			$("#pw_check").text("비밀번호를 확인해주세요.");
			$("#pw_check").css("color","red");
		}else{
			$("#pw_check").text("");
		}
	});
	
	// 아이디 중복확인
	var id;
	$("#id").on("propertychange change keyup paste input", function(){
		id = $(this).val();
		$.ajax({
			url:"sp",
			data:{id:id, action:"idCheck"},
			dataType:"json",
			type:"POST",
			success:function(result){
				if(result==0){
					$("#id_check").text("사용할 수 없는 아이디입니다.");
					$("#id_check").css("color","red");
					$("#chk_id").val("false");
				}
				if(result==1){
					$("#id_check").text("사용할 수 있는 아이디입니다.");
					$("#id_check").css("color","#000");
					$("#chk_id").val("true");
				}
			}
					
		});
	});
</script>
</html>