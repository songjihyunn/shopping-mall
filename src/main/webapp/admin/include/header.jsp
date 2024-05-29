<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.text.DecimalFormat" %>
<%
//오늘 날짜
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
<%-- 세션 아이디 : ${sessionScope.id } || <%=(String)session.getAttribute("id") %><br>	<!-- EL언어 -->
세션 이름 : ${sessionScope.name } || <%=(String)session.getAttribute("name") %><br>
세션 레벨 : ${sessionScope.level } || <%=(String)session.getAttribute("level") %><br>
session_cart : <%=session_cart %> || ${sessionScope.cart } --%>

<c:if test="${sessionScope.level != '10' }">
	<script>
		alert("관리자 영역입니다.");
		location.href="/";
	</script>
</c:if>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자</title>
<link rel="stylesheet" href="/admin/css/basic.css">
<link rel="stylesheet" href="swiper.min.css">
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.4.1.min.js"></script>

</head>
<body>

 <hr>