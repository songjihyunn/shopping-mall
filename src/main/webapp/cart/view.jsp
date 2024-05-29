<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/include/header2.jsp" %>
<style>
	  *{
	  	overflow-y: hidden;
	  }
    .container {
        background-color: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        width: 480px;
        overflow-y:hidden;
    }
    h2 {
        color: #777;
        font-size: 18px;
        text-align: center;
        margin-bottom: 20px;
    }
    table {
        width: 100%;
    }
    td {
        padding: 8px 0;
    }
    input[type="text"],
    input[type="number"],
    select,
    input[type="file"] {
        width: calc(100% - 10px);
        padding: 8px;
        margin: 0;
        border: 1px solid #ddd;
        border-radius: 4px;
    }
    input[type="radio"],
    input[type="checkbox"] {
        margin-right: 5px;
    }
    button {
        width: 100%;
        padding: 10px;
        border: none;
        background-color: #1A1919;
        color: #fff;
        font-size: 16px;
        border-radius: 4px;
        cursor: pointer;
    }
    button:hover {
        background-color: #484747;
    }
    .category-select {
        display: flex;
        gap: 10px;
    }
    .category-select select {
        flex: 1;
    }
    	.table-container {
    overflow: auto; /* 스크롤 가능하도록 설정 */
    width: 1800px;
}

/* 테이블 헤더 요소의 스타일 */
.table-container table thead th {
    position: sticky; /* 고정 위치 설정 */
    top: -50px; /* 상단 위치로 고정 */
}
</style>
<script>
function cate_2(cate){
	$.ajax({
		url: "category_ok", //전송받을 페이지 경로
		type: "post", //데이터 전송 방식
		dataType: "text",
		data: "ca_id="+cate,
		error:function(){ //실패일 경우
			alert("실패");
		},
		success:function(text){ //성공일 경우
			$("#category2_result").html(text);
		}
	});
}

function item_ok(){
	document.submit();
}
</script>
<div class="table-container" style="width: 1600px; height: 900px; overflow-y: hidden; position: absolute; background: white; display: flex; justify-content: right;">
    <div class="MainLayout" align="center" style="width: 900px; height: 100%; position: absolute; padding-left: 300px; padding-right: 45px; padding-top: 40px; padding-bottom: 40px; justify-content: flex-start; align-items: flex-start; gap: 45px; display: inline-flex;">
		<div class="container" style="top: 500px;">
		    <h2>결제하기</h2>
		  	<form method="post" action="/order/write">
				<input type="hidden" name="ct_uid" value="${c.ct_uid }">
				<input type="hidden" name="it_name" value="${c.it_name }">
				<input type="hidden" name="mb_id"value="${c.mb_id }">
				<input type="hidden" name="it_price" value="${c.it_price }">
				<input type="hidden" name="it_point" value="${c.it_point }">
				<input type="hidden" name="it_qty" value="${c.it_qty }">
				<input type="hidden" name="file1" value="${c.file1 }">
				<input type="hidden" name="it_size" value="${c.it_size }">
				<table width="700" border="0" cellpadding="0" cellspacing="0">
				
					<tr>
						<td>주문코드</td>
						<td>${c.od_id}</td>
					</tr>
				<tr>
						<td>이미지</td>
						<td><img src="/upload_item/${c.file1}" width=40></td>
					</tr>
					<tr>
						<td>상품명</td>
						<td>${c.it_name}</td>
					</tr>
					<tr>
						<td>아이디</td>
						<td>${c.mb_id}</td>
					</tr>
					<tr>
						<td>가격</td>
						<td><fmt:formatNumber value="${c.it_price}" pattern="#,###원"/></td>
					</tr>
					<tr>
						<td>수량</td>
						<td>${c.it_qty}개</td>
					</tr>
					<tr>
						<td>사이즈</td>
						<td>${c.it_size}</td>
					</tr>
					<tr>
						<td>포인트</td>
						<td>${c.it_point}점</td>
					</tr>
					<tr>
						<td>결제 할 금액</td>
						<td><fmt:formatNumber value="${c.it_qty*c.it_price}" pattern="#,###원"/></td>
					</tr>
				</table>
				<button >구매하기</button>
			</form>
		</div>
	</div>
</div>

<%@ include file="/include/footer.jsp" %>