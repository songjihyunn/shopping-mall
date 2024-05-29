<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/include/header2.jsp" %>
<script>
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
</script>
<style>

.custom{
	width: 1200px;
    margin-left: 500px;
   
    border-bottom: 1px solid black;
}
.custom_bottom:hover {
    background-color: lightgray;
}
/* 테이블을 감싸는 div 요소의 스타일 */
.table-container {
    overflow: hidden; /* 스크롤 가능하도록 설정 */
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
  
}  */
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
		<td align=center style="height: 150px; color:#777;font-size:14px;font-weight:bold; font-size:20px">고객센터 관리</td>
	</tr>
	<tr height="800px">
		<td height="100px" width="1800px">	<!-- 상품검색 -->
				<form method="get">
				  <div style="width: 372px; height: 100px; left: 500px; top: 150px; position: absolute">
				  <select name="field" style=" width: 80px; height: 40px;">
				  		<option value="subject" <c:if test="${field == 'subject'}">selected</c:if>>제목</option>
					    <option value="comment" <c:if test="${field == 'comment'}">selected</c:if>>내용</option>
					    <option value="name" <c:if test="${field == 'name'}">selected</c:if>>이름</option>
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
				 <%--  <div style="width: 900px; height: 42px; left: 490px; top: 200px; position: absolute">
				    <div style="width: 76px; height: 27px; left: 171px; top: 8px; position: absolute; background: #D9D9D9; border-radius: 5px"></div>
				    <div onclick="searchRecentYears()" style="width: 58px; height: 16px; left: 184px; top: 12px; position: absolute; color: black; font-size: 14px; font-family: Inter; font-weight: 400; word-wrap: break-word; cursor: pointer;">최근 1년</div>
				    <div style="width: 76px; height: 27px; left: 92px; top: 8px; position: absolute; background: #D9D9D9; border-radius: 5px"></div>
				    <div onclick="searchRecentThreeMonths()" style="width: 38px; height: 16px; left: 112px; top: 12px; position: absolute; color: black; font-size: 14px; font-family: Inter; font-weight: 400; word-wrap: break-word; cursor: pointer;">3개월</div>
				    <div style="width: 76px; height: 27px; left: 9px; top: 8px; position: absolute; background: #D9D9D9; border-radius: 5px"></div>
				    <div onclick="searchRecentOneMonth()" style="width: 36px; height: 19px; left: 28px; top: 12px; position: absolute; color: black; font-size: 14px; font-family: Inter; font-weight: 400; word-wrap: break-word; cursor: pointer;">1개월</div>
				    <div style="margin-left:10px; margin-top: 50px; color: black;">Total : ${count }</div>
				  </div> --%>
				  
				  <div style="margin-top: -280px;">
					  <table class="custom" border="0" >
						<tr height="50px" width="900" style="text-align:center; border-bottom: 1px solid black; background-color: #1A1919;" bgcolor="#e5ecef">
							<tr height="50px" style="text-align:center; border-bottom: 1px solid black; background-color: #1A1919; color: white;">
                <td class="td_title" style="color: #ffffff; width= 20%">번호</td>
                <td class="td_title" style="color: #ffffff">제목</td>
                <td class="td_title" style="color: #ffffff">글쓴이</td>
                <td class="td_title" style="color: #ffffff">날짜</td>
                <td class="td_title" style="color: #ffffff">관리</td>
			</tr>
			<c:set var="number" value="${number }" />
              <input type="hidden" name="number" value="${number }">	
              <c:forEach var="list" items="${v}">
              <tr height="50px" style="padding:10px">
                <td align="center" width= 20%>${number }</td>
                <td align="center">
                    ${list.subject}
                    <%--  twodate 값이 1일 때 이미지 출력 
                    <c:if test="${twodate == 1}">
                        <img src="img/main_new.gif" />
                    </c:if> --%>
                </td>
                
                <td align="center">${list.id }</td>
                <td align="center">${list.signdate}</td>
                <td align="center">
                 	 <a href="view?uid=${list.uid}&pageNum=${pageNum}&field=${field}&search=${search}">
					  	        <button class="custom-button">보기</button>
                  </a>
                  <a href="modify?uid=${list.uid}&pageNum=${pageNum}&field=${field}&search=${search}">
                    <button class="custom-button">수정</button>
                  </a>
                  <a href="delete?uid=${list.uid}">
                    <button class="custom-button">삭제</button>
                  </a>
                </td>
              </tr>
              <tr><td height=1 bgcolor="#e5ecef"></td></tr>
              <c:set var="number" value="${number - 1 }" />
             </c:forEach>
						<c:if test="${empty v}">
					    <!-- 리스트가 비어있는 경우에만 실행될 내용 -->
					        <tr height="100px" width="100px" >
					            <td colspan="7" align= "center">주문 내역이 없습니다.</td>
					        </tr>
						</c:if>
					</table>
				</div>
			<div width=1000 height="30" style="left:-300; "></div>
        <table width=1500 border=0 align="center" style="margin: 30px">
          <tr height="30px">
            <td colspan="3" align="right">
            <a href="write">
                 <button class="custom-write">글쓰기</button>
					  </a>
				    </td>
			    </tr>	
              <tr>
                <td width=30%></td>
                <td style="text-align: center;">
                  <c:if test="${count>0 }">
                    <c:set var="pageCount" value="${count / pageSize + (count % pageSize == 0 ? 0 : 1) }" />
                    <fmt:parseNumber var="pageCount" value="${pageCount }" integerOnly="true" />
                    <!-- fmt:parseNumber : 문자열을 숫자로 변환해 주는 기능을 제공하는 태그 -->
                    <!-- integerOnly : true , false 정수만 출력할 것인지를 묻는 속성 -->
                  
                    <!-- 2개의 변수 초기화 -->
                    <c:set var="startPage" value="${1 }" />
                    <c:set var="pageBlock" value="${3 }" />	
                  
                    <!-- 두번째 이상 블럭을 실행 할 경우 startPage 값 변경 부분-->
                    <c:if test="${pageNum > pageBlock }">
                      <!-- 결과를 정수형으로 리턴 받아야 하기 대문에 fmt -->
                      <fmt:parseNumber var="result" value="${pageNum / pageBlock - (pageNum % pageBlock == 0 ? 1:0) }" integerOnly="true"/>
                      <c:set var="startPage" value="${result * pageBlock + 1 }" />
                    </c:if>	
                  
                    <!-- endPage 값 설정 부분 -->
                    <c:set var="endPage" value="${startPage + pageBlock - 1 }" />
                    <!-- 마지막 블럭일 경우 endPage 값 설정 부분 -->
                    <c:if test="${endPage > pageCount }">
                      <c:set var="endPage" value="${pageCount }" />
                    </c:if>
                  
                    <!-- 이전 링크 -->
                    <c:if test="${startPage > pageBlock }">
                      <a href="list?pageNum=${startPage - pageBlock }&field=${field}&search=${search}">[이전] </a>
                    </c:if>
                  
                    <!-- 페이징 링크 -->
                    <c:forEach var="i" begin="${startPage }" end="${endPage }">
                      <c:choose>
                        <c:when test="${pageNum == i }">
                          <a href="list?pageNum=${i }&field=${field}&search=${search}"><span class="page_on"><font color=#1A1919><b>${i }</b></font></span></a>
                        </c:when>
                        <c:otherwise>
                          <a href="list?pageNum=${i }&field=${field}&search=${search}"><span class="page_off">${i }</span></a>
                        </c:otherwise>
                      </c:choose>
                    </c:forEach>
                  
                    <!-- 다음 링크 -->
                    <c:if test="${endPage < pageCount }">
                      <a href="list?pageNum=${startPage + pageBlock }&field=${field}&search=${search}">[다음] </a>
                    </c:if>
                  </c:if>
                </td>
                <td width="200px" align=right>
                	
				</td>
              </tr>
            </table>
		</td>
	</tr>
</table>
</div>
<!-- 페이징 처리 -->
<script>
function qty_num(num,str){

	var total = parseInt($("input[id=it_qty]:eq("+num+")").val());
	if(str == "-"){ //차감
		if(total == 1){
			alert("주문 최소 수량은 1개입니다.");
		}else{
			$("input[id=it_qty]:eq("+num+")").val(total - 1);
		}		
	}else{ //증가
		$("input[id=it_qty]:eq("+num+")").val(total + 1);
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

<%@ include file="/include/footer.jsp" %>









