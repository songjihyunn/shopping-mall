<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix= "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.text.DecimalFormat" %>
<%
java.util.Date today3 = new java.util.Date();
SimpleDateFormat cal3 = new SimpleDateFormat("yyyyMMddHHmmss");
String signdate3 = cal3.format(today3);

String session_id = (String)session.getAttribute("id");
String str3 = signdate3 + "_" + (String)session.getAttribute("id"); //날짜 + 아이디
String session_cart = (String)session.getAttribute("cart");
if(session_id != null && session_cart == null){ //장바구니 세션 값이 없다면
	session.setAttribute("cart", str3);
}
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Expires" content="-1">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="No-Cache">
<meta charset="UTF-8">
<title>헤더</title>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.4.1.min.js"></script>
<link rel="stylesheet" href="/css/basic.css">
</head>
<body>
<div style="width: 100%; height: 73px; position: relative; background: #1A1919; border-bottom: 1px rgba(102, 102, 102, 0.25) solid; margin: 0 auto;">
  <div onclick="location.href='/'" style="margin-left: 40px; color: white; width: 74px; height: 74px;color: white;curosor: pointer;font-size: 25px;font-weight: bold;">
	    	Chic Boutique
	    </div>
  <div style="left: 200px; top: 29px; position: absolute; justify-content: flex-start; align-items: flex-end; gap: 40px; display: inline-flex; margin: 0 auto;">
    <div style="color: #ffffff; font-size: 16px; font-family: Poppins; font-weight: 500; word-wrap: break-word; cursor:pointer;" onclick="location.href='/'">Home</div>
    <div style="color: #ffffff; font-size: 16px; font-family: Poppins; font-weight: 400; word-wrap: break-word; cursor:pointer;" onclick="location.href = '/bbs/list';">고객센터</div>
    <div style="color: #ffffff; font-size: 16px; font-family: Poppins; font-weight: 400; word-wrap: break-word; cursor:pointer;" onclick="location.href = '/item/sailing?product=10';">물품보기</div>
    
  </div>
  <div style="left: 70%; top: -50px; position: relative; justify-content: center; align-items: center; gap: 16px;">
  <c:choose>
    <c:when test="${sessionScope.id != null}">
    <c:if test="${sessionScope.level != '10' }">
    <!-- 로그아웃 -->
    <c:if test="${sessionScope.connecttype !='카카오' && sessionScope.connecttype !='네이버' }">
	    <div onclick="location.href='/member/logout'" style="width: 98px; height: 40px; left: 423px; top: 0px; position: absolute; background: black; border-radius: 8px; overflow: hidden; border: 1px white solid; cursor: pointer;">
	      <div style="left: 17px; top: 7.50px; position: absolute; justify-content: center; align-items: center; gap: 8px; display: inline-flex">
	        <div style="text-align: center; color: white; font-size: 16px; font-family: Poppins; font-weight: 400; word-wrap: break-word"> 로그아웃</div>
	      </div>
	    </div>
	</c:if>
    <!-- 카카오 -->
    <c:if test="${sessionScope.connecttype =='카카오' }">
	    <div onclick="kakaoLogout()"style="width: 98px; height: 40px; left: 423px; top: 0px; position: absolute; background: black; border-radius: 8px; overflow: hidden; border: 1px white solid; cursor: pointer;">
	      <div style="left: 17px; top: 7.50px; position: absolute; justify-content: center; align-items: center; gap: 8px; display: inline-flex">
	        <div style="text-align: center; color: white; font-size: 16px; font-family: Poppins; font-weight: 400; word-wrap: break-word">카카오</div>
	        <div style="text-align: center; color: white; font-size: 16px; font-family: Poppins; font-weight: 400; word-wrap: break-word">로그아웃</div>
	      </div>
	    </div>
	</c:if>
	<!-- 네이버 -->
	<c:if test="${sessionScope.connecttype =='네이버' }">
	    <div onclick="naverLogout()" style="width: 98px; height: 40px; left: 423px; top: 0px; position: absolute; background: black; border-radius: 8px; overflow: hidden; border: 1px white solid; cursor: pointer;">
	      <div style="left: 17px; top: 7.50px; position: absolute; justify-content: center; align-items: center; gap: 8px; display: inline-flex">
	        <div style="text-align: center; color: white; font-size: 16px; font-family: Poppins; font-weight: 400; word-wrap: break-word">네이버</div>
	        <div style="text-align: center; color: white; font-size: 16px; font-family: Poppins; font-weight: 400; word-wrap: break-word">로그아웃</div>
	      </div>
	    </div>
	</c:if>
	    <!-- 주문내역 -->
	    <div onclick="location.href='/order/list'" style="width: 98px; height: 40px; left: 306px; top: 0px; position: absolute; background: white; border-radius: 8px; overflow: hidden; border: 1px #111111 solid; cursor: pointer;">
	      <div style="left: 17px; top: 7.50px; position: absolute; justify-content: center; align-items: center; gap: 8px; display: inline-flex">
	        <div style="text-align: center; color: black; font-size: 16px; font-family: Poppins; font-weight: 400; word-wrap: break-word"> 주문내역</div>
	      </div>
	    </div>
	    <!-- 회원수정 -->
	    <div onclick="location.href='/member/modify'" style="background-color: white; width: 98px; height: 40px; left: 72px; top: 0px; position: absolute; border-radius: 8px; overflow: hidden; border: 1px #111111 solid; cursor: pointer;">
	      <div style="left: 19.50px; top: 7.50px; position: absolute; justify-content: center; align-items: center; gap: 8px; display: inline-flex">
	        <div style="text-align: center; color: black; font-size: 16px; font-family: Poppins; font-weight: 400; word-wrap: break-word">회원수정</div>
	      </div>
	    </div>
	    <!-- 장바구니 -->
	    <div onclick="location.href='/cart/list'"style="background-color: white; width: 98px; height: 40px; left: 189px; top: 0px; position: absolute; border-radius: 8px; overflow: hidden; border: 1px #111111 solid; cursor: pointer;">
	      <div style="left: 17px; top: 7.50px; position: absolute; justify-content: center; align-items: center; gap: 8px; display: inline-flex">
	        <div style="text-align: center; color: black; font-size: 16px; font-family: Poppins; font-weight: 400; word-wrap: break-word"> 장바구니</div>
	      </div>
	    </div>
    </c:if>
   	</c:when>
   	<c:otherwise>
   		<!-- 로그인 -->
   		<div onclick="location.href='/member/login'" style="width: 98px; height: 40px; left: 423px; top: 0px; position: absolute; background: black; border-radius: 8px; overflow: hidden; border: 1px white solid; cursor: pointer;">
	      <div style="left: 25px; top: 7.50px; position: absolute; justify-content: center; align-items: center; gap: 8px; display: inline-flex">
	        <div style="text-align: center; color: white; font-size: 16px; font-family: Poppins; font-weight: 400; word-wrap: break-word">로그인</div>
	      </div>
	    </div>
   		<!-- 회원가입 -->
   		<div onclick="location.href='/member/join'" style="width: 98px; height: 40px; left: 306px; top: 0px; position: absolute; background: white; border-radius: 8px; overflow: hidden; border: 1px #111111 solid; cursor: pointer;">
      		<div style="left: 17px; top: 7.50px; position: absolute; justify-content: center; align-items: center; gap: 8px; display: inline-flex">
        		<div style="text-align: center; color: #111111; font-size: 16px; font-family: Poppins; font-weight: 400; word-wrap: break-word"> 회원가입</div>
      		</div>
    	</div>
   	</c:otherwise>
   	</c:choose>
   	<c:if test="${sessionScope.level == '10' }">
   		<div onclick="location.href='/admin/'" style="width: 98px; height: 80px; left: 306px; top: 0px; position: absolute; border-radius: 8px; overflow: hidden;  cursor: pointer;">
      		<div class="menu-btn" style="left: 25px; top: 7.50px; position: absolute; justify-content: center; align-items: center; gap: 8px; display: inline-flex">
        		<div style="text-align: center; color: #ffffff; font-size: 16px; font-family: Poppins; font-weight: 400; word-wrap: break-word"><img src="/img/admin3.png" style="margin-bottom: 5px;"><br>관리자</div>
      			
      		</div>
      		
    	</div>
    	<!-- 로그아웃 -->
    	<c:if test="${sessionScope.connecttype !='카카오' && sessionScope.connecttype !='네이버' }">
	    <div onclick="location.href='/member/logout'" style="width: 98px; height: 40px; left: 423px; top: 0px; position: absolute; background: black; border-radius: 8px; overflow: hidden; border: 1px white solid; cursor: pointer;">
	      <div style="left: 17px; top: 7.50px; position: absolute; justify-content: center; align-items: center; gap: 8px; display: inline-flex">
	        <div style="text-align: center; color: white; font-size: 16px; font-family: Poppins; font-weight: 400; word-wrap: break-word"> 로그아웃</div>
	      </div>
	    </div>
	</c:if>
    </c:if>
  </div>
