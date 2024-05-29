<%@page import="java.util.ArrayList"%>
<%@page import="dto.Member"%>
<%@page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="aaa" value="111" />
<c:set var="bbb" value="111" />
<c:out value="${aaa }" />
${aaa }<br>
${aaa ne bbb }<br>

<c:remove var="aaa"/>
aaa : ${aaa }<br>

<c:catch var="err">
	${10/0 }
</c:catch>

${err }
<hr>
<c:if test="${5 > 10 }">
	참이다.
</c:if>
<c:choose>
	<c:when test="${5 > 10 }">
		참이다.
	</c:when>
	<c:when test="${5 > 10 }">
		참이다.
	</c:when>
	<c:otherwise>
		거짓이다.
	</c:otherwise>
</c:choose>
<hr>
<c:forEach var="test" begin="1" end="10">
	${test }<br>
</c:forEach>
<hr>
<c:forTokens var="abc" items="a,b,c,d,e" delims="," varStatus="status">
	${abc } , ${status.count } , ${status.index }<br>
</c:forTokens>
<hr>
<c:set var="bb" value="변관우,권규만,김종철" />
<c:forTokens var="names" items="${bb }" delims=",">
	${names }<br>
</c:forTokens>
<hr>
id,pass 변수를 만들어 값을 넣은후 el로 전달해보자.
<c:set var="id" value="1111"></c:set>
<c:set var="pass" value="2222" />
<a href="list?id=${id }&pass=${pass}">페이지이동</a>

<%
LinkedList<Integer> lists = new LinkedList<>();
//Vector<String> lists = new Vector<>();
//ArrayList<String> lists = new ArrayList<>();
lists.add(1);
lists.add(2);
lists.add(3);
%>
<c:set var="lists" value="<%=lists %>" />
<c:forEach var="a" items="${lists }">
	${a }<br>
</c:forEach>
</body>
</html>











