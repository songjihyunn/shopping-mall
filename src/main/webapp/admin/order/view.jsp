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
    <table>
        <tr>
            <td colspan="2" style="font-weight: bold; color: #4b8b99; font-size: 18px;">개인정보</td>
        </tr>
        <tr>
            <td>이름</td>
            <td>${o.mb_name }</td>
        </tr>
        <tr>
            <td>아이디</td>
            <td>${o.mb_id }</td>
        </tr>
        <tr>
            <td colspan="2" style="font-weight: bold; color: #4b8b99; font-size: 18px;">상품정보</td>
        </tr>
        <tr>
            <td>상품명</td>
            <td>${o.od_name }</td>
        </tr>
        <tr>
            <td>상품 이미지</td>
            <td><img src="/upload_item/${o.od_image}" width="80px" height="80px"></td>
        </tr>
        <tr>
            <td>상품 사이즈</td>
            <td>${o.it_size }</td>
        </tr>
        <tr>
            <td>수량</td>
            <td>${o.it_qty}</td>
        </tr>
        <tr>
            <td>상품 포인트</td>
            <td>${o.it_point }</td>
        </tr>
        <tr>
            <td colspan="2" style="font-weight: bold; color: #4b8b99; font-size: 18px;">주문정보</td>
        </tr>
        <tr>
            <td>주문일자</td>
            <td>${o.od_date }</td>
        </tr>
        <tr>
            <td>주문번호</td>
            <td>${o.od_id }</td>
        </tr>
        <tr>
            <td>주문금액</td>
            <td><fmt:formatNumber value="${o.od_price*o.it_qty}" pattern="#,###원"/></td>
        </tr>
        <tr>
            <td>주문상태</td>
            <td>${o.ct_status}</td>
        </tr>
    </table>
    <button onclick="popup_close()">창 닫기</button>
</div>

<script>
    function popup_close(){
        self.close();
    }
</script>
</body>
</html>