</div>
</body>
<!-- 네이버 스크립트 -->
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<script>
// 로그인 페이지 활성
var naverLogin = new naver.LoginWithNaverId(
	{
		clientId: "1bYKfvW_59UoGBrvr2YD", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
		callbackUrl: "http://localhost:8081/member/naverLogin", // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
		isPopup: false,
		callbackHandle: true
	}
);	
naverLogin.init();
</script>
<script>
// 로그아웃
function openPopUp() {
	testPopUp= window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
}
function closePopUp(){
	location.href="/member/logout";
	testPopUp.close();
}
function naverLogout() {
	openPopUp();
	setTimeout(function() {
		closePopUp();
	}, 1000);
}

</script>
<!-- 카카오 스크립트 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
Kakao.init('bb0f74f0c73da48463149dd16f9d9cca'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단

//카카오로그아웃  
function kakaoLogout() {
	if (Kakao.Auth.getAccessToken()) {
		Kakao.API.request({
			url: '/v1/user/unlink',
			success: function (response) {
				console.log(response);

				//로그아웃 세션 삭제후 첫 페이지 이동
				$.ajax({
					url: "/member/kakaoLogout",
					type: "get",
					dataType: "text",
					success:function(num){
						console.log(num);
						//if(num == 'kakaoLogout'){
							location.href="/";
						//}
					}
				});
			},
			fail: function (error) {
				console.log(error);
			},			
		})
		Kakao.Auth.setAccessToken(undefined);		
	}
}
</script>
</html>