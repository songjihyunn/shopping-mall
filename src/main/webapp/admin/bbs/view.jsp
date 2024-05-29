<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="/admin/include/header.jsp" %>
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
    <!-- 전체div -->
<div class="table-container" style="width: 1600px; height: 900px; position: absolute; background: white; display: flex; justify-content: center;">
    <div class="MainLayout" align="center" style="width: 900px; height: 100%; position: absolute; padding-left: 0px; padding-right: 45px; padding-top: 40px; padding-bottom: 40px; justify-content: flex-start; align-items: flex-start; gap: 45px; display: inline-flex;">
	  <!-- 게시물 -->
	  <div style="width= 500px"></div>
	  <div class="PostComments" style="flex-direction: column; justify-content: flex-start; align-items: center; gap: 20px; display: inline-flex">
	    <div class="PostFull" style="width: 725px; height: 634px; padding-left: 40px; padding-right: 40px; padding-top: 50px; padding-bottom: 50px; background: white; box-shadow: 2px 1px 5px rgba(0, 0, 0, 0.15); border-radius: 5px; overflow: hidden; flex-direction: column; justify-content: flex-start; align-items: flex-start; gap: 20px; display: flex; border: 1px solid #BCC0C5">
	      <div class="Head" style="width: 645px; height: 40px; position: relative">
	        <div class="Group5" style="width: 212px; height: 32px; left: 0px; top: 4px; position: absolute">
	          <div class="Time" style="width: 212px; left: 0px; top: 20px; position: absolute; color: #808080; font-size: 10px; font-family: Roboto; font-weight: 700; letter-spacing: 0.50px; word-wrap: break-word">${b.signdate}</div>
	          <div class="Nikcname" style="width: 130px; left: 0px; top: 0px; position: absolute; color: black; font-size: 13px; font-family: Roboto; font-weight: 700; letter-spacing: 0.65px; word-wrap: break-word">작성자:  ${b.id}</div>
	        </div>
	        <div class="Group6" style="width: 123px; height: 32px; left: 281px; top: 1px; position: absolute">
	          <c:if test="${session_level == '10'}">
	            <div class="Nikcname" style="left: 0px; top: 0px; position: absolute; color: black; font-size: 13px; font-family: Roboto; font-weight: 400; letter-spacing: 0.65px; word-wrap: break-word"><input type="radio" name="gongji" value="1">공지</div>
	          </c:if>
	            <div class="Nikcname" style="left: 0px; top: 20px; position: absolute; color: black; font-size: 13px; font-family: Roboto; font-weight: 400; letter-spacing: 0.65px; word-wrap: break-word"><input type="radio" name="gongji" value="2" checked>일반</div>
	            <div class="Nikcname" style="left: 0px; top: 0px; position: absolute; color: black; font-size: 13px; font-family: Roboto; font-weight: 400; letter-spacing: 0.65px; word-wrap: break-word"><input type="radio" name="gongji" value="3">비밀</div>
	        </div>
	      </div>
	      <div style="align-self: stretch; color: black; font-size: 18px; font-family: Roboto; font-weight: 700; word-wrap: break-word; text-align:left">제목: ${b.subject}</div>
	      <div class="Code" style="width: 645px; height: 300px; padding-top: 10px; padding-bottom: 10px; background: #EAEAEA">
	      	<div style="align-self: stretch; height: 271px; color: black; font-size: 14px; font-family: Roboto; font-weight: 400; line-height: 25px; word-wrap: break-word; text-align:left"> <img src="/upload_item/${b.file1}" style="width: 100px; height: 100px;"><br>${b.comment}</div>
	      </div>
	     
	      <div class="Submenu" style="width: 645px; height: 38px; position: relative; background: white"></div>
	      <div style="width: 161px; text-align: center; color: #808080; font-size: 18px; font-family: Roboto; font-weight: 500; line-height: 25px; letter-spacing: 0.90px; word-wrap: break-word">댓글</div>
		    <div class="SuggestBlock" style="height: 143px; padding-left: 40px; padding-right: 40px; padding-top: 30px; padding-bottom: 30px; background: white; box-shadow: 2px 1px 5px rgba(0, 0, 0, 0.15); flex-direction: column; justify-content: flex-start; align-items: flex-end; gap: 10px; display: flex">
		
		      <!-- 댓글 등록 -->
		     <form action="bbscommentin" method="post">
		        <input type="hidden" name="uid" value="${b.uid}" />
		        <input type="hidden" name="pageNum" value="${param.pageNum}" />
		        <input type="hidden" name="field" value="${param.field}" />
		        <input type="hidden" name="search" value="${param.search}" /> 
			      <div class="Frame4" style="width: 640px; top:-30px; height: 43px; position: relative; border-radius: 5px; border: 2px #EAEAEA solid">
			        <input style="width: 640px; height: 43px; position: relative; border-radius: 5px; border: 1px solid #BCC0C5" id="tb_comment" name="tb_comment">
			        <div class="Frame5" style="padding: 10px; left: 0px; top: 0px; position: absolute; justify-content: flex-start; align-items: center; gap: 10px; display: inline-flex">
			          <div class="TypeHereYourWiseSuggestion" style="color: #808080; font-size: 12px; font-family: Roboto; font-weight: 300; letter-spacing: 0.24px; word-wrap: break-word"></div>
			        </div>
			      </div>
			      <div class="Frame3" style="justify-content: flex-start; align-items: center; gap: 10px; display: inline-flex">
			        <button class="Button" style="width: 99px; padding-left: 20px; padding-right: 20px; padding-top: 12px; top: -100px; border:0; padding-bottom: 12px; background: #1A1919; border-radius: 5px; overflow: hidden; justify-content: flex-start; align-items: center; gap: 12px; display: flex">
			          <div class="Suggest" style="width: 59px; height: 12px; color: white; font-size: 12px; font-family: Roboto; font-weight: 900; letter-spacing: 0.24px; word-wrap: break-word">댓글달기</div>
			        </button>
			      </div>
			  </form>
			</div>	
	    </div>
	    <!-- 댓글 반복 -->
	    <c:set var="number" value="${number}" />
	    <c:forEach var="list" items="${v}" varStatus="status">
	     <c:if test="${status.count % 2 == 1}">
	    <div class="LevelComment" style="background: white; box-shadow: 2px 1px 5px rgba(0, 0, 0, 0.15); justify-content: flex-start; align-items: center; display: inline-flex; border: 1px solid #BCC0C5;">
	      <div class="Indicator" style="width: 10px; align-self: stretch; opacity: 0.50; background: #1682FD"></div>
	      <div class="Content" style="width: 715px; padding-left: 40px; padding-right: 40px; padding-top: 20px; padding-bottom: 20px; flex-direction: column; justify-content: flex-start; align-items: flex-start; gap: 10px; display: inline-flex">
	        <div class="Text" style="align-self: stretch;text-align:left">
	        	<span style="color: black; font-size: 14px; font-family: Roboto; font-weight: 500; line-height: 25px; letter-spacing: 0.70px; word-wrap: break-word; text-align: left"> ${list.tb_id}: </span>
	        	<span style="color: black; font-size: 14px; font-family: Roboto; font-weight: 300; line-height: 25px; letter-spacing: 0.70px; word-wrap: break-word;  text-align: left;">${list.tb_comment}</span>
	        </div>
	        <div class="Bottom" style="align-self: stretch; flex-direction: column; justify-content: flex-start; align-items: flex-start; display: flex">
	          <div class="Line2" style="align-self: stretch; height: 0px; border: 1px #EAEAEA solid"></div>
	          <div class="Dlr" style="width: 635px; height: 26px; position: relative">
	            <div class="Replly" style="padding-top: 10px; padding-bottom: 10px; left: 586px; top: 1px; position: absolute; justify-content: flex-start; align-items: center; gap: 5px; display: inline-flex">
	              <div class="CornerDownRight" style="width: 14px; height: 14px; position: relative">
	                <img src="../../upload_item/delet.png">
	              </div>
	              <div class="Reply" style="color: #1682FD; font-size: 12px; font-family: Roboto; font-weight: 300; letter-spacing: 0.24px; word-wrap: break-word"><a href="bbscommentde?tb_uid=${list.tb_uid }&uid=${uid}">삭제</a></div>
	            </div>
	            <div class="Frame1" style="padding-top: 10px; padding-bottom: 10px; left: 0px; top: 1px; position: absolute; justify-content: flex-start; align-items: center; gap: 10px; display: inline-flex">
	              <div class="Nikcname" style="color: #808080; font-size: 13px; font-family: Roboto; font-weight: 500; letter-spacing: 0.65px; word-wrap: break-word"></div>
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	    </c:if>
	    </c:forEach>
	  </div>
	</div>
</div>
</center>

<%@ include file="/admin/include/footer.jsp" %>
