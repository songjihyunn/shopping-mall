<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/admin/include/header.jsp" %>
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
        width: 480px;
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
<div class="table-container" style="width: 1600px; height: 900px; position: absolute; background: white; display: flex; justify-content: right;">
    <div class="MainLayout" align="center" style="width: 900px; height: 100%; position: absolute; padding-left: 300px; padding-right: 45px; padding-top: 40px; padding-bottom: 40px; justify-content: flex-start; align-items: flex-start; gap: 45px; display: inline-flex;">
		<div class="container" style="top: 500px;">
		    <h2>상품관리</h2>
		    <form action="write" method="post" enctype="multipart/form-data" onsubmit="return item_ok()">
		        <table>
		            <tr>
		                <td>상품코드</td>
		                <td><span style="color:red;">자동으로 처리됨</span></td>
		            </tr>
		            <tr>
		                <td>카테고리</td>
		                <td>
		                    <div class="category-select">
		                       <select id="category1" name="category1" onchange="cate_2(this.value)">
									<option value="">=대분류 선택=</option>
									<c:forEach var="c" items="${v}">
									<option value="${c.ca_id }" <c:if test="${item.category1 == c.ca_id }">selected</c:if>>${c.ca_name }</option>
									</c:forEach>
								</select>
								<span id="category2_result">
									<select id="category2" name="category2">
										<option value="">=대분류를 먼저 선택하세요=</option>
									</select>
								</span>
		                    </div>
		                </td>
		            </tr>
		            <tr>
		                <td>상품명</td>
		                <td><input type="text" name="it_name"></td>
		            </tr>
		            <tr>
		                <td>업체 아이디</td>
		                <td><input type="text" name="mb_id" value="${sessionScope.id }" readonly></td>
		            </tr>
		            <tr>
		                <td>세일가격</td>
		                <td><input type="text" name="it_sale"></td>
		            </tr>
		            <tr>
		                <td>판매가격</td>
		                <td><input type="text" name="it_price"></td>
		            </tr>
		            <tr>
		                <td>상품 포인트</td>
		                <td><input type="text" name="it_point"></td>
		            </tr>
		            <tr>
		                <td>상품 수량</td>
		                <td><input type="number" name="it_qty"></td>
		            </tr>
		            <tr>
		                <td>상품 옵션</td>
		                <td><input type="text" name="it_option"></td>
		            </tr>
		            <tr>
		                <td>상품 사이즈</td>
		                <td>
		                    <select id="it_size" name="it_size">
		                        <option value="XS">XS</option>
		                        <option value="S">S</option>
		                        <option value="M">M</option>
		                        <option value="L">L</option>
		                        <option value="XL">XL</option>
		                        <option value="XXL">XXL</option>
		                    </select>
		                </td>
		            </tr>
		            <tr>
		                <td>판매가능</td>
		                <td>
		                    <label><input type="radio" name="it_use" value="Y" checked> Yes</label>
		                    <label><input type="radio" name="it_use" value="N"> No</label>
		                </td>
		            </tr>
		            <tr>
		                <td>상품 유형</td>
		                <td>
		                    <label><input type="checkbox" name="it_type1" value="Y"> 히트</label>
		                    <label><input type="checkbox" name="it_type2" value="Y"> 추천</label>
		                    <label><input type="checkbox" name="it_type3" value="Y"> 신상</label>
		                    <label><input type="checkbox" name="it_type4" value="Y"> 인기</label>
		                    <label><input type="checkbox" name="it_type5" value="Y"> 할인</label>
		                </td>
		            </tr>
		            <tr>
		                <td>상품 이미지 1</td>
		                <td><input type="file" name="file1"></td>
		            </tr>
		            <tr>
		                <td>상품 이미지 2</td>
		                <td><input type="file" name="file2"></td>
		            </tr>
		            <tr>
		                <td>상품 이미지 3</td>
		                <td><input type="file" name="file3"></td>
		            </tr>
		            <tr>
		                <td>상품 이미지 4</td>
		                <td><input type="file" name="file4"></td>
		            </tr>
		            <tr>
		                <td>상품 이미지 5</td>
		                <td><input type="file" name="file5"></td>
		            </tr>
		            <tr>
		                <td></td>
		                <td><button type="submit">상품추가</button></td>
		            </tr>
		        </table>
		    </form>
		</div>
	</div>
</div>

<%@ include file="/admin/include/footer.jsp" %>