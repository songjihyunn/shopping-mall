<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix= "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Item" %>

<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.4.1.min.js"></script>
<link rel="stylesheet" href="/css/basic.css">
<!-- Swiper CSS -->
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">

<!-- Swiper JS -->
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>


<%-- <jsp:include page="/include/header.jsp"></jsp:include>	<!-- 액션 태그 --> --%>
<script>
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
<script>
    document.addEventListener('DOMContentLoaded', function () {
        var swiper = new Swiper('.swiper-container', {
            // Swiper 옵션 설정 (원하는 대로 수정 가능)
            slidesPerView: 1,
            spaceBetween: 10,
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },
            pagination: {
                el: '.swiper-pagination',
                clickable: true,
            },
            autoplay: {
                delay: 2500,
                disableOnInteraction: false,
            },
        });
    });
</script>
<script>
// 로그아웃
function openPopUp() {
	testPopUp= window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
}
function closePopUp(){
	location.href="/member/logout";
	testPopUp.close();
}
function naverLogout() {
	openPopUp();
	setTimeout(function() {
		closePopUp();
	}, 1000);
}

</script>
<!-- 카카오 스크립트 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
Kakao.init('bb0f74f0c73da48463149dd16f9d9cca'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단

//카카오로그아웃  
function kakaoLogout() {
	if (Kakao.Auth.getAccessToken()) {
		Kakao.API.request({
			url: '/v1/user/unlink',
			success: function (response) {
				console.log(response);

				//로그아웃 세션 삭제후 첫 페이지 이동
				$.ajax({
					url: "/member/kakaoLogout",
					type: "get",
					dataType: "text",
					success:function(num){
						console.log(num);
						//if(num == 'kakaoLogout'){
							location.href="/";
						//}
					}
				});
			},
			fail: function (error) {
				console.log(error);
			},			
		})
		Kakao.Auth.setAccessToken(undefined);		
	}
}
</script>
<style>
body{
		background: #1A1919;
	}
	center{
		background: #ffffff;
	}
	.button-container {
	  position: fixed;
	  right: 0;
	  bottom: 0;
	  margin: 20px;
	}
	
	#iframeContainer {
	  position: fixed;
	  right: 20px;
	  bottom: 80px; /* 버튼의 높이와 여백을 고려하여 조정 */
	  width: 400px;
	  height: 600px;
	  display: none; /* 초기에는 iframe이 보이지 않도록 설정 */
	}
	
	iframe {
	  width: 100%;
	  height: 100%;
	  border:none;
	  z-index: 3;
	}
	
	.iframe-container {
	    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.5); /* X-offset Y-offset Blur Spread Color */
	    max-width: 600px; /* 최대 너비 설정, 필요에 따라 조정 */
	    margin: 20px; /* 주변 여백 */
	}
    .container {
        height: 140px;
        position: relative;
        background: #1A1919;
        margin: 0 auto;
        border: 0px solid black;
        display: grid;
        grid-template-rows: 60px 42px;
        grid-template-columns: 74px 1fr;
        gap: 10px;
        overflow: hidden;
        min-width: 200px;
    }

    .logo {
        margin: 40px 30px;
        width: 74px;
        height: 74px;
		
        color: white;
        curosor: pointer;
        font-size: 25px;
        font-weight: bold;
    }

    .search {
        margin: 20px;
        width: 600px;
        height: 40px;
        border: 0px solid black;
        display: flex;
        align-items: center;
        padding: 0 50px;
    }

    .category {
        margin-left:130px;
        margin-top: 20px;
        width: 600px;
        height: 42px;
        border: 0px solid black;
        display: flex;
        font-size: 20px;
        font-family: Poppins;
        font-weight: bold;
        
    }

    .category-item {
        flex: 1;
        text-align: center;
        cursor: pointer;
        color: ffffff;
        font-size: 15px;
    }

    .menu {
	    display: flex;
	    justify-content: space-between;
	    position: absolute;
	    right: 20px;;
		height: 140px;
	    border: 0px solid black;
	    overflow: hidden;
	    flex-direction: column; align-items: flex-end;
	}
	
	.menu-btn {
	    display: flex;
	    flex-direction: column;
	    align-items: center;
	    width: 90px;
	    padding: 10px;
	    border-radius: 10px;
	    margin-bottom: 5px;
	    cursor: pointer;
	    margin-left: 10px;
	}

    .menu-btn img {
        width: 24px;
        height: 24px;
        margin-right: 10px;
    }

    .cart-btn {
        padding: 5px 10px;
        background: white;
        color: black;
    }

    .orders-btn {
        padding: 5px 10px;
        background: white;
        color: black;
     }
    .aa {
	    top: 0px; 
	    display: flex;
	    justify-content: center; /* 가로 중앙 정렬 */
	    position: relative;
	    flex-wrap: wrap; /* 가로 공간이 부족할 때 줄 바꿈 */
	    margin: 0 auto; /* 좌우 여백을 자동으로 설정 */
	    padding: 0 10px; /* 좌우 여백을 설정 */
	    overflow: hidden;
	}
	.bb{
		display: flex;
	    flex-direction: column; /* 요소들을 세로로 배치 */
	    margin-right: 10px;
	    overflow: hidden;
	}
	.cc{
		display: flex;
		flex-direction: column;
		width: calc(90% - 460px); /* 수정: 부모 요소의 너비에서 swiper_swiper의 너비와 여백을 뺌 */
		overflow: hidden;
	}
	.first_box {
	    display: flex;
	    border: 3px solid #f9f9f9;
	    width: 430px;
	    padding: 30px 10px; 
	    border-radius: 20px;
	    margin-bottom: 20px; 
	    justify-content: space-around;
	    background: #ffffff;
	}

	.swiper_swiper {
	    width: 450px; 
	    height: 350px; 
	    position: relative; /* 절대 위치 대신 상대 위치로 변경 */
	    background: #F6F6F6; 
	    border-radius: 20px;
	    margin-right: 10px; /* 수정: 오른쪽 여백 추가 */
	}
	.additional-container {
	    margin-bottom: 20px; 
	    height: 273.8px;
	    background: #F6F6F6;
	    border-radius: 20px;
	    flex-direction: row; /* 가로 방향으로 정렬 */
	    justify-content: space-between; /* 자식 요소들 사이의 간격을 최대한 넓힘 */
	    align-items: center; /* 세로 중앙 정렬 */
	    padding: 0 50px; /* 좌우 여백 설정 */
	    overflow: hidden;
	    min-width: 90%; /* 요소의 최소 가로 너비 설정 */
	}
	.visual .swiper-container{
		margin: 0 auto;            
		position: relative; 
	}
	.visual img{
		display: flex;
        justify-content: center;
        align-items: center;
        width: 100%;
	}

	/* swiper 하단 버튼 디자인  */
	.visual .swiper-pagination{
		position: absolute;
		left: 0;
		bottom: 3%;
		z-index: 100;            
		text-align: center;
	}
	.visual .swiper-pagination .swiper-pagination-bullet{
		width: 12px;
		height: 12px;
		background: #fff;
		opacity: 1;
	}
	.visual .swiper-pagination .swiper-pagination-bullet-active{
		background: #1A1919;
	}
	/* swiper left, right 버튼 디자인  */
	.visual .arrow{
		position: absolute;
		top: 50%;
		font-size: 25px;
		background: #000;
		color: #000;
		z-index: 100;
		line-height: 1;
		margin-top: -20px;
		padding: 10px;
		border-radius: 5px;
		cursor: pointer;
	}
	.visual .next{
		right: 10px;
	}
	.visual .prev{
		left: 10px;
	}
	#footer {
	width: 100%;
    height: 50px;
    background-color: black;
    width: 100%; /* 화면 전체 너비에 맞게 설정 */
    bottom: 0; /* 화면 아래에 고정 */
    left: 0;
    right: 0;
    overflow-x: hidden;
    margin-top: 50px; /* 위로 10px만큼 띄우기 */
    color: white;
    text-align: center;
    padding-top: 30px;
}
</style>
	<div class="container">
	    <div class="logo" onclick="location.href='/'">
	    	Chic Boutique
	    </div>
	    <div class="search" style="position: relative; display: flex; align-items: center;">
	    <form action="search" method="get" style="display: flex; width: 100%; padding-top: 25px;">
	        <input id="searchInput" name="search" value="${search}" style="flex: 1; padding: 8px; background: #F6F6F6; border-radius: 16px; border: 1px rgba(102, 102, 102, 0.35); position: relative;">
	        <button type="submit" style="position: absolute; right: 60px; top: 1px; height: 100%; border: none; background-color:transparent;">
	            <img src="/img/search.png" style="width: 20px; height: 20px; padding-top: 20px; margin-left: -20px;">
	        </button>
	    </form>
