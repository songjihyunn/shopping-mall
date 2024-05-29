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

function category_ok(){
	if(!category.ca_id.value){
		alert("분류코드를 입력하세요.");
		category.ca_id.focus();
		return false;
	}
	if(!category.ca_name.value){
		alert("분류명을 입력하세요.");
		category.ca_name.focus();
		return false;
	}
}
</script>
<div class="table-container" style="width: 1600px; height: 900px; position: absolute; background: white; display: flex; justify-content: right;">
    <div class="MainLayout" align="center" style="width: 900px; height: 100%; position: absolute; padding-left: 300px; padding-right: 45px; padding-top: 40px; padding-bottom: 40px; justify-content: flex-start; align-items: flex-start; gap: 45px; display: inline-flex;">
		<div class="container" style="top: 500px;">
		    <h2>분류 등록</h2>
		    <form name="category" action="write" method="post" onsubmit="return category_ok()">
			<table width=240 border=0 align=center>
				<tr height=24>
					<td>분류코드</td>
					<td><input id="ca_id" name="ca_id"></td>
				</tr>
				<tr height=24>
					<td>분류명</td>
					<td><input id="ca_name" name="ca_name"></td>
				</tr>
				<tr height=24>
					<td>판매가능</td>
					<td>
						<input type="radio" id="ca_use" name="ca_use" value="Y" checked>Y
						<input type="radio" id="ca_use" name="ca_use" value="N">N
					</td>
				</tr>
				<tr>
					<td></td>
					<td><button>분류추가</button></td>
				</tr>
			</table>
			</form>
		</div>
	</div>
</div>

<%@ include file="/admin/include/footer.jsp" %>