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
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.4.1.min.js"></script>
</head>
<body>
<div style="width: 1300px; height: 1080px; position: relative; background: white; margin: 0 auto;">
<div style="width: 778px; height: 878px; left: 366px; top: 100px; position: relative; flex-direction: column; justify-content: flex-start; align-items: flex-start; gap: 40px; display: inline-flex">
  <!-- 회원가입 글씨 -->
  <div style="left: 330px; top: 5px; position: absolute; text-align: center; color: #333333; font-size: 32px; font-family: Poppins; font-weight: bold; word-wrap: break-word">회원가입</div>
  <form action="join" method="post">
  <!-- ID -->
  <div style="height: 86px; left: 0px; top: 62px; position: absolute; flex-direction: column; justify-content: flex-start; align-items: flex-start; gap: 4px; display: flex">
    <div style="width: 591px; height: 27px; position: relative">
      <div style="left: 0px; top: 0px; position: absolute; color: #666666; font-size: 16px; font-family: Poppins; font-weight: 400; word-wrap: break-word">ID</div>
    </div>
    <div style="width: 710px; height: 55px; position: relative; display: flex; align-items: center;">
	  <input type="text" id="mb_id" name="mb_id" required style="flex: 1; height: 100%; border-radius: 12px; overflow: hidden; border: 1px rgba(102, 102, 102, 0.35) solid; padding: 0 8px; box-sizing: border-box;">
	  <span onclick="id_select(mb_id.value)" style="padding-top: 16px; height: 100%; text-align: center; color: black; font-size: 20px; font-family: Poppins; font-weight: 500; cursor: pointer; font-weight: bold; margin-left: 8px;">[중복확인]</span>
	  <div id="id_result" style="width: 100%;  position: absolute; top: calc(100% + 5px); left: 0; font-size: 16px; font-family: Poppins; font-weight: 400; color: black;"></div>
	</div>
  </div>
  <!-- 비밀번호 -->
  <div style="height: 86px; left: -3px; top: 184px; position: absolute; flex-direction: column; justify-content: flex-start; align-items: flex-start; gap: 4px; display: flex">
    <div style="width: 710px; height: 27px; position: relative">
      <div style="left: 0px; top: 0px; position: absolute; color: #666666; font-size: 16px; font-family: Poppins; font-weight: 400; word-wrap: break-word">Password</div>
    </div>
    <div style="width: 710px; height: 55px; position: relative; ">
      <input type="text" id="mb_pass" name="mb_pass" required style="width: 100%; height: 100%; overflow: hidden; border: 1px rgba(102, 102, 102, 0.35) solid; padding: 0 8px; position: absolute; justify-content: flex-start; align-items: center; display: inline-flex; border-radius: 12px;font-family: Poppins; font-weight: 400; word-wrap: break-word">
	</div>
  </div>
  <!-- 이름 -->
  <div style="height: 86px; left: -3px; top: 292px; position: absolute; flex-direction: column; justify-content: flex-start; align-items: flex-start; gap: 4px; display: flex">
    <div style="width: 710px; height: 27px; position: relative">
      <div style="left: 0px; top: 0px; position: absolute; color: #666666; font-size: 16px; font-family: Poppins; font-weight: 400; word-wrap: break-word">Name</div>
    </div>
    <div style="width: 710px; height: 55px; position: relative; ">
      <input type="text" id="mb_name" name="mb_name" required style="width: 100%; height: 100%; border-radius: 12px; overflow: hidden; border: 1px rgba(102, 102, 102, 0.35) solid; padding: 0 8px; position: absolute; justify-content: flex-start; align-items: center; display: inline-flex;padding: 0 8px; font-family: Poppins; font-weight: 400; word-wrap: break-word">
	</div>
  </div>
  <!-- 이메일 -->
  <div style="height: 86px; left: 0px; top: 401px; position: absolute; flex-direction: column; justify-content: flex-start; align-items: flex-start; gap: 4px; display: flex">
    <div style="width: 591px; height: 27px; position: relative">
      <div style="left: 0px; top: 0px; position: absolute; color: #666666; font-size: 16px; font-family: Poppins; font-weight: 400; word-wrap: break-word">E-mail</div>
    </div>
    <div style="width: 710px; height: 55px; position: relative; display: flex; align-items: center;">
	    <input type="email" id="mb_email" name="mb_email" required style="flex: 1; height: 100%; border-radius: 12px; overflow: hidden; border: 1px rgba(102, 102, 102, 0.35) solid; padding: 0 8px;">
	    <span id="verificationButton" onclick="sendVerificationCode()" style="padding-top: 16px; height: 100%; text-align: center; color: black; font-size: 20px; font-family: Poppins; font-weight: 500; cursor: pointer; font-weight: bold; margin-left: 8px;">[인증번호 받기]</span>
	</div>
  </div>
  <div style="width: 300px; height: 37px; left: 0px; top: 500px; position: relative; display: flex; align-items: center;">
    <input type="number" id="verificationCode" name="verificationCode" placeholder="인증번호 입력" style="width: 100%; flex: 1; height: 100%; border-radius: 12px; overflow: hidden; border: 1px rgba(102, 102, 102, 0.35) solid; font-family: Poppins; font-weight: 400; word-wrap: break-word; padding-left: 8px;">
    <span onclick="checkVerificationCode()" style="cursor: pointer; margin-left: 8px; font-weight: bold; cursor: pointer; font-weight; bold;">[인증번호 확인]</span>
  </div>
  <!-- 나이 -->
  <div style="height: 86px; left: 0px; top: 554px; position: absolute; flex-direction: column; justify-content: flex-start; align-items: flex-start; gap: 4px; display: flex">
    <div style="width: 186px; height: 27px; position: relative">
      <div style="left: 0px; top: 0px; position: absolute; color: #666666; font-size: 16px; font-family: Poppins; font-weight: 400; word-wrap: break-word">나이</div>
    </div>
    <div style="width: 186px; height: 55px; position: relative; ">
      <input type="number" id="mb_age" name="mb_age" required style="width: 100%; height: 100%; position: absolute; justify-content: flex-start; align-items: center; display: inline-flex; border-radius: 12px; overflow: hidden; border: 1px rgba(102, 102, 102, 0.35) solid;font-family: Poppins; font-weight: 400; word-wrap: break-word; padding: 0 8px;">
	</div>
  </div>
  <!-- 성별 -->
  <div style="width: 191px; height: 27px; left: 217px; top: 554px; position: absolute">
	<div style="left: 0px; top: 0px; position: absolute; color: #666666; font-size: 16px; font-family: Poppins; font-weight: 400; word-wrap: break-word">성별</div>
  </div>
  <div style="width: 240px; height: 56px; left: 217px; top: 594px; position: absolute; border-radius: 5px; overflow: hidden; border: none">
    <input type="radio" id="femaleRadio" name="mb_gender" value="F">
	<label for="femaleRadio" style="font-size: 20px; padding-right: 20px; font-weight: bold;">여자</label>

    <input type="radio" id="maleRadio" name="mb_gender" value="M">
	<label for="maleRadio" style="font-size: 20px; padding-right: 20px; font-weight: bold;">남자</label>
  </div>
  <!-- 자기소개 -->
  <div style="width: 710px; height: 118px; left: 0px; top: 663px; position: absolute; flex-direction: column; justify-content: flex-start; align-items: flex-start; gap: 4px; display: flex">
    <div style="width: 710px; height: 27px; position: relative">
      <div style="left: 0px; top: 0px; position: absolute; color: #666666; font-size: 16px; font-family: Poppins; font-weight: 400; word-wrap: break-word">자기소개</div>
    </div>
    <div style="width: 710px; height: 87px; position: relative; ">
      <textarea name="mb_memo" style="height: 100%; width: 100%; height: 100%; resize: none; border-radius: 12px; overflow: hidden; border: 1px rgba(102, 102, 102, 0.35) solid; padding: 5px 8px;"></textarea>
    </div>
  </div>
  <!-- 회원가입 버튼 -->
  <div style="width: 741px; height: 64px; top: 802px; position: absolute; flex-direction: column; justify-content: flex-start; align-items: flex-start; gap: 8px; display: flex; border-radius: 40px; background-color: #1A1919;">
    <button id = "joinButton" style="width: 100%; height: 100%; top: 0px; position: absolute; background-color: #1A1919; border-radius: 40px; overflow: hidden">
      <div style="left: 310.50px; top: 15px; position: absolute; color: white; justify-content: center; align-items: center; gap: 8px; display: inline-flex">
        <div style="text-align: center; color: white; font-size: 22px; font-family: Poppins; font-weight: 500; word-wrap: break-word">회원가입</div>
      </div>
    </button>
  </div>
  </form>
