<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/include/header2.jsp" %>

<script>
/* function cate_2(cate){
	$.ajax({
		url: "category_ok", //전송받을 페이지 경로
		type: "post", //데이터 전송 방식
		dataType: "text",
		data: "ca_id="+cate,
		error:function(){ //실패일 경우
			alert("실패");
		},
		success:function(text){ //성공일 경우
			$("#category2_result").html(text);
		}
	});
} */

function bbs_ok(){
	document.submit();
}
</script>
<style>
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
<center>
<div class="table-container" style="width: 1800px; height: 900px; position: absolute; background: white">
  <form  action="write"  method="post"  onsubmit="return validateForm();">
  	<input type="hidden" name="uid" value="${b.uid}">
	<input type="hidden" name="pageNum" value="${param.pageNum}">
	<input type="hidden" name="field" value="${param.field}">
	<input type="hidden" name="search" value="${param.search}">
    <div class="PostComments" style="width: 720px; height: 508px; top:60px; flex-direction: column; justify-content: flex-start; align-items: center; gap: 20px; display: inline-flex">
      <div class="AskBlock" style="height: 508px;  padding-left: 40px; padding-right: 40px; padding-top: 100px; padding-bottom: 30px; background: white; box-shadow: 2px 1px 5px rgba(0, 0, 0, 0.15); flex-direction: column; justify-content: flex-start; align-items: flex-start; gap: 20px; display: flex">
        <div class="Frame4" style="width: 640px; height: 34px; position: relative; border-radius: 5px; border: 2px #EAEAEA solid">
          <input id="subject" name="subject" class="Frame5" value="${b.subject}" style="width: 640px; height: 34px; position: relative; border-radius: 5px; border: 2px #EAEAEA solid">
          <div class="TypeCatchingAttentionTitle" style="color: #808080; font-size: 12px; font-family: Roboto; font-weight: 300; letter-spacing: 0.24px; word-wrap: break-word"> </div>
        </div>
        
        <div class="Frame5" style="width: 640px; height: 344px; position: relative; border-radius: 5px; border: 2px #EAEAEA solid">
          <textarea id="comment" name="comment" required style="width: 640px; height: 344px; position: relative; border-radius: 5px; border: 2px #EAEAEA solid">${b.comment}</textarea>
          <div class="Frame5" style="padding: 10px; left: 0px; top: 0px; position: absolute; justify-content: flex-start; align-items: center; gap: 10px; display: inline-flex">
            <div class="TypeYourQuestion" style="color: #808080; font-size: 12px; font-family: Roboto; font-weight: 300; letter-spacing: 0.24px; word-wrap: break-word"> </div>
          </div>
        </div>

       <div class="Frame3" style="width: 640px; height: 30px; position: relative">
          <Button style="height: 30px; padding-left: 20px; padding-right: 20px; padding-top: 12px; padding-bottom: 12px; left: 532px; top: 0px; background: #1A1919; border-radius: 5px; overflow: hidden; justify-content: flex-start; align-items: center; gap: 12px; display: inline-flex">
            <div style="color: white; font-size: 12px; font-family: Roboto; font-weight: 900; letter-spacing: 0.24px; word-wrap: break-word">글 쓰기</div>
          </Button>
        </div>
        
          <div class="Button" style="height: 30px; padding: 12px 20px; position: relative; background: #1682FD; border-radius: 5px; overflow: hidden; display: inline-flex; align-items: center; gap: 12px; cursor: pointer;">
			<input id="file1" type="file" name="file1" style="position: absolute; width: 100%; height: 100%; left: 0; top: 0; opacity: 0; cursor: pointer;">
			<input type="button" value="목록" onclick="location.href='list?pageNum=${param.pageNum }&field=${param.field}&search=${param.search}'"></div>
			<div class="Image" style="width: 13px; height: 13px; position: relative"></div>
			<div style="color: white; font-size: 12px; font-family: Roboto; font-weight: 900; letter-spacing: 0.24px;">이미지 추가하기</div>
		</div>
      </div>
    </form>
   </div>
</center>
<script>
function validateForm() {
    // 폼 데이터 가져오기
    var fieldName1 = document.getElementById("subject").value;
    var fieldName2 = document.getElementById("comment").value;
    
    // 폼 데이터 확인s
    console.log("fieldName1: " + fieldName1);
    console.log("fieldName2: " + fieldName2);
    
    // 폼 검증 로직 추가 (필요한 경우)
    // 데이터가 제대로 입력되었는지 검증
    
    // 폼을 제출할지 여부 반환
    return true; // true: 폼 제출 허용, false: 폼 제출 중지
}
</script>

<%@ include file="/include/footer.jsp" %>