</div>
<script>
function searchItem() {
    var searchValue = document.getElementById("searchInput").value;
    var it_uid = '${it_uid}';
    var pageNum = '${pageNum}';
    var field = '${field}';
    location.href = '/search?it_uid=' + it_uid + '&pageNum=' + pageNum + '&field=' + field + '&search=' + encodeURIComponent(searchValue);
}
</script>
	    <div class="category">
		    <div class="category-item" onclick="location.href='/item/sailing?product=10'">상의</div>
		    <div class="category-item" onclick="location.href='/item/sailing?product=20'">하의</div>
		    <div class="category-item" onclick="location.href='/item/sailing?product=30'">모자</div>
		    <div class="category-item" onclick="location.href='/item/sailing?product=40'">양말</div>
		    <div class="category-item" onclick="location.href='/item/sailing?product=50'">악세사리</div>
		    <div class="category-item" onclick="location.href='/bbs/list'">고객센터</div>
		</div>
	    <div class="menu" style="">
	    <c:choose>
	    	<c:when test="${sessionScope.id != null}">
		    	<c:if test="${sessionScope.level != '10' }">
		    	<div style="display: flex; padding-top: 20px;">
			        <div class="menu-btn cart-btn" onclick="location.href='/cart/list'" style="display: flex; flex-direction: column; align-items: center;">
			            <img src="/img/cart2.png" style="margin-bottom: 5px;">장바구니
			        </div>
			        <div class="menu-btn orders-btn" onclick="location.href='/order/list'" style="display: flex; flex-direction: column; align-items: center; margin-left: 10px;">
			            <img src="/img/order2.png" style="margin-bottom: 5px;">주문내역
			        </div>
			    </div>
		    	<c:if test="${sessionScope.connecttype !='카카오' && sessionScope.connecttype !='네이버' }">
			    	<div style="display: flex;">
				        <div class="menu-btn login-btn" onclick="location.href='/member/logout'" style="display: flex; flex-direction: column; align-items: center; margin-top: 10px;background-color: black; color: white;">
				            	로그아웃
				        </div>
				        <div class="menu-btn modfiy-btn" onclick="location.href='/member/modify'" style="border: 1px solid black; display: flex; flex-direction: column; align-items: center; margin-top: 10px;background-color: white; color: black;">
			            	회원수정
			        </div>
				    </div>
			    </c:if>
			    <c:if test="${sessionScope.connecttype =='카카오' }">
				    <div style="display: flex;">
				        <div class="menu-btn login-btn" onclick="kakaoLogout()" style="justify-content: space-around;display: flex; flex-direction: column; align-items: center; margin-top: 10px;background-color: black; color: white;">
				            	<div>카카오</div>
				            	<div>로그아웃</div>
				        </div>
				        <div class="menu-btn modify-btn" onclick="location.href='/member/modify'" style="border: 1px solid black; display: flex; flex-direction: column; align-items: center; margin-top: 10px;background-color: white; color: black;">
			            	회원수정
			        </div>
				    </div>
				</c:if>
				<c:if test="${sessionScope.connecttype =='네이버' }">
				    <div style="display: flex;">
				        <div class="menu-btn login-btn" onclick="naverLogout()" style="justify-content: space-around;display: flex; flex-direction: column; align-items: center; margin-top: 10px;background-color: black; color: white;">
				            	<div>네이버</div>
				            	<div>로그아웃</div>
				        </div>
				        <div class="menu-btn modify-btn" onclick="location.href='/member/modify'" style="border: 1px solid black; display: flex; flex-direction: column; align-items: center; margin-top: 10px;background-color: white; color: black;">
			            	회원수정
			        </div>
				    </div>
			    </c:if>
			    </c:if>
		    </c:when>
		    <c:otherwise>
			    <div style="display: flex; margin: auto 0;">
			    	<div class="menu-btn signup-btn" onclick="location.href='/member/join'" style="border: 1px solid black;margin-top: 10px;background-color: white; color: black;">
			            	회원가입
			        </div>
			        <div class="menu-btn login-btn" onclick="location.href='/member/login'" style="margin-top: 10px;background-color: black; color: white;">
			            	로그인
			        </div>
			        
			    </div>
		    </c:otherwise>
		    </c:choose>
		    <c:if test="${sessionScope.level == '10' }">
		    <div style="display: flex; margin-top: 25px;">
		        <div class="menu-btn admin-btn" onclick="location.href='/admin/'" style="color: ffffff; display: flex; flex-direction: column; align-items: center;">
		            <img src="/img/admin3.png" style="margin-bottom: 5px;">관리자
		        </div>
		        <c:if test="${sessionScope.connecttype !='카카오' && sessionScope.connecttype !='네이버' }">
		        <div class="menu-btn logout-btn" onclick="location.href='/member/logout'" style="height: 20px; border: 1px solid black;display: flex; flex-direction: column; align-items: center; margin-top: 10px;background-color: black; color: white;">
		           	 로그아웃
		        </div>
		        </c:if>
		    </div>
			</c:if>
		</div>
	</div>

	<div style=" width: 100%; height: 2px; background-color: lightgray; margin-top: 10px;"></div>
