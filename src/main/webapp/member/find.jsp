<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix= "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/include/header2.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호 찾기</title>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.4.1.min.js"></script>
<style>
body{}
body div{ border: 0px solid black;}
</style>
</head>
<body>
<div style="width: 1300px; height: 500px; position: relative; background: white; margin: 0 auto; top: 200px;">
<form action="find" method="post">
  <!-- 아이디 찾기 -->
  <div style="width: 631px; height: 500px; left: -44px; top: -70px; position: relative;">
  <!-- 아이디 찾기 버튼 -->
  	<button type="submit" name="btn" value="btn_id" style="width: 572px; height: 66px; left: 45px; top: 280px; position: absolute; background-color: #1A1919; border-radius: 40px; overflow: hidden">
    	<div style="left: 232.50px; top: 16px; position: absolute; justify-content: center; align-items: center; gap: 8px; display: inline-flex">
        	<div style="text-align: center; color: white; font-size: 22px; font-family: Poppins; font-weight: bold; word-wrap: break-word">아이디 찾기</div>
     	</div>
    </button>
    <!-- Name -->
    <div style="height: 86px; left: 59px; top: 58px; position: absolute; flex-direction: column; justify-content: flex-start; align-items: flex-start; gap: 4px; display: inline-flex">
      <div style="width: 509px; height: 27px; position: relative">
        <div style="left: 0px; top: 0px; position: absolute; color: #666666; font-size: 16px; font-family: Poppins; font-weight: 400; word-wrap: break-word">Name</div>
      </div>
      <div style="width: 509px; height: 55px; position: relative;">
          <input type="text" name="mb_name" required style="width: 100%; height: 100%; position: absolute; justify-content: flex-start; align-items: center; border-radius: 12px; overflow: hidden; border: 1px rgba(102, 102, 102, 0.35) solid; display: inline-flex; font-size: 16px; font-family: Poppins; font-weight: 400; word-wrap: break-word">
      </div>
    </div>
    <!-- E-mail -->
    <div style="height: 86px; left: 59px; top: 169px; position: absolute; flex-direction: column; justify-content: flex-start; align-items: flex-start; gap: 4px; display: inline-flex">
      <div style="width: 509px; height: 27px; position: relative">
        <div style="left: 0px; top: 0px; position: absolute; color: #666666; font-size: 16px; font-family: Poppins; font-weight: 400; word-wrap: break-word">E-mail</div>
      </div>
      <div style="width: 509px; height: 55px; position: relative; ">
          <input type="email" id="mb_email" name="mb_email" required style="width: 100%; height: 100%; border-radius: 12px; overflow: hidden; border: 1px rgba(102, 102, 102, 0.35) solid; position: absolute; justify-content: flex-start; align-items: center; display: inline-flex;font-size: 16px; font-family: Poppins; font-weight: 400; word-wrap: break-word">
      </div>
    </div>
    <!-- 아이디 찾기 글씨 -->
    <div style="left: 253px; top: -2px; position: absolute; text-align: center; color: #333333; font-size: 32px; font-family: Poppins; font-weight: bold; word-wrap: break-word">아이디 찾기</div>
  </div>
  </form>
  <form action="find" method="post">
  <!-- 비밀번호 찾기 -->
  <div style="width: 623px; height: 500px; left: 678px; top: -70px; position: absolute">
  <!-- ID -->
    <div style="height: 86px; left: 27px; top: 122px; position: absolute; flex-direction: column; justify-content: flex-start; align-items: flex-start; gap: 4px; display: inline-flex">
      <div style="width: 509px; height: 27px; position: relative">
        <div style="left: 0px; top: 0px; position: absolute; color: #666666; font-size: 16px; font-family: Poppins; font-weight: 400; word-wrap: break-word">ID</div>
      </div>
      <div style="width: 509px; height: 55px; position: relative; ">
          <input id="mb_id" name="mb_id" required style="height: 100%; width: 100%; position: absolute; justify-content: flex-start; align-items: center; display: inline-flex; border: 1px rgba(102, 102, 102, 0.60) solid; font-size: 16px; font-family: Poppins; font-weight: 400; word-wrap: break-word; border-radius: 12px; overflow: hidden;">
      </div>
    </div>
    <!-- 비밀번호 찾기 버튼 -->
    <button type="submit" name="btn" value="btn_pass" style="width: 564px; height: 66px; left: 0px; top: 282px; position: absolute; background-color: #1A1919; border-radius: 40px; overflow: hidden">
      <div style="left: 218px; top: 16px; position: absolute; justify-content: center; align-items: center; gap: 8px; display: inline-flex">
        <div style="text-align: center; color: white; font-size: 22px; font-family: Poppins; font-weight: bold; word-wrap: break-word">비밀번호 찾기</div>
      </div>
    </button>
    <!-- 비밀번호 찾기 글씨 -->
    <div style="left: 166px; top: 0px; position: absolute; text-align: center; color: #333333; font-size: 32px; font-family: Poppins; font-weight: bold; word-wrap: break-word">비밀번호 찾기</div>
  </div>
  </form>
</div>
</body>
</html>