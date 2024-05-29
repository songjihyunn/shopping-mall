<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix= "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Item" %>
<%@ include file="/include/header2.jsp" %>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.4.1.min.js"></script>

<!DOCTYPE html>
<html>
<head>
    <title>검색 결과</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .container {
            width: 80%;
            max-width: 1200px;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
        }
        h1 {
            text-align: center;
            margin-bottom: 20px;
        }
        .search-header {
            text-align: center;
            font-size: 24px;
            margin-bottom: 20px;
        }
        .gallery {
        display: flex;
        flex-wrap: wrap;
        background-color: white; /* 배경을 흰색으로 설정 */
	    }
	
	    .gallery-item {
	        width: 20%; /* 한 줄에 5개씩 정렬하려면 20%로 설정 */
	        padding: 10px;
	        box-sizing: border-box;
	        text-align: center; /* 텍스트를 가운데로 정렬 */
	    }
	
	    .gallery-item img {
	        width: 100%; /* 이미지를 가득 채우도록 설정 */
	        height: auto;
	    }
        .gallery-item:hover {
            transform: translateY(-5px);
        }

        .gallery-item div {
            font-size: 16px;
            color: #333;
        }
        .pagination {
            margin: 20px 0;
            text-align: center;
        }
        .pagination a {
            margin: 0 5px;
            padding: 8px 16px;
            text-decoration: none;
            color: #007bff;
            border: 1px solid #ddd;
            border-radius: 4px;
            transition: background-color 0.2s, color 0.2s;
        }
        .pagination a:hover {
            background-color: #007bff;
            color: #fff;
        }
        .pagination .current-page {
            margin: 0 5px;
            padding: 8px 16px;
            color: #fff;
            background-color: #007bff;
            border: 1px solid #007bff;
            border-radius: 4px;
        }
        .page_on {
            padding: 0px 5px;
            color: red;
            border: 1px solid red;
            font-weight: bold;
        }
        .page_off {
            padding: 0px 5px;
            color: black;
            border: 1px solid black;
        }
    </style>
</head>
<body style= "background-color: white;">
    <div class="container">
       <div class="search-header">
    '<c:out value="${search}" />'를 검색한 결과
</div>

<c:choose>
    <c:when test="${not empty searchResults}">
        <div class="gallery">
            <c:forEach var="item" items="${searchResults}">
                <c:if test="${fn:contains(item.it_name, search)}">
                    <div class="gallery-item">
                        <img src="/upload_item/${item.file1_thumb}" alt="${item.it_name}">
                        <div>${item.it_name}</div>
                        <div>${item.it_price}원</div>
                    </div>
                </c:if>
            </c:forEach>
        </div>
    </c:when>
    <c:otherwise>
        <div style="text-align: center; font-size: 30px; margin-top: 100px;">
            검색한 결과가 없습니다.
        </div>
    </c:otherwise>
</c:choose>


</div>
        <!-- 페이징 처리 -->
        <div class="pagination">
            <c:if test="${count > 0}">
                <c:set var="pageCount" value="${count / pageSize + (count % pageSize == 0 ? 0 : 1)}" />
                <fmt:parseNumber var="pageCount" value="${pageCount}" integerOnly="true" />

                <!-- 두 개의 변수 초기화 -->
                <c:set var="startPage" value="1" />
                <c:set var="pageBlock" value="3" />

                <!-- 두 번째 이상 블럭을 실행할 경우 startPage 값 변경 부분 -->
                <c:if test="${pageNum > pageBlock}">
                    <fmt:parseNumber var="result" value="${pageNum / pageBlock - (pageNum % pageBlock == 0 ? 1 : 0)}" integerOnly="true" />
                    <c:set var="startPage" value="${result * pageBlock + 1}" />
                </c:if>

                <!-- endPage 값 설정 부분 -->
                <c:set var="endPage" value="${startPage + pageBlock - 1}" />
                <!-- 마지막 블럭일 경우 endPage 값 설정 부분 -->
                <c:if test="${endPage > pageCount}">
                    <c:set var="endPage" value="${pageCount}" />
                </c:if>

                <!-- 이전 링크 -->
                <c:if test="${startPage > pageBlock}">
                    <a href="search?pageNum=${startPage - pageBlock}&field=${field}&search=${search}">[이전]</a>
                </c:if>

                <!-- 페이징 링크 -->
                <c:forEach var="i" begin="${startPage}" end="${endPage}">
                    <c:choose>
                        <c:when test="${pageNum == i}">
                            <span class="page_on"><font color="red"><b>${i}</b></font></span>
                        </c:when>
                        <c:otherwise>
                            <a href="search?pageNum=${i}&field=${field}&search=${search}"><span class="page_off">${i}</span></a>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                <!-- 다음 링크 -->
                <c:if test="${endPage < pageCount}">
                    <a href="search?pageNum=${startPage + pageBlock}&field=${field}&search=${search}">[다음]</a>
                </c:if>
            </c:if>
        </div>
    </div>
</body>
</html>


