<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/admin/include/header.jsp" %>
<%@ taglib prefix= "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<!-- No Cache 설정 -->
<meta http-equiv="Expires" content="-1">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="No-Cache">
<meta charset="UTF-8">
<title>헤더</title>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.4.1.min.js"></script>
<script>
//최근 1개월 버튼 클릭 시 실행될 함수
function searchRecentOneMonth() {
    //오늘 날짜
    var today = new Date();

    //1개월 전 날짜 계산
    var oneMonthAgo = new Date();
    oneMonthAgo.setMonth(today.getMonth() - 1);

    //시작일과 종료일을 YYYY-MM-DD 형식으로 변환
    var startDate = formatDate(oneMonthAgo);
    var endDate = formatDate(today);

    //서버로 시작일과 종료일을 전달하여 검색
    window.location.href = "/admin/order/list?startDate=" + startDate + "&endDate=" + endDate;
}
//최근 3개월 버튼 클릭 시 실행될 함수
function searchRecentThreeMonths() {
    //오늘 날짜
    var today = new Date();

    //3개월 전 날짜 계산
    var threeMonthsAgo = new Date();
    threeMonthsAgo.setMonth(today.getMonth() - 3);

    //시작일과 종료일을 YYYY-MM-DD 형식으로 변환
    var startDate = formatDate(threeMonthsAgo);
    var endDate = formatDate(today);

    //서버로 시작일과 종료일을 전달하여 검색
    window.location.href = "/admin/order/list?startDate=" + startDate + "&endDate=" + endDate;
}
//최근 12개월 버튼 클릭 시 실행될 함수
function searchRecentYears() {
    //오늘 날짜
    var today = new Date();

 	//12개월 전 날짜 계산
    var twelveMonthsAgo = new Date();
    twelveMonthsAgo.setMonth(today.getMonth() - 12);

    //시작일과 종료일을 YYYY-MM-DD 형식으로 변환
    var startDate = formatDate(twelveMonthsAgo);
    var endDate = formatDate(today);

    //서버로 시작일과 종료일을 전달하여 검색
    window.location.href = "/admin/order/list?startDate=" + startDate + "&endDate=" + endDate;
}

// 날짜를 YYYY-MM-DD 형식으로 변환하는 함수
function formatDate(date) {
    var year = date.getFullYear();
    var month = date.getMonth() + 1; // getMonth()는 0부터 시작하므로 +1 처리
    var day = date.getDate();

    // 월과 일이 한 자리 수인 경우 앞에 0을 붙여 두 자리로 만듦
    month = month < 10 ? "0" + month : month;
    day = day < 10 ? "0" + day : day;

    return year + "-" + month + "-" + day;
}

function formatDateFromDatabase(od_date) {
    // 연도, 월, 일 추출
    var year = od_date.substring(0, 4);
    var month = od_date.substring(4, 6);
    var day = od_date.substring(6, 8);

    // YYYY.MM.DD 형식으로 조합
    var formattedDate = `${year}.${month}.${day}`;

    return formattedDate;
}
var popupX = (window.screen.width / 2) - (560 / 2);
var popupY= (window.screen.height /2) - (460 / 2);
//상세
function popup(str){
	window.open("view?id="+str,"view","width=560,height=560,left="+popupX+",top="+popupY);
}

//수정
function popup_modify(str){
	window.open("modify?id="+str,"view","width=560,height=560,left="+popupX+",top="+popupY);
}

//삭제
function od_delete(str){
	result = confirm("삭제 하시겠습니까?");

	if(result == true){
		location.href="delete?id="+str;
	}
}
var popupX = (window.screen.width / 2) - (560 / 2);
var popupY= (window.screen.height /2) - (460 / 2);

//상세
function popup(str){
	window.open("view?id="+str,"view","width=560,height=460,left="+popupX+",top="+popupY);
}

