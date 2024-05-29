<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix= "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/include/header2.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원수정</title>
</head>
<body>
<div style="width: 1300px; height: 1080px; position: relative; background: white; margin: 0 auto;">
<div style="width: 794px; height: 892px; left: 366px; top: 100px; position: relative; flex-direction: column; justify-content: flex-start; align-items: flex-start; gap: 40px; display: inline-flex">
  <!-- 회원 수정 글씨 -->
  <div style="left: 316px; top: 11px; position: absolute; text-align: center; color: #333333; font-size: 32px; font-family: Poppins; font-weight: bold; word-wrap: break-word">회원수정</div>
  <form method="post">
  <!-- 아이디 -->
  <div style="height: 86px; left: 26px; top: 59px; position: absolute; flex-direction: column; justify-content: flex-start; align-items: flex-start; gap: 4px; display: flex">
    <div style="width: 710px; height: 27px; position: relative">
      <div style="left: 0px; top: 0px; position: absolute; color: #666666; font-size: 16px; font-family: Poppins; font-weight: 400; word-wrap: break-word">ID</div>
    </div>
    <div style="width: 710px; height: 55px; position: relative; ">
      <input type="text" name="mb_id" value="${modify.id }" required style="padding-left: 10px; width: 100%; height: 100%; border-radius: 12px; overflow: hidden; border: 1px rgba(102, 102, 102, 0.35) solid; position: absolute; justify-content: flex-start; align-items: center; display: inline-flex; font-size: 16px; font-family: Poppins; font-weight: 400; word-wrap: break-word">
    
    </div>
  </div>
  <!-- 비밀번호 -->
  <div style="height: 86px; left: 26px; top: 164px; position: absolute; flex-direction: column; justify-content: flex-start; align-items: flex-start; gap: 4px; display: flex">
    <div style="width: 710px; height: 27px; position: relative">
      <div style="left: 0px; top: 0px; position: absolute; color: #666666; font-size: 16px; font-family: Poppins; font-weight: 400; word-wrap: break-word">Password</div>
    </div>
    <div style="width: 710px; height: 55px; position: relative; ">
      <input type="text" name="mb_pass" required style=" padding-left: 10px; width: 100%; height: 100%; border-radius: 12px; overflow: hidden; border: 1px rgba(102, 102, 102, 0.35) solid; position: absolute; justify-content: flex-start; align-items: center; display: inline-flex; font-size: 16px; font-family: Poppins; font-weight: 400; word-wrap: break-word">
    </div>
  </div>
  <!-- 이름 -->
  <div style="height: 86px; left: 26px; top: 274px; position: absolute; flex-direction: column; justify-content: flex-start; align-items: flex-start; gap: 4px; display: flex">
    <div style="width: 710px; height: 27px; position: relative">
      <div style="left: 0px; top: 0px; position: absolute; color: #666666; font-size: 16px; font-family: Poppins; font-weight: 400; word-wrap: break-word">Name</div>
    </div>
    <div style="width: 710px; height: 55px; position: relative; ">
      <input type="text" name="mb_name" value="${modify.name }" required style="padding-left: 10px; width: 100%; height: 100%; border-radius: 12px; overflow: hidden; border: 1px rgba(102, 102, 102, 0.35) solid; position: absolute; justify-content: flex-start; align-items: center; display: inline-flex; font-size: 16px; font-family: Poppins; font-weight: 400; word-wrap: break-word">
    </div>
  </div>
  <!-- Email -->
  <div style="height: 86px; left: 29px; top: 384px; position: absolute; flex-direction: column; justify-content: flex-start; align-items: flex-start; gap: 4px; display: flex">
    <div style="width: 707px; height: 27px; position: relative">
      <div style="left: 0px; top: 0px; position: absolute; color: #666666; font-size: 16px; font-family: Poppins; font-weight: 400; word-wrap: break-word">E-mail</div>
    </div>
    <div style="width: 707px; height: 55px; position: relative;">
        <input type="text" name="mb_email" value="${modify.email }" required style="padding-left: 10px; width: 100%; height: 100%; border-radius: 12px; overflow: hidden; border: 1px rgba(102, 102, 102, 0.35) solid; position: absolute; justify-content: flex-start; align-items: center; display: inline-flex; font-size: 16px; font-family: Poppins; font-weight: 400; word-wrap: break-word">
    </div>
  </div>
  <!-- 나이 -->
  <div style="height: 86px; left: 29px; top: 494px; position: absolute; flex-direction: column; justify-content: flex-start; align-items: flex-start; gap: 4px; display: flex">
    <div style="width: 186px; height: 27px; position: relative">
      <div style="left: 0px; top: 0px; position: absolute; color: #666666; font-size: 16px; font-family: Poppins; font-weight: 400; word-wrap: break-word">나이</div>
    </div>
    <div style="width: 186px; height: 55px; position: relative; ">
        <input type="number" name="mb_age" value="${modify.age }" required style="padding-left: 10px; width: 100%; height: 100%; border-radius: 12px; overflow: hidden; border: 1px rgba(102, 102, 102, 0.35) solid; position: absolute; justify-content: flex-start; align-items: center; display: inline-flex; font-size: 16px; font-family: Poppins; font-weight: 400; word-wrap: break-word">
    </div>
  </div>
  <!-- 성별 -->
  <div style="width: 191px; height: 27px; left: 247px; top: 494px; position: absolute">
    <div style="left: 0px; top: 0px; position: absolute; color: #666666; font-size: 16px; font-family: Poppins; font-weight: 400; word-wrap: break-word">성별</div>
  </div>
  
  	<div style="width: 240px; height: 56px; left: 247px; top: 536px; position: absolute; border-radius: 5px; overflow: hidden; border: none">
	    <input type="radio" id="femaleRadio" name="mb_gender" value="F" <c:if test="${modify.gender == 'F' }">checked</c:if>>
		<label for="femaleRadio" style="font-size: 20px; padding-right: 20px; font-weight: bold;">여자</label>
	
	    <input type="radio" id="maleRadio" name="mb_gender" value="M" <c:if test="${modify.gender == 'M' }">checked</c:if>>
		<label for="maleRadio" style="font-size: 20px; padding-right: 20px; font-weight: bold;">남자</label>
	</div>
 <!-- 자기소개 -->
  <div style="width: 710px; height: 118px; left: 29px; top: 607px; position: absolute; flex-direction: column; justify-content: flex-start; align-items: flex-start; gap: 4px; display: flex">
    <div style="width: 710px; height: 27px; position: relative">
      <div style="left: 0px; top: 0px; position: absolute; color: #666666; font-size: 16px; font-family: Poppins; font-weight: 400; word-wrap: break-word">자기소개</div>
    </div>
    <div style="width: 710px; height: 87px; position: relative; ">
        <textarea name="mb_memo" style="padding-left: 10px; padding-top: 10px; width: 100%; height: 100%; position: absolute; justify-content: flex-start; align-items: center; display: inline-flex; border-radius: 12px; overflow: hidden; border: 1px rgba(102, 102, 102, 0.35) solid; font-size: 16px; font-family: Poppins; font-weight: 400; word-wrap: break-word">${modify.memo }</textarea>
    </div>
  </div>
  <div style="width: 794px; height: 64px; left: 0px; top: 766px; position: absolute; flex-direction: column; justify-content: flex-start; align-items: flex-start; gap: 8px; display: flex;background-color: #1a1919; border-radius: 40px; "> 
    <button id="modifyButton" style="width: 100%; height: 100%; top: 0px; position: absolute; background-color: #1A1919; border-radius: 40px; overflow: hidden">
	   	<div style="left: 353.50px; top: 15px; color: white; position: absolute; justify-content: center; align-items: center; gap: 8px; display: inline-flex">
	      <div style="text-align: center; color: white; font-size: 22px; font-family: Poppins; font-weight: bold; word-wrap: break-word">회원 수정</div>
	    </div>
    </button>
</div>
  </form>
</div>
</div>
<script>
    // 수정 버튼에 클릭 이벤트를 추가합니다.
    document.getElementById("modifyButton").addEventListener("click", function() {
        // 모든 입력 필드와 레이블이 채워져 있는지 확인합니다.
        var inputsAndLabels = document.querySelectorAll('input, textarea');
        var allFilled = true;
        inputsAndLabels.forEach(function(item) {
            if (item.value.trim() === '') {
                allFilled = false;
                return;
            }
        });

        // 모든 입력 필드와 레이블이 채워져 있으면 수정 완료 메시지를 표시합니다.
        if (allFilled) {
            alert("수정이 완료되었습니다.");
        }
    });
</script>



</body>
</html>