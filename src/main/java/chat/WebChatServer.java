package chat;

import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import dto.Member;

@ServerEndpoint("/webChatServer") //클라이언트에서 서버로 접속 할 주소로 지정
public class WebChatServer extends HttpServlet {

	private static Map<Session,Member> users = Collections.synchronizedMap(new HashMap<Session, Member>());

	@OnOpen //클라이언트에서 서버로 접속할 때 - 비회원 아이디,공지내용 작성 처리
	public void onOpen(Session session){
		String userName = "user";
		int rand_num = (int)(Math.random()*1000);		

		Member client = new Member();
		System.out.println(session);
		client.setName(userName+rand_num);

		System.out.println(session + " connect");

		users.put(session, client);
		sendNotice(client.getName() + "님이 입장하셨습니다. 현재 사용자 " + users.size() + "명");
	}

	//공지출력 처리
	public void sendNotice(String message){
		String userName = "notice";
		System.out.println(userName + " : " + message);

		synchronized (users) {
			Iterator<Session> it = users.keySet().iterator();
			while(it.hasNext()){
				Session currentSession = it.next();
				try {
					currentSession.getBasicRemote().sendText(userName + " ::: " + message);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}

	@OnMessage //클라이언트로 부터 메시지가 도착했을때 처리
	public void onMsg(String message, Session session) throws IOException{
		String userName = users.get(session).getName();
		System.out.println(userName + " : " + message);

		synchronized (users) {
			Iterator<Session> it = users.keySet().iterator();
			while(it.hasNext()){
				Session currentSession = it.next();
				if(!currentSession.equals(session)){
					currentSession.getBasicRemote().sendText(userName + " :: " + message);
				}
			}
		}
	}

	@OnClose //접속이 끊겼을때 처리
	public void onClose(Session session) {
		String userName = users.get(session).getName();
		users.remove(session);
		sendNotice(userName + "님이 퇴장하셨습니다. 현재 사용자 " + users.size() + "명");
	}

}
