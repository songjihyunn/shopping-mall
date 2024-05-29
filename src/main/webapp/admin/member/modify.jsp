<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/admin/include/header_popup.jsp" %>

<table width=100% height=50 border=0>
	<tr>
		<td align=center style="color:#777;font-size:14px;font-weight:bold;">[회원수정]</td>
	</tr>
</table>

<center>
<form method="post">
<table width="500" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td colspan=2 height=30 style="color:#4b8b99;font-size:13px;font-weight:bold;">사이트 이용정보 입력</td>
	</tr>
	<tr><td colspan=2 height=1 bgcolor=e9e9e9></td></tr>
	<tr>
		<td width=100 height=26><b>아이디</b></td>
		<td>
			<input type="text" name="mb_id" value="${m.id }" required style="height:18px;width:50%;border:1px solid #e9e9e9;background:#f7f7f7;">
		</td>
	</tr>
	<tr><td colspan=2 height=1 bgcolor=e9e9e9></td></tr>
	<tr>
		<td height=26><b>비밀번호</b></td>
		<td><input type="password" name="mb_pass" style="height:18px;width:50%;border:1px solid #e9e9e9;background:#f7f7f7;"></td>
	</tr>
	<tr><td colspan=2 height=1 bgcolor=e9e9e9></td></tr>
	<tr><td colspan=2 height=15></td></tr>
	<tr>
		<td colspan=2 height=30 style="color:#4b8b99;font-size:13px;font-weight:bold;">개인정보 입력</td>
	</tr>
	<tr><td colspan=2 height=1 bgcolor=e9e9e9></td></tr>
	<tr>
		<td height=26><b>이름</b></td>
		<td><input name="mb_name" value="${m.name }" style="height:18px;width:50%;border:1px solid #e9e9e9;background:#f7f7f7;"></td>
	</tr>
	<tr><td colspan=2 height=1 bgcolor=e9e9e9></td></tr>	        
	<tr>
		<td height=26><b>E-mail</b></td>
		<td><input type="email" name="mb_email" value="${m.email }" style="height:18px;width:96%;border:1px solid #e9e9e9;background:#f7f7f7;"></td>
	</tr>
	<tr><td colspan=2 height=1 bgcolor=e9e9e9></td></tr>
	<tr>
		<td height=26><b>나이</b></td>
		<td><input type="number" name="mb_age" value="${m.age }" style="height:18px;width:10%;border:1px solid #e9e9e9;background:#f7f7f7;"></td>
	</tr>
	<tr><td colspan=2 height=1 bgcolor=e9e9e9></td></tr>
	<tr>
		<td height=26><b>성별</b></td>
		<td>
			<input type="radio" name="mb_gender" value="F" <c:if test="${m.gender == 'F' }">checked</c:if>>여자
			<input type="radio" name="mb_gender" value="M" <c:if test="${m.gender == 'M' }">checked</c:if>>남자
		</td>
	</tr>
	<tr>
		<td height=26><b>레벨</b></td>
		<td>
			<select name="mb_level">
				<c:forEach var="num" begin="1" end="10">
					<option value="${num }" <c:if test="${m.level == num }">selected</c:if>>${num }</option>
				</c:forEach>
			</select>
		</td>
	</tr>
	<tr><td colspan=2 height=1 bgcolor=e9e9e9></td></tr>
	<tr>
		<td height=48><b>자기소개</b></td>
		<td><textarea name="mb_memo" style="height:40px;width:96%;border:1px solid #e9e9e9;background:#f7f7f7;">${m.memo }</textarea></td>
	</tr>
	<tr><td colspan=2 height=1 bgcolor=e9e9e9></td></tr>
	<tr>
		<td height=26><b>상태</b></td>
		<td>
			<input type="radio" name="mb_status" value="정상" <c:if test="${m.status == '정상' }">checked</c:if>>정상
			<input type="radio" name="mb_status" value="정지" <c:if test="${m.status == '정지' }">checked</c:if>>정지
			<input type="radio" name="mb_status" value="탈퇴" <c:if test="${m.status == '탈퇴' }">checked</c:if>>탈퇴
		</td>
	</tr>
	<tr><td colspan=2 height=1 bgcolor=e9e9e9></td></tr>
	<tr>
		<td height=26><b>가입날짜</b></td>
		<td><input name="mb_signdate" value="${m.signdate }" style="height:18px;width:50%;border:1px solid #e9e9e9;background:#f7f7f7;"></td>
	</tr>
	<tr><td colspan=2 height=1 bgcolor=e9e9e9></td></tr>
</table>
<br>
<table widtd="96%" border="0" align=center>
	<tr>
		<td><button>회원수정</button></td>
	</tr>
</table>
<br>
</form>
</center>
</body>
</html>