</div>
</div>
<script>
    // 수정 버튼에 클릭 이벤트를 추가합니다.
    document.getElementById("joinButton").addEventListener("click", function() {
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
            alert("회원가입이 완료되었습니다.");
        }
    });
</script>
<script>
function id_select(str){
	$.ajax({
		url: "id_ok", //전송 페이지 경로
		type: "post", //데이터 전송 방식
		dataType: "text",
		data: "id="+str,
		error:function(){ //실패일 경우
			alert("실패");
		},
		success:function(num){ //성공일 경우
			if(num == "4") {
				msg = "<font color=red>아이디는 4자 이상으로 입력하세요.</font>";
			}else if(num == 1) {
				msg = "<font color=red>이미 존재하는 아이디입니다.</font>";
			}else if(num == 0) {
				msg = "<font color=blue>사용 가능한 아이디입니다.</font>";
			}
			$("#id_result").html(msg);
		}
	});
}

</script>
<script>
function sendVerificationCode() {
    var email = document.getElementById("mb_email").value;

    var xhr = new XMLHttpRequest();
    xhr.open("POST", "/mailSend", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            if (xhr.status === 200) {
                alert("인증번호를 발송하였습니다."); // 성공 시 결과를 alert로 표시
            } else {
                alert("인증번호 발송에 실패했습니다."); // 실패 시 메시지 표시
            }
        }
    };
    var data = "receiver=" + encodeURIComponent(email);
    xhr.send(data);
}
function checkVerificationCode() {			
    var codeElement = document.getElementById("verificationCode");
    if (codeElement) {
        var code = codeElement.value;
     	// 새로운 XMLHttpRequest 객체를 생성합니다.
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "/check_Number", true);
    	// 요청 헤더에 Content-Type을 설정하여 서버에 전달되는 데이터가 인코딩된 형식을 지정합니다.
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
        xhr.onreadystatechange = function () {
        	// 서버로부터의 응답이 완료되면 실행됩니다.
        	if (xhr.readyState === 4) {
        		// 서버 응답의 HTTP 상태 코드가 200(성공)이면 실행됩니다.
        	    if (xhr.status === 200) {
        	    	// 서버 응답 텍스트를 가져온 후 양 끝의 공백을 제거하여 변수에 할당합니다.
                    var responseText = xhr.responseText.trim();
                    if (responseText === "인증되었습니다.") {
                    	alert(xhr.responseText);
                        // 인증에 성공한 경우에만 회원가입 버튼 활성화
                    	document.getElementById("joinButton").disabled = false;
                    } else {
                        // 인증에 실패한 경우 회원가입 버튼을 비활성화
                        document.getElementById("joinButton").disabled = true;
                        // 사용자에게 알림을 표시
                        alert("인증번호가 다릅니다.");
                    }
                } else {
                    alert("인증번호 확인에 실패했습니다.");
                }
            }

        };
        var data = "verificationCode=" + encodeURIComponent(code);
        xhr.send(data);
    } else {
        alert("Verification code element not found.");
    }
}
</script>

</body>
</html>