<center>

<div class="aa">


	<div class="bb">
	<div class="first_box">
    	<c:choose>
		    <c:when test="${empty sessionScope.id}">
		        <!-- 로그인되지 않은 경우에만 아래의 코드가 실행됩니다. -->
		        <div style="display: flex; margin: auto 0;">
		            <div class="menu-btn login-btn" onclick="location.href='/member/login'" style="width: 180px; height: 30px; display: flex; flex-direction: column; align-items: center; background-color: black; color: white; font-weight: bold; font-size: 20px; ">
		                로그인
		            </div>
		            <div class="menu-btn signup-btn" onclick="location.href='/member/join'" style="border: 1px solid black;width: 180px; height: 30px; display: flex; flex-direction: column; align-items: center; background-color: white; color: black; font-weight: bold; font-size: 20px; ">
		                회원가입
		            </div>
		        </div>
		    </c:when>
			<c:otherwise>
				<div style="display: flex; margin: auto 0;">
			    	<div style=" font-size: 20px; display: flex; height: 30px;padding: 13px 0; flex-direction: column; align-items: center; font-weight: bold;">
			    		${sessionScope.id}님 환영합니다
			    	</div>
			    </div>
			</c:otherwise>
		</c:choose>

    </div>
	<!-- Swiper(모든상품) -->
	<div class="swiper_swiper">
		<div style="width: 300px; heigth: 30px; left: -50px; top: 20px; position: absolute; border: none; overflow: hidden; color: black; font-size: 28px; font-weight: bold;">
			인기상품
		</div>
		<div style="width: 400px; height: 220px; left: 30px; top: 80px;position: absolute; border-radius: 20px; overflow: hidden; border: 0px black solid">
		    <div class="visual">
		        <!-- Swiper 컨테이너 -->
		        <div class="swiper-container">
		            <!-- Swiper 래퍼 -->
		            <div class="swiper-wrapper">
		                <%-- v1이 null이 아니고 요소가 있는지 확인 --%>
		                <% ArrayList<Item> v1 = (ArrayList<Item>) request.getAttribute("v1"); %>
		                <% if (v1 != null && !v1.isEmpty()) { %>
		                    <% for (int i = 0; i < Math.min(5, v1.size()); i++) { %>
		                        <!-- Swiper 슬라이드 -->
		                        <div class="swiper-slide">
		                            <a href="../item/ItemView?it_uid=<%= v1.get(i).getIt_uid() %>&pageNum=${pageNum}&field=${field}&search=${search}">
		                                <img src="/upload_item/<%= v1.get(i).getFile1_thumb() %>" style="width: 100%; height: 100%; object-fit: contain;">
		                            </a>
		                        </div>
		                    <% } %>
		                <% } %>
		            </div>
		            <!-- Swiper 페이지네이션 -->
		            <div class="swiper-pagination"></div>
		            <!-- Swiper 내비게이션 -->
		            <div class="swiper-button-next" style="color: black;"></div>
		            <div class="swiper-button-prev" style="color: black;"></div>
		        </div>
		    </div>
		</div>
	</div>
	<div class="swiper_swiper" style=" margin-top: 20px;">
		<div style="width: 300px; heigth: 30px; left: -50px; top: 20px; position: absolute; border: none; overflow: hidden; color: black; font-size: 28px; font-weight: bold;">
			최신상품
		</div>
		<div style="width: 400px; height: 220px; left: 20px; top: 80px;position: absolute; border-radius: 20px; overflow: hidden; border: 0px black solid">
		    <div class="visual">
		        <!-- Swiper 컨테이너 -->
		        <div class="swiper-container">
		            <!-- Swiper 래퍼 -->
		            <div class="swiper-wrapper">
		                <%-- v1이 null이 아니고 요소가 있는지 확인 --%>
		                <% ArrayList<Item> v4 = (ArrayList<Item>) request.getAttribute("v3"); %>
							<% if (v4 != null && !v4.isEmpty()) { %>
							    <% for (int i = 0; i < Math.min(5, v4.size()); i++) {%>
							        <!-- Swiper 슬라이드 -->
							        <div class="swiper-slide">
							            <a href="../item/ItemView?it_uid=<%= v4.get(i).getIt_uid() %>&pageNum=${pageNum}&field=${field}&search=${search}">
							                <img src="/upload_item/<%= v4.get(i).getFile1_thumb() %>" style="width: 100%; height: 100%; object-fit: contain;">
							            </a>
							        </div>
							    <% } %>
							<% } %>
		            </div>
		            <!-- Swiper 페이지네이션 -->
		            <div class="swiper-pagination"></div>
		            <!-- Swiper 내비게이션 -->
		            <div class="swiper-button-next" style="color: black;"></div>
		            <div class="swiper-button-prev" style="color: black;"></div>
		        </div>
		    </div>
		</div>
	</div>
	</div>
	<div class="cc">
		<div class="additional-container">
	    	<div style="width: 300px; top: 30px; text-align: left; position: absolute; border: none; overflow: hidden; color: black; font-size: 28px; font-weight: bold;">
			    전체 상품
			</div>
		    <div style="display: flex; gap: 40px; margin-top: 70px;"> <!-- 이미지를 조금 아래로 내렸습니다. -->
		        <% 
		            ArrayList<Item> v = (ArrayList<Item>) request.getAttribute("v"); 
		            int maxItemsToShow = 6; // 최대 표시할 상품 수
		            int itemCount = 0; // 표시된 상품 수를 추적하기 위한 변수
		            for (Item item : v) { 
		                if (itemCount >= maxItemsToShow) {
		                    break; // 최대 표시할 상품 수를 초과하면 반복 종료
		                }
		                itemCount++;
		        %>
		            <a href="../item/ItemView?it_uid=<%= item.getIt_uid() %>" style="flex: 0 0 auto;">
		                <img src="/upload_item/<%= item.getFile1_thumb() %>" style="width: 150px; height: 150px;">
		                <div style="margin-top: 5px; font-weight:bold;"><%= item.getIt_name() %></div>
		                <div style="margin-top: 5px; font-weight: bold;">
    						<fmt:formatNumber value="<%= item.getIt_price() %>" pattern="#,###원"/>
						</div>
		            </a>
		        <% } %>
		    </div>	
		</div>
		<div class="additional-container">
			<div style="width: 300px; padding-top: 30px; text-align: left; position: absolute; border: none; overflow: hidden; color: black; font-size: 28px; font-weight: bold;">
			    모자
			</div>
		    <div style="display: flex; gap: 40px; margin-top: 70px;"> <!-- 이미지를 조금 아래로 내렸습니다. -->
		        <% 
				    ArrayList<Item> v2 = (ArrayList<Item>) request.getAttribute("v2"); 
				    int maxItemsToShow1 = 6; // 최대 표시할 상품 수
				    int itemCount1 = 0; // 표시된 상품 수를 추적하기 위한 변수
				    for (Item item : v2) { 
		                if (itemCount1 >= maxItemsToShow1) {
		                    break; // 최대 표시할 상품 수를 초과하면 반복 종료
		                }
		                itemCount1++;
				%>
		            <a href="..//item/ItemView?it_uid=<%= item.getIt_uid() %>" style="flex: 0 0 auto;">
		                <img src="/upload_item/<%= item.getFile1_thumb() %>" style="width: 150px; height: 150px;">
		                <div style="margin-top: 5px; font-weight:bold;"><%= item.getIt_name() %></div>
		                <div style="margin-top: 5px; font-weight: bold;">
    						<fmt:formatNumber value="<%= item.getIt_price() %>" pattern="#,###원"/>
						</div>
		            </a>
		        <% } %>
		    </div>	
		</div>
		<div class="additional-container">
			<div style="width: 300px; padding-top: 30px; text-align: left; position: absolute; border: none; overflow: hidden; color: black; font-size: 28px; font-weight: bold;">
			    악세사리
			</div>
		    <div style="display: flex; gap: 40px; margin-top: 70px;"> <!-- 이미지를 조금 아래로 내렸습니다. -->
		        <% 
				    ArrayList<Item> v3 = (ArrayList<Item>) request.getAttribute("v4"); 
				    int maxItemsToShow2 = 6; // 최대 표시할 상품 수
				    int itemCount2 = 0; // 표시된 상품 수를 추적하기 위한 변수
				    for (Item item : v3) { 
		                if (itemCount2 >= maxItemsToShow2) {
		                    break; // 최대 표시할 상품 수를 초과하면 반복 종료
		                }
		                itemCount2++;
				%>
		            <a href="../item/ItemView?it_uid=<%= item.getIt_uid() %>" style="flex: 0 0 auto;">
		                <img src="/upload_item/<%= item.getFile1_thumb() %>" style="width: 150px; height: 150px;">
		                <div style="margin-top: 5px; font-weight:bold;"><%= item.getIt_name() %></div>
		                <div style="margin-top: 5px; font-weight: bold;">
    						<fmt:formatNumber value="<%= item.getIt_price() %>" pattern="#,###원"/>
						</div>
		            </a>
		        <% } %>
		    </div>
		</div>
	</div>
</div>
</center>
	<div class="button-container">
  		<button id="toggleButton"><img src="/img/bot.png"></button>
	</div>

<div id="iframeContainer"></div>



<script src="script.js"></script>
  <%@ include file="../../include/footer.jsp" %>