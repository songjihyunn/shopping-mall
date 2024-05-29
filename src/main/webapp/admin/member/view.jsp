<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/admin/include/header_popup.jsp" %>

<table width=100% height=50 border=0>
	<tr>
		<td align=center style="color:#777;font-size:14px;font-weight:bold;">[회원정보]</td>
	</tr>
</table>

<center>
<table width="500" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td colspan=2 height=30 style="color:#4b8b99;font-size:13px;font-weight:bold;">사이트 이용정보 입력</td>
	</tr>
	<tr><td colspan=2 height=1 bgcolor=e9e9e9></td></tr>
	<tr>
		<td width=100 height=26><b>아이디</b></td>
		<td>${m.id }</td>
	</tr>
	<tr><td colspan=2 height=1 bgcolor=e9e9e9></td></tr>
	<tr>
		<td height=26><b>비밀번호</b></td>
		<td>${m.pass }</td>
	</tr>
	<tr><td colspan=2 height=1 bgcolor=e9e9e9></td></tr>
	<tr><td colspan=2 height=15></td></tr>
	<tr>
		<td colspan=2 height=30 style="color:#4b8b99;font-size:13px;font-weight:bold;">개인정보 입력</td>
	</tr>
	<tr><td colspan=2 height=1 bgcolor=e9e9e9></td></tr>
	<tr>
		<td height=26><b>이름</b></td>
		<td>${m.name }</td>
	</tr>
	<tr><td colspan=2 height=1 bgcolor=e9e9e9></td></tr>	        
	<tr>
		<td height=26><b>E-mail</b></td>
		<td>${m.email }</td>
	</tr>
	<tr><td colspan=2 height=1 bgcolor=e9e9e9></td></tr>
	<tr>
		<td height=26><b>나이</b></td>
		<td>${m.age }</td>
	</tr>
	<tr><td colspan=2 height=1 bgcolor=e9e9e9></td></tr>
	<tr>
		<td height=26><b>성별</b></td>
		<td>
			<c:choose>
				<c:when test="${m.gender == 'F' }">여자</c:when>
				<c:otherwise>남자</c:otherwise>
			</c:choose>
		</td>
	</tr>
	<tr><td colspan=2 height=1 bgcolor=e9e9e9></td></tr>
	<tr>
		<td height=48><b>자기소개</b></td>
		<td style="padding:4px 0px">
			<% pageContext.setAttribute("PKT", "\n"); //개행처리 %>
			${fn:replace(m.memo, PKT, "<br>") }
		</td>
	</tr>
	<tr><td colspan=2 height=1 bgcolor=e9e9e9></td></tr>
	<tr>
		<td height=26><b>상태</b></td>
		<td>${m.status }</td>
	</tr>
	<tr><td colspan=2 height=1 bgcolor=e9e9e9></td></tr>
	<tr>
		<td height=26><b>가입날짜</b></td>
		<td>${m.signdate }</td>
	</tr>
	<tr><td colspan=2 height=1 bgcolor=e9e9e9></td></tr>
</table>
<br>
<table widtd="96%" border="0" cellpadding="0" cellspacing="0" align=center>
	<tr>
		<td><button onclick="popup_close()">창 닫기</button></td>
	</tr>
</table>
</center>

<script>
function popup_close(){
	self.close();
}
</script>