//수정
function popup_modify(str){
	window.open("modify?id="+str,"view","width=560,height=460,left="+popupX+",top="+popupY);
}

//삭제
function id_delete(str){
	result = confirm("삭제 하시겠습니까?");

	if(result == true){
		location.href="delete?id="+str;
	}
}
</script>

</script>
<style>

.custom{
	width: 1200px;
    margin-left: 500px;
    border-top: 1px solid black;
    border-bottom: 1px solid black;
}
.custom_bottom:hover {
    background-color: lightgray;
}
/* 테이블을 감싸는 div 요소의 스타일 */
.table-container {
    overflow: auto; /* 스크롤 가능하도록 설정 */
    width: 1800px;
}

/* 테이블 헤더 요소의 스타일 */
.table-container table thead th {
    position: sticky; /* 고정 위치 설정 */
    top: -50px; /* 상단 위치로 고정 */
}

/* .buy_btn {
  width: 100px;
  height: 25px;
  background-color: #1A1919;
  border: none;
  border-radius: 10px;
  color: #bdc1c6;
  cursor: pointer;
  margin-right: 5px;
  
} */
.custom-write {
  width: 50px;
  height: 35px;
  background-color: #1A1919;
  border: none;
  border-radius: 10px;
  color: #bdc1c6; /* 화이트로 변경 */
  cursor: pointer;
  margin-right: 5px; /* 버튼 사이의 간격 조절 */
}
</style>
</head>
<body>


