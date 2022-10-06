<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
</head>
<body>
	<!-- 메뉴 -->
    <div id="all_con">
        <div id="wrap">
            <nav>
                <div id="gnb_left">
                    <h1 class="logo"><a href="index.jsp">NSP</a></h1>
                    <ul id="menu">
                        <li><a href="#">ABOUT
                            <ul id="sub_menu">
                                <li><a href="#">ABOUT US</a></li>
                                <li><a href="#">NEWS</a></li>
                            </ul>
                        </a></li>
                        <li><a href="#">CATEGORY
                            <ul id="sub_menu">
                                <li><a href="#">ALL</a></li>
                                <li><a href="#">OUTER</a></li>
                                <li><a href="#">TOP</a></li>
                                <li><a href="#">BOTTOM</a></li>
                                <li><a href="#">ACC</a></li>
                                <li><a href="#">SUIT</a></li>
                            </ul>
                        </a></li>
                        <li><a href="#">EVENT
                            <ul id="sub_menu">
                                <li><a href="#">PROMOTION</a></li>
                            </ul>
                        </a></li>
                        <li><a href="#">STORE
                            <ul id="sub_menu">
                                <li><a href="#">매장찾기</a></li>
                                <li><a href="#">매장개설안내</a></li>
                            </ul>
                        </a></li>
                    </ul>
                </div>
                <div id="gnb_right">
                    <ul class="util">
		                <c:choose>
							<c:when test="${login eq 'OK'}"> 
							  <li><a href="sp?action=logout">LOGOUT</a></li>				
							</c:when>
							<c:otherwise>
							  <li><a href="login.jsp">LOGIN</a></li>
							  <li><a href="register.jsp">JOIN</a></li>
							</c:otherwise>				
						</c:choose>
                        <li><a href="#"><img id="search_img" src="resource/img/search_white.png"></a></li>
                        <li><a href="login.jsp"><img id="basket_img" src="resource/img/basket_white.png" alt="장바구니" title="장바구니"></a></li>
                    </ul>
                </div>
            </nav>
        </div>
    </div>
</body>
</html>