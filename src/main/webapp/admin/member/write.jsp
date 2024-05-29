<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/admin/include/header.jsp" %>

<script>
$(document).ready(function(){
	$("#mb_id").keyup(function(event){		
		if (!(event.keyCode >=37 && event.keyCode<=40)) {
			$(this).val($(this).val().replace(/[^_a-z0-9]/gi,"")); //_(underscore), 영어, 숫자만 가능
		}

		$.ajax({
			url: "id_ok", //전송 페이지 경로
			type: "post", //데이터 전송 방식
			dataType: "text",
			data: "id="+$("#mb_id").val(),
			error:function(){ //실패일 경우
				alert("실패");
			},
			success:function(num){ //성공일 경우
				if(num == "4") {
					msg = "<font color=red>아이디는 4자 이상으로 입력하세요.</font>";
				}else if(num == 1) {
					msg = "<font color=red>이미 존재하는 아이디입니다.</font>";
				}else if(num == 0) {
					msg = "<font color=blue>사용 가능한 아이디입니다.</font>";
				}
				$("#id_result").html(msg);
			}
		});
	});
});

function id_select(str){
	$.ajax({
		url: "id_ok", //전송 페이지 경로
		type: "post", //데이터 전송 방식
		dataType: "text",
		data: "id="+str,
		error:function(){ //실패일 경우
			alert("실패");
		},
		success:function(num){ //성공일 경우
			if(num == "4") {
				msg = "<font color=red>아이디는 4자 이상으로 입력하세요.</font>";
			}else if(num == 1) {
				msg = "<font color=red>이미 존재하는 아이디입니다.</font>";
			}else if(num == 0) {
				msg = "<font color=blue>사용 가능한 아이디입니다.</font>";
			}
			$("#id_result").html(msg);
		}
	});
}
</script>

<table width=100% height=50 border=0>
	<tr>
		<td align=center style="color:#777;font-size:14px;font-weight:bold;">[회원가입]</td>
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
			<input type="text" id="mb_id" name="mb_id" required style="height:18px;width:50%;border:1px solid #e9e9e9;background:#f7f7f7;">
			<span onclick="id_select(mb_id.value)" style="cursor:pointer">[중복확인]</span>
			<div id="id_result"></div>
		</td>
	</tr>
	<tr><td colspan=2 height=1 bgcolor=e9e9e9></td></tr>
	<tr>
		<td height=26><b>비밀번호</b></td>
		<td><input type="password" name="mb_pass" required style="height:18px;width:50%;border:1px solid #e9e9e9;background:#f7f7f7;"></td>
	</tr>
	<tr><td colspan=2 height=1 bgcolor=e9e9e9></td></tr>
	<tr><td colspan=2 height=15></td></tr>
	<tr>
		<td colspan=2 height=30 style="color:#4b8b99;font-size:13px;font-weight:bold;">개인정보 입력</td>
	</tr>
	<tr><td colspan=2 height=1 bgcolor=e9e9e9></td></tr>
	<tr>
		<td height=26><b>이름</b></td>
		<td><input name="mb_name" required style="height:18px;width:50%;border:1px solid #e9e9e9;background:#f7f7f7;"></td>
	</tr>
	<tr><td colspan=2 height=1 bgcolor=e9e9e9></td></tr>	        
	<tr>
		<td height=26><b>E-mail</b></td>
		<td><input type="email" name="mb_email" required style="height:18px;width:96%;border:1px solid #e9e9e9;background:#f7f7f7;"></td>
	</tr>
	<tr><td colspan=2 height=1 bgcolor=e9e9e9></td></tr>
	<tr>
		<td height=26><b>나이</b></td>
		<td><input type="number" name="mb_age" required style="height:18px;width:10%;border:1px solid #e9e9e9;background:#f7f7f7;"></td>
	</tr>
	<tr><td colspan=2 height=1 bgcolor=e9e9e9></td></tr>
	<tr>
		<td height=26><b>성별</b></td>
		<td>
			<input type="radio" name="mb_gender" value="F" checked>여자
			<input type="radio" name="mb_gender" value="M" >남자
		</td>
	</tr>
	<tr>
		<td height=26><b>레벨</b></td>
		<td>
			<select name="mb_level">
				<c:forEach var="num" begin="1" end="10">
					<option value="${num }">${num }</option>
				</c:forEach>
			</select>
		</td>
	</tr>
	<tr><td colspan=2 height=1 bgcolor=e9e9e9></td></tr>
	<tr>
		<td height=48><b>자기소개</b></td>
		<td><textarea name="mb_memo" style="height:40px;width:96%;border:1px solid #e9e9e9;background:#f7f7f7;"></textarea></td>
	</tr>
	<tr><td colspan=2 height=1 bgcolor=e9e9e9></td></tr>
</table>
<br>
<table widtd="96%" border="0" align=center>
	<tr>
		<td><button>회원가입</button></td>
	</tr>
</table>
<br>
</form>
</center>

<%@ include file="/admin/include/footer.jsp" %>