<div class="table-container" style="width: 1800px; height: 900px; position: absolute; background: white">
<table border="0" style="width: 900px;">
	<tr>
		<td align=center style="height: 150px; color:#777;font-size:14px;font-weight:bold; font-size:20px">뷰 페이지</td>
	</tr>
	<tr height="800px">
		<td height="100px" width="1800px">	<!-- 상품검색 -->
				<form method="get">
				  <div style="width: 372px; height: 100px; left: 500px; top: 150px; position: absolute">
				  	<select name="field" style=" width: 80px; height: 40px;">
				  		<option value="subject" <c:if test="${field == 'subject' }">selected</c:if>>제목</option>
						<option value="comment" <c:if test="${field == 'comment' }">selected</c:if>>내용</option>
						<option value="name" <c:if test="${field == 'name' }">selected</c:if>>이름</option>
					</select>
				    <div style="width: 372px; height: 40px; left: 90px; top: 0px; position: absolute;">
				    	<input name="search" value="${search}" style="width: 372px; height: 40px; left: 90px; background: #F7F6F9; border-radius: 8px; border: 1px solid gray; outline: none; caret-color: black;">
				    </div>
				   		
				    <div style="width: 184.92px; left: 17.17px; top: 12px; position: absolute; color: #A49F9F; font-size: 14px; font-family: Everett; font-weight: 400; word-wrap: break-word"> </div>
				    <!-- 검색 이미지 -->
				    <div style="width: 17.30px; height: 16px; left: 430px; top: 12px; position: absolute">
				      	<button style="border: none; width: 100%; height: 100%;">
				      		<img src = "/img/search.png" style=" width: 100%; height: 100%;">
				      	</button>
				    </div>
				  </div>
				  </form>
				  <div style="margin-top:-300px; position: absolute;">
				  
				   <h3>모자</h3>
					 <table width="900" border="0" align="center" style="margin-left: 500px; border: 1px solid gray;">
						<c:set var="i" value="0" />
							<c:forEach var="gall" items="${v}">
								<c:if test="${gall.category1== 30}"> <!-- 카테고리 조절 하여 원하는 항목만 출력-->
									<!-- 각 갤러리 항목이 4열씩 나열되도록 조건에 맞춰 새로운 행을 시작 -->
									<c:if test="${i % 5 == 0}">
										<tr>
									</c:if>
									
									<!-- 갤러리 항목 -->
									<td style="width:175px; padding:4px; border: 1px solid gray;">
										<a href="ItemView?it_uid=${gall.it_uid}&pageNum=${pageNum}&field=${field}&search=${search}">
											<img src="/upload_item/${gall.file1_thumb}" width="160" alt="${gall.it_name}"><br>
										</a>
											${gall.it_name}<br>
											<fmt:formatNumber value="${gall.it_price}" pattern="#,###원"/><br>
									</td>

									<!-- 4열씩 나열된 후 줄 바꿈 -->
									<c:if test="${i % 5 == 4}">
										</tr> <!-- 행을 닫아줄 위치 -->
										<tr><td colspan="4" height="1" width="100%" bgcolor="#d1dee2"></td></tr> <!-- 줄 바꿈 후 구분선 -->
									</c:if>
							
									<!-- `i` 변수 증가 -->
									<c:set var="i" value="${i + 1}" />
								</c:if> <!-- 카테고리 조절 하여 원하는 항목만 출력-->
							</c:forEach>
						
							<!-- 마지막 행의 `tr` 태그를 닫아줌 -->
							<c:if test="${i % 5 != 0}">
								</tr>
							</c:if>
					</table>
				</div>
		</td>
	</tr>
	<tr>
		<td>
			<div style="margin-top:-300px; position: absolute;">
				   <h3>상의</h3>
					 <table width="900" border="0" align="center" style="margin-left: 500px; border: 1px solid gray;">
					 
						<c:set var="i" value="0" />
							<c:forEach var="gall" items="${v}">
								<c:if test="${gall.category1== 20}"> <!-- 카테고리 조절 하여 원하는 항목만 출력-->
									<!-- 각 갤러리 항목이 4열씩 나열되도록 조건에 맞춰 새로운 행을 시작 -->
									<c:if test="${i % 5 == 0}">
										<tr>
									</c:if>
									
									<!-- 갤러리 항목 -->
									<td style="width:175px; padding:4px; border: 1px solid gray;">
										<a href="ItemView?it_uid=${gall.it_uid}&pageNum=${pageNum}&field=${field}&search=${search}">
											<img src="/upload_item/${gall.file1_thumb}" width="160" alt="${gall.it_name}"><br>
										</a>
											${gall.it_name}<br>
											<fmt:formatNumber value="${gall.it_price}" pattern="#,###원"/><br>
									</td>
							
									<!-- 4열씩 나열된 후 줄 바꿈 -->
									<c:if test="${i % 5 == 4}">
										</tr> <!-- 행을 닫아줄 위치 -->
										<tr><td colspan="4" height="1" width="100%" bgcolor="#d1dee2"></td></tr> <!-- 줄 바꿈 후 구분선 -->
									</c:if>
							
									<!-- `i` 변수 증가 -->
									<c:set var="i" value="${i + 1}" />
								</c:if> <!-- 카테고리 조절 하여 원하는 항목만 출력-->
							</c:forEach>
						
							<!-- 마지막 행의 `tr` 태그를 닫아줌 -->
							<c:if test="${i % 5 != 0}">
								</tr>
							</c:if>
					</table>
				</div>
		<td>
	</tr>
</table>
</div>
<!-- 페이징 처리 -->
<script>
function qty_num(num,str){

	var total = parseInt($("input[id=qty]:eq("+num+")").val());
	if(str == "-"){ //차감
		if(total == 1){
			alert("주문 최소 수량은 1개입니다.");
		}else{
			$("input[id=qty]:eq("+num+")").val(total - 1);
		}		
	}else{ //증가
		$("input[id=qty]:eq("+num+")").val(total + 1);
	}
}
</script>

<style>
	.page_on {
		padding:0px 5px;
		color: #1A1919;
		border:1px solid #1A1919;
		font-weight:bold;
	}
	.page_off {
		padding:0px 5px;
		color:#1A1919;
		border:1px solid #1A1919;
	}
</style>

<%@ include file="/admin/include/footer.jsp" %>