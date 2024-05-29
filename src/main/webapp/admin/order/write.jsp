<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="/admin/include/header.jsp" %>


<table width=100% height=50 border=0>
	<tr>
		<td align=center style="color:#777;font-size:14px;font-weight:bold;">[주문 상세]
		<input type="text" name="ct_uid" value="${ct_uid}"></td>
	</tr>
</table>
<form action="write" method="post">
<table width="500" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td colspan=2 height=30 style="color:#4b8b99;font-size:13px;font-weight:bold;">개인정보</td>
	</tr>
	<tr><td colspan=2 height=1 bgcolor=e9e9e9></td></tr>
	<tr>
		<td width="50%" height=26><b>이름</b></td>
		<td>${i.mb_name }</td>
	</tr>
	<tr><td colspan=2 height=1 bgcolor=e9e9e9></td></tr>
	<tr>
		<td height=26><b>아이디</b></td>
		<td>${i.mb_id }</td>
	</tr>
	<tr><td colspan=2 height=1 bgcolor=e9e9e9></td></tr>
	<tr><td colspan=2 height=15></td></tr>
	<tr>
		<td colspan=2 height=30 style="color:#4b8b99;font-size:13px;font-weight:bold;">상품정보</td>
	</tr>
	<tr><td colspan=2 height=1 bgcolor=e9e9e9></td></tr>
	<tr>
		<td height=26><b>상품명</b></td>
		<td>${o.od_name }</td>
	</tr>
	<tr><td colspan=2 height=1 bgcolor=e9e9e9></td></tr>	        
	<tr>
		<td height=26><b>상품 이미지</b></td>
		<td>
			<img src="/upload_item/${i.file1 }" width=40>
		</td>
	</tr>
	<tr><td colspan=2 height=1 bgcolor=e9e9e9></td></tr>
	<tr>
		<td height=26><b>상품 사이즈</b></td>
		<td>${o.it_size }</td>
	</tr>
	<tr><td colspan=2 height=1 bgcolor=e9e9e9></td></tr>
	<tr>
		<td height=26><b>상품 포인트</b></td>
		<td>${i.it_point }</td>
	</tr>
	<tr><td colspan=2 height=1 bgcolor=e9e9e9></td></tr>
	<tr><td colspan=2 height=15></td></tr>
	<tr>
		<td colspan=2 height=30 style="color:#4b8b99;font-size:13px;font-weight:bold;">주문정보</td>
	</tr>
	<tr>
		<td height=26><b>주문일자</b></td>
		<td>${o.od_date }</td>
	</tr>
	<tr><td colspan=2 height=1 bgcolor=e9e9e9></td></tr>
	<tr>
		<td height=26><b>주문번호</b></td>
		<td>${o.od_id }</td>
	</tr>
	<tr><td colspan=2 height=1 bgcolor=e9e9e9></td></tr>
	<tr>
		<td height=26><b>주문금액</b></td>
		<td>${o.od_price }</td>
	</tr>
	<tr><td colspan=2 height=1 bgcolor=e9e9e9></td></tr>
	<tr>
		<td height=26><b>주문상태</b></td>
		<td>${o.ct_status}</td>
	</tr>
	<tr><td colspan=2 height=1 bgcolor=e9e9e9></td></tr>
</table>
</form>
</center>
<%-- <%@ include file="/admin/include/footer.jsp" %> --%>
