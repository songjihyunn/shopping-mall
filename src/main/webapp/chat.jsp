<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<%@ include file="/include/header2.jsp" %>



<style>

	#main-container{

		width:500px;

		border:2px solid #cadef0;

		border-radius:2px;

	}

	#chat-container{

		border: 0px solid red;

		min-height: 500px;

		max-height: 500px;

		overflow: scroll;

		overflow-x:hidden;

		overflow-y:auto;

		background: #bacee0;

	}

	#bottom-container{

		margin:5px;

	}

	#bottom-container2{

		margin-bottom:5px;

	}

	#inputMessage{

		width:100%;

		height:30px;

		border:1px solid #bacee0;

		font-size:13px;

	}

	#btn-submit{

		background: #F7E600;

		width:60px;

		height:26px;

		color:#607080;

		border:none;

		border-radius:4px;

	}	

	.chat{

		font-size: 12px;

		color:#666;

		margin: 5px;

		padding: 3px 6px 4px 6px;

		text-align: left;

        height:auto;

        word-break : break-all;

        background: #ffffff;

        width:auto;

        display:inline-block;

        border-radius: 4px;

	}

	.my-chat{

		text-align: right;

		background: #ffeb33;

		border-radius: 4px;

		width:auto;

		padding: 3px 6px 4px 6px;

	}	

	.notice{

		color:#777;

		font-weight: bold;

		border : none;

		text-align: left;

		background-color: #cadef0;

		display: block;

	}



	.chat-info{

		color:#556677;

		font-size: 10px;

		text-align: right;

		padding: 5px;

		padding-top: 0px;

	}

	.chat-box{

		text-align:left;

	}

	.my-chat-box{

		text-align: right;

	}

</style>



<center>

<br>

	<div id="main-container">

		<div id="chat-container">



		</div>

		<div id="bottom-container">

			<input id="inputMessage">

		</div>

		<div id="bottom-container2">

			<input id="btn-submit" type="submit" value="전송" >

		</div>

	</div>

<br>

</center>



<script type="text/javascript">

	var webSocket = new WebSocket('ws://192.168.10.202:8080/webChatServer'); //로컬 호스트 아이피 적용

	var inputMessage = document.getElementById('inputMessage');



	webSocket.onerror = function(e){

		onError(e);

	};



	webSocket.onopen = function(e){

		onOpen(e);

	};



	webSocket.onmessage = function(e){

		onMessage(e);

	};



	function onMessage(e){

		var chatMsg = event.data;

		var date = new Date();

		var dateInfo = date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();



		if(chatMsg.substring(0,6) == 'notice'){

			var $chat = $("<div class='chat notice'>" + chatMsg + "</div>");

			$('#chat-container').append($chat);

		}else{

			var $chat = $("<div class='chat-box'><div class='chat'>" + chatMsg + "</div><div class='chat-info chat-box'>"+ dateInfo +"</div></div>");

			$('#chat-container').append($chat);

		}



		$('#chat-container').scrollTop($('#chat-container')[0].scrollHeight+20);

	}



	function onOpen(e){



	}



	function onError(e){

		alert(e.data);

	}



	function send(){

		var chatMsg = inputMessage.value;

		if(chatMsg == ''){

			return;

		}



		var date = new Date();

		var dateInfo = date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();

		var $chat = $("<div class='my-chat-box'><div class='chat my-chat'>" + chatMsg + "</div><div class='chat-info'>"+ dateInfo +"</div></div>");



		$('#chat-container').append($chat);



		webSocket.send(chatMsg);

		inputMessage.value = "";

		$('#chat-container').scrollTop($('#chat-container')[0].scrollHeight+20);

	}

</script>



<script type="text/javascript">

	$(function(){

		$('#inputMessage').keydown(function(key){ //글 입력후 엔터를 쳤을 때 실행

			if(key.keyCode == 13){

				$('#inputMessage').focus();

				send();

			}

		});

		$('#btn-submit').click(function(){

			send();

		});

	})

</script>



<%@ include file="/include/footer.jsp" %>