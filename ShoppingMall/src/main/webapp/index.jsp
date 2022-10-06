<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NSP</title>
<link rel="stylesheet" href="resource/css/style.css" type="text/css">
<script src="resource/js/jquery-1.10.2.js"></script>
</head>
<body>
	<body>
    <button id="up_click">↑</button>
    <!-- 헤더 -->
    <header>
        <div id="img_num">
            <div id="img_num_con">
                <button id="prev_btn" onclick="slide(0)">&lt</button>
                <button id="next_btn" onclick="slide(1)">&gt</button>
                <div id="num_count">
                    <span id="change_num">1</span>
                    <span>/</span>
                    <span id="all_num">3</span>
                </div>
            </div>
        </div>
    </header>
    <%@ include file="header.jsp" %>
    <!-- best 영역 -->
    <section id="best_section">
        <div id="wrap">
            <section class="best_con">
                <div id="best_img_con">
                	<img src="resource/img/b1.jpg">
                	<div id="best_img_txt">
                		<h1>Weekly Best</h1>
                		<ul id="best_img_list1">
                			<li><a href="#">ALL</a></li>
                            <li><a href="#">OUTER</a></li>
                            <li><a href="#">TOP</a></li>
                            <li><a href="#">ALL</a></li>
	                    	<li><a href="#">OUTER</a></li>
	                    	<li><a href="#">TOP</a></li>
                		</ul>
                	</div>
                </div>
            </section>
        </div>
    </section>
    <section id="best_section">
        <div id="wrap">
            <section class="best_con">

            </section>
        </div>
    </section>
    <!-- new 영역-->
    <section id="new_section">
        <div id="wrap">
            <section class="new_con">
            	<div id="new_img_con">
            		<img src="resource/img/n1.jpg">
            		<div id="new_img_txt">
                		<h1>NEW PRODUCT</h1>
                		<ul id="new_img_list1">
                			<li><a href="#">ALL</a></li>
                            <li><a href="#">OUTER</a></li>
                            <li><a href="#">TOP</a></li>
                            <li><a href="#">ALL</a></li>
	                    	<li><a href="#">OUTER</a></li>
	                    	<li><a href="#">TOP</a></li>
                		</ul>
                	</div>
            	</div>
            </section>
        </div>
    </section>
    <section id="new_section">
        <div id="wrap">
            <section class="new_con">
            	
            </section>
        </div>
    </section>
    <%@ include file="footer.jsp" %>
</body>
<script>
    
    // 기본이벤트 제거
    window.addEventListener("wheel", function(e){
        e.preventDefault();
    },{passive : false});

    var html = $("html");
    var page = 1;
    html.animate({scrollTop:0},10);
    // 마우스 휠 이벤트
    $(window).on("wheel", function(e){
        if(html.is(":animated")) return;
        if(e.originalEvent.deltaY > 0){
            if(page==6) return;
            page++;
            // 초기화 
            if(page==1 || page==6){
                $("#all_con a").css({"color":"#fff"});
                $("#all_con").css("height","0px");
                search_img.src = "resource/img/search_white.png";
                basket_img.src = "resource/img/basket_white.png";
            }else{
                $("#all_con a").css({"color":"#000"});
                $("#all_con").css("height","0px");
                search_img.src = "resource/img/search_black.png";
                basket_img.src = "resource/img/basket_black.png";
            }
            // 위로가는 버튼 
            if(page!=1){
                $("#up_click").css("display", "block");
            }else{
                $("#up_click").css("display", "none");
            }
        }else if(e.originalEvent.deltaY < 0){
            if(page == 1) return;
            page--;
            // 초기화 
            if(page==1 || page==6){
                $("#all_con a").css({"color":"#fff"});
                $("#all_con").css("height","0px");
                search_img.src = "resource/img/search_white.png";
                basket_img.src = "resource/img/basket_white.png";
            }else{
                $("#all_con a").css({"color":"#000"});
                $("#all_con").css("height","0px");
                search_img.src = "resource/img/search_black.png";
                basket_img.src = "resource/img/basket_black.png";
            }
            // 위로가는 버튼 
            if(page!=1){
                $("#up_click").css("display", "block");
                
            }else{
                $("#up_click").css("display", "none");
            }
        }
        var posTop = (page-1) * $(window).height();
        // 화면이동 0.8s
        html.stop().animate({
            scrollTop : posTop},
            {
                duration:800, complete:function(){}
            });
        $("#up_click").click(function(){
            var firstTop = -page * $(window).height();
            page = 1;
            html.stop().animate({scrollTop: firstTop},
            {
                duration:2000, complete:function(){}
            });
            $("#up_click").css("display", "none");
            $("#all_con a").css({"color":"#fff"});
            $("#all_con").css("height","0px");
            search_img.src = "resource/img/search_white.png";
            basket_img.src = "resource/img/basket_white.png";
        });
    });

    var search_img = document.getElementById("search_img");
    var basket_img = document.getElementById("basket_img");
    var sub_menu = document.querySelectorAll("#sub_menu");
    // 메뉴 영역 hover시 서브 메뉴 내려오게
    $(function(){
        for(var i=0; i<sub_menu.length; i++){
            sub_menu[i].style.display = "none";
        }
        $("#all_con").hover(function(){
            $(this).parent().find(sub_menu).slideDown(300);
            if(page==1 || page==4){
                $("#all_con a").css({"color":"#000"});
                $("#all_con").css({"height":"300px", "background-color":"#fff"});
                search_img.src = "resource/img/search_black.png";
                basket_img.src = "resource/img/basket_black.png";
            }else{
                $("#all_con a").css({"color":"#000"});
                $("#all_con").css({"height":"300px", "background-color":"#fff"});
                search_img.src = "resource/img/search_black.png";
                basket_img.src = "resource/img/basket_black.png";
            }

            $(this).hover(function(){
            }, function(){
                $(this).parent().find(sub_menu).slideUp(300);
                if(page==1 || page==4){
                    $("#all_con a").css({"color":"#fff"});
                    $("#all_con").css("height","0px");
                    search_img.src = "resource/img/search_white.png";
                    basket_img.src = "resource/img/basket_white.png";
                }else{
                    $("#all_con a").css({"color":"#000"});
                    $("#all_con").css("height","0px");
                    search_img.src = "resource/img/search_black.png";
                    basket_img.src = "resource/img/basket_black.png";
                }
                
            });
        });
    });

    var header = document.querySelector("header");
    var count = 1;
    // 비주얼 영역 버튼 클릭시 이미지 변경 
    function slide(n){
        console.log(n);
        console.log(count);
        if(count==1){
            switch(n){
                case 0:
                    header.style.backgroundImage = "url('resource/img/visual3.jpg')";
                    count=3;
                    break;
                case 1:
                    header.style.backgroundImage = "url('resource/img/visual2.jpg')";
                    count++;
                    break;
            }
            $("#change_num").text((count).toString());
        }else if(count==2){
            switch(n){
                case 0:
                    header.style.backgroundImage = "url('resource/img/visual1.jpg')";
                    count--;
                    break;
                case 1:
                    header.style.backgroundImage = "url('resource/img/visual3.jpg')";
                    count++;
                    break;
            }
            $("#change_num").text((count).toString());
        }else if(count==3){
            switch(n){
                case 0:
                    header.style.backgroundImage = "url('resource/img/visual2.jpg')";
                    count--;
                    break;
                case 1:
                    header.style.backgroundImage = "url('resource/img/visual1.jpg')";
                    count = 1;
                    break;
            }
            $("#change_num").text((count).toString());
        }
        header.animate([
            {opacity:0},
            {opacity:1}
        ],{
            duration:1000,
            iterations:1
        });
    }
    
</script>
</body>
</html>