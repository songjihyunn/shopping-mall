<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix= "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/include/header2.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Expires" content="-1">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="No-Cache">
<meta charset="UTF-8">
<title>로그인</title>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.4.1.min.js"></script>
</head>
<body>
<div style="width: 1300px; height: 500px; position: relative; background: white; margin: 0 auto; ">
<div style="width: 750px; height: 500px; position: relative; background: white; left: 300px;">
	<!-- 로그인 글씨 -->
  <div style="left: 331px; top: 133px; position: absolute; text-align: center; color: #333333; font-size: 32px; font-family: Poppins; font-weight: bold; word-wrap: break-word">로그인</div>
  
  <div style="width: 578px; left: 86px; top: 214px; position: absolute; flex-direction: column; justify-content: flex-start; align-items: flex-start; gap: 48px; display: inline-flex">
    <div style="width: 578px; flex-direction: column; justify-content: flex-start; align-items: flex-start; gap: 16px; display: flex">
      <!-- 카카오 로그인 -->
      <div style="width: 578px; height: 72px; position: relative; background: white; border-radius: 40px; overflow: hidden; border: 1px #333333 solid">
        <div style="left: 126px; top: 20px; position: absolute"></div>
        <div style="width: 32px; height: 32px; left: 150px; top: 22px; position: absolute">
          <img style="width: 28px; height: 28px; left: 2px; top: 2px; position: absolute; border-radius: 9999px" src="/img/Kakao.png" />
        </div>
        <div onclick="kakaoLogin()" style="cursor: pointer; width: 268px; height: 37px; left: 201px; top: 17px; position: absolute; color: black; font-size: 24px; font-family: Inter; font-weight: 400; word-wrap: break-word">Continue with Kakao</div>
      </div>
      <!-- 네이버 로그인 -->
      <div style="width: 578px; height: 72px; position: relative; background: white; border-radius: 40px; overflow: hidden; border: 1px #333333 solid">
        <div style="width: 341px; left: 133px; top: 17px; position: absolute; justify-content: center; align-items: center; gap: 16px; display: inline-flex">
          <div style="width: 32px; height: 32px; left: 12.50px; top: 2.50px; position: absolute">
            <img style="width: 28px; height: 28px; left: 2px; top: 2px; position: absolute; border-radius: 9999px" src="/img/Naver.png" />
          </div>
          <div id="naverIdLogin_loginButton" style="cursor: pointer;width: 268px; height: 37px; left: 73px; top: 0px; position: absolute; color: black; font-size: 24px; font-family: Inter; font-weight: 400; word-wrap: break-word">Continue with Naver</div>
        </div>
      </div>
    </div>
    <!-- OR -->
    <div style="width: 568px; height: 118px; left: 0px; top: 156px; position: absolute; justify-content: flex-start; align-items: center; gap: 23px; display: inline-flex">
      <div style="flex: 1 1 0; height: 2px; background: rgba(102, 102, 102, 0.25)"></div>
      <div style="color: #666666; font-size: 24px; font-family: Avenir; font-weight: 400; word-wrap: break-word">OR</div>
      <div style="flex: 1 1 0; height: 2px; background: rgba(102, 102, 102, 0.25)"></div>
    </div>
    <form action="login" method="post">
    <div style="width: 568px; height: 374px; left: 0px; top: 241px; position: absolute; flex-direction: column; justify-content: flex-start; align-items: flex-start; gap: 24px; display: flex">
      <!-- 아이디 -->
      <div style="height: 86px; flex-direction: column; justify-content: flex-start; align-items: flex-start; gap: 4px; display: flex">
        <div style="width: 568px; height: 27px; position: relative">
          <div style="left: 0px; top: 0px; position: absolute; color: #666666; font-size: 16px; font-family: Poppins; font-weight: 400; word-wrap: break-word">ID</div>
        </div>
        <div style="width: 568px; height: 55px; position: relative;">
        	<input type="text" name="mb_id" required style="padding-left: 5px;width: 100%; height: 100%; border-radius: 12px; overflow: hidden; border: 1px rgba(102, 102, 102, 0.35) solid;">
        </div>
      </div>
      <!-- 비밀번호 -->
      <div style="height: 86px; flex-direction: column; justify-content: flex-start; align-items: flex-start; gap: 4px; display: flex">
        <div style="width: 568px; height: 27px; position: relative">
          <div style="left: 0px; top: 0px; position: absolute; color: #666666; font-size: 16px; font-family: Poppins; font-weight: 400; word-wrap: break-word">Password</div>
        </div>
        <div style="width: 568px; height: 55px; position: relative; ">
        	<input type="password" name="mb_password" required style="padding-left: 5px;width: 100%; height: 100%; border-radius: 12px; overflow: hidden; border: 1px rgba(102, 102, 102, 0.35) solid">
        </div>
      </div>
      <!-- 아이디/비밀번호 찾기 -->
      <div onclick="location.href='/member/find';" style="cursor: pointer; left: 400px; top: 218px; position: absolute; text-align: right; color: #111111; font-size: 16px; font-family: Poppins; font-weight: 400; text-decoration: underline; word-wrap: break-word">아이디/비밀번호 찾기</div>
      <!-- 로그인 버튼 -->
      <button style="display: flex; align-items:center; justify-content: center; cursor: pointer; width: 568px; height: 64px; left: 0px; top: 264px; position: absolute; background-color: #1A1919; border-radius: 40px; overflow: hidden">
          <div style=" color: white; font-size: 22px; font-family: Poppins; font-weight: bold; word-wrap: break-word; position: absolute; gap: 8px;">
          	로그인
          </div>
      </button>
      </div>
      </form>
    </div>
  </div>
</div>
<!-- 네이버 스크립트 -->
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>


<script>
// 로그인 페이지 활성
var naverLogin = new naver.LoginWithNaverId(
	{
		clientId: "1bYKfvW_59UoGBrvr2YD", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
		callbackUrl: "http://localhost:8081/member/naverLogin", // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
		isPopup: false,
		callbackHandle: true
	}
);
naverLogin.init();

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

//카카오로그인
function kakaoLogin() {
	Kakao.Auth.login({
		success: function (response) {
			Kakao.API.request({
				url: '/v2/user/me',
				success: function (response) {
					console.log(response); //회원정보 객체
					//console.log("식별 아이디:"+response.id);
					console.log("이메일:"+response.kakao_account.email);

					//회원가입 처리 및 세션 처리
					$.ajax({
						url: "/member/kakao",
						type: "get",
						dataType: "text",
						data: "useremail="+response.kakao_account.email,
						success:function(num){
							//추가 내용 작성
							location.href="/member/modify"; //첫 페이지로 이동------------------수정
						}
					});
				},
				fail: function (error) {
					console.log(error)
				},
			})
		},
		fail: function (error) {
			console.log(error)
		},
	});
}

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
</body>
</html>