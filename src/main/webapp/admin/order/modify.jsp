<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/include/header_popup.jsp" %>

<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f5f5f5;
        color: #333;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
    }
    .container {
        background-color: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        width: 600px;
    }
    h2 {
        color: #4b8b99;
        font-size: 24px;
        text-align: center;
        margin-bottom: 20px;
    }
    table {
        width: 100%;
        border-collapse: collapse;
    }
    td {
        padding: 12px 20px;
        border-bottom: 1px solid #ddd;
    }
    td:first-child {
        font-weight: bold;
        width: 30%;
        font-size: 16px;
    }
    td img {
        max-width: 150px;
        max-height: 150px;
    }
    button {
        padding: 12px 24px;
        border: none;
        background-color: #1A1919;
        color: #fff;
        font-size: 16px;
        border-radius: 4px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }
    button:hover {
        background-color: #484747;
    }
</style>

<div class="container">
    <h2>주문상세</h2>
    <form method="post">
		<table width="500" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td colspan=2 height=30 style="color:#4b8b99;font-size:13px;font-weight:bold;">개인정보</td>
			</tr>
			<tr>
				<td width="50%" height=26><b>이름</b></td>
				<td>
					<input type="text" name="mb_name" value="${o.mb_name }" required style="height:18px;width:50%;border:1px solid #e9e9e9;background:#f7f7f7;">
				</td>
			</tr>
			<tr>
				<td height=26><b>아이디</b></td>
				<td><input type="text" name="mb_id"  value="${o.mb_id }" style="height:18px;width:50%;border:1px solid #e9e9e9;background:#f7f7f7;"></td>
			</tr>
			<tr>
				<td colspan=2 height=30 style="color:#4b8b99;font-size:13px;font-weight:bold;">주문수정</td>
			</tr>
			<tr>
				<td height=26><b>상품명</b></td>
				<td><input name="od_name" value="${o.od_name }" style="height:18px;width:96%;border:1px solid #e9e9e9;background:#f7f7f7;"></td>
			</tr>
			<%-- <tr>
				<td height=26><b>상품 이미지</b></td>
				<td>
					<input name="od_image" value="${o.od_image }" style="height:18px;width:96%;border:1px solid #e9e9e9;background:#f7f7f7;">
					<img src="${o.od_image}" alt="Order Image">
				</td>
			</tr> --%>
			<tr>
				<td height=26><b>상품사이즈</b></td>
				<td><input name="od_option" value="${o.it_size }" style="height:18px;width:50%;border:1px solid #e9e9e9;background:#f7f7f7;"></td>
			</tr>
			<tr>
				<td height=26><b>상품포인트</b></td>
				<td><input name="od_option" value="${o.it_point }" style="height:18px;width:50%;border:1px solid #e9e9e9;background:#f7f7f7;"></td>
			</tr>
			<tr><td colspan=2 height=15></td></tr>
			<tr>
				<td colspan=2 height=30 style="color:#4b8b99;font-size:13px;font-weight:bold;">주문정보</td>
			</tr>
			<tr>
				<td height=26><b>주문일자</b></td>
				<td><input name="od_date" value="${o.od_date }" style="height:18px;width:50%;border:1px solid #e9e9e9;background:#f7f7f7;"></td>
			</tr>
			<tr>
				<td height=26><b>주문번호</b></td>
				<td><input name="od_id" value="${o.od_id }" style="height:18px;width:50%;border:1px solid #e9e9e9;background:#f7f7f7;"></td>
			</tr>
			<tr>
				<td height=26><b>주문금액</b></td>
				<td><input name="od_price" value="${o.od_price }" style="height:18px;width:50%;border:1px solid #e9e9e9;background:#f7f7f7;"></td>
			</tr>
			<tr>
				<td height=26><b>주문상태</b></td>
				<td>
					<input type="radio" name="ct_status" value="준비" <c:if test="${o.ct_status == '준비' }">checked</c:if>>준비
					<input type="radio" name="ct_status" value="주문" <c:if test="${o.ct_status == '주문' }">checked</c:if>>주문
					<input type="radio" name="ct_status" value="배송" <c:if test="${o.ct_status == '배송' }">checked</c:if>>배송
					<input type="radio" name="ct_status" value="완료" <c:if test="${o.ct_status == '완료' }">checked</c:if>>완료
				</td>
			</tr>
			<tr>
				<td><button type="submit">주문 수정</button></td>
			</tr>
		</table>
	</form>
</div>

<script>
    function popup_close(){
        self.close();
    }
</script>
</body>
</html>

