package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

import dto.Member;
// 회원관리
public class MemberDAO {
	
	//사용할 객체 미리 선언
	Statement stmt;
	PreparedStatement pstmt;
	ResultSet rs;
	
	DAO d = new DAO();	//d.getCon(), d.conn 사용목적
	
	//회원가입
	public void insertMember(Member m) {
		d.getCon();//데이터베이스 접속
		
		try {
			String sql = "insert into member values (?,?,?,?,?,?,?,?,?,?,?)";
			
			pstmt = d.con.prepareStatement(sql);	//d 객체가 가지고 있는 con 객체가 가지고 있는 prepareStatement
			
			pstmt.setString(1,  m.getId());	//sql의 첫번째 물음표
			pstmt.setString(2,  m.getPass());
			pstmt.setString(3,  m.getName());
			pstmt.setInt(4,  m.getAge());
			pstmt.setString(5,  m.getGender());
			pstmt.setString(6,  m.getEmail());
			pstmt.setString(7,  m.getLevel());
			pstmt.setString(8,  m.getMemo());
			pstmt.setString(9, m.getStatus());
			pstmt.setString(10, m.getSigndate());
			pstmt.setString(11, "로컬");
			
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				d.con.close();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	//회원수정
	public void updateMember(Member m) {
		d.getCon();//데이터베이스 접속
		
		try {
			String str="";
			if(m.getPass() != null & !m.getPass().equals("")) {	//비밀번호 변경 포함
				str=", pass='"+m.getPass()+"'";
			}
			
			String sql = "update member set name=?, age=?, gender=?, email=?, memo=?"+str+" where id=?";
			pstmt = d.con.prepareStatement(sql);	//d 객체가 가지고 있는 con 객체가 가지고 있는 prepareStatement
			
			pstmt.setString(1,  m.getName());
			pstmt.setInt(2,  m.getAge());
			pstmt.setString(3,  m.getGender());
			pstmt.setString(4,  m.getEmail());
			pstmt.setString(5,  m.getMemo());
			pstmt.setString(6,  m.getId());
			
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				d.con.close();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	//로그인
	public Member loginMemberSelect(String id, String pass) {	//Member 클래스 타입으로 반환
		d.getCon(); // db connection
		
		Member m = new Member();
		
		try {
			String sql = "select * from member where id=? and pass=?";	//홀따옴표('') 신경 X
			
			pstmt = d.con.prepareStatement(sql);
			
			pstmt.setString(1,  id);
			pstmt.setString(2,  pass);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				m.setId(rs.getString("id"));	//id: 데이터베이스 테이블 칼럼명
				m.setName(rs.getString("name"));
				m.setLevel(rs.getString("level"));	
				m.setStatus(rs.getString("status"));
			}
			
			rs.close();
			pstmt.close();
			d.con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return m;
	}
	
	//회원정보
	public Member oneMember(String id) {
		d.getCon(); //DB 접근
		
		Member m = new Member();
		
		try {
			String sql = "select * from member where id=?";
			pstmt = d.con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				m.setId(rs.getString("id"));	//id: 데이터베이스 테이블 칼럼명
				m.setPass(rs.getString("pass"));
				m.setName(rs.getString("name"));
				m.setAge(rs.getInt("age"));
				m.setGender(rs.getString("gender"));
				m.setEmail(rs.getString("email"));
				m.setLevel(rs.getString("level"));
				m.setMemo(rs.getString("memo"));
				m.setStatus(rs.getString("status"));
				m.setSigndate(rs.getString("signdate"));
				m.setConnecttype(rs.getString("connecttype"));
			}
			
			rs.close();
			pstmt.close();
			d.con.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return m;
	}
	
	//회원 아이디 존재여부
	public int loginSelect(String id) {
		d.getCon();
		
		int num = 0;
		
		if(id.length() < 4) {
			num = 4;
		}else {
			try {
				String sql = "select count(*) from member where id=?";
				pstmt = d.con.prepareStatement(sql);
				pstmt.setString(1, id);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					num = rs.getInt(1);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return num;
	}
	//회원가입 - 카카오//////////////////////////////////////////////수정
	public void insertMemberApi(String id, String signdate) {
		d.getCon();

		//오늘 날짜
		Date today = new Date();
		SimpleDateFormat cal = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		signdate = cal.format(today);
		
		try {
			String sql = "insert into member (id,email,connecttype, level, status, signdate) values (?,?,?,?,?,?)";
			pstmt = d.con.prepareStatement(sql);

			pstmt.setString(1, id);
			pstmt.setString(2, id);
			pstmt.setString(3, "카카오");
			pstmt.setString(4, "1");
			pstmt.setString(5, "정상");
			pstmt.setString(6, signdate);

			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				pstmt.close(); //사용 객체 닫음
				d.con.close(); //사용 객체 닫음
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	//회원가입 - 네이버//////////////////////////////////////////////수정
	public void insertMemberApi2(String id, String signdate) {
		d.getCon(); //데이터베이스 연결
		
		//오늘 날짜
		Date today = new Date();
		SimpleDateFormat cal = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		signdate = cal.format(today);
		
		try {
			String sql = "insert into member (id,email,connecttype, level, status, signdate) values (?,?,?,?,?,?)";
			pstmt = d.con.prepareStatement(sql);

			pstmt.setString(1, id);
			pstmt.setString(2, id);
			pstmt.setString(3, "네이버");
			pstmt.setString(4, "1");
			pstmt.setString(5,  "정상");
			pstmt.setString(6,  signdate);

			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				d.con.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	//아이디 찾기
	public Member findUserId(String name, String email) {
	    d.getCon();
	    
	    Member m = new Member();
	    
	    try {
	        String sql = "SELECT id FROM member WHERE name=? AND email=?"; // 이름과 이메일을 조건으로 아이디를 조회
	        
	        pstmt = d.con.prepareStatement(sql);
	        
	        pstmt.setString(1, name);
	        pstmt.setString(2, email);
	        
	        rs = pstmt.executeQuery();

	        if(rs.next()) {
	            m.setId(rs.getString("id"));
	        }
	        
	        rs.close();
	        pstmt.close();
	        d.con.close();
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
	    return m;
	}
	//비밀번호 찾기
	public Member findUserPass(String id) {
	    d.getCon();
	    
	    Member m = new Member();
	    
	    try {
	        String sql = "SELECT pass FROM member WHERE id=?"; // 이름과 이메일을 조건으로 아이디를 조회
	        
	        pstmt = d.con.prepareStatement(sql);
	        
	        pstmt.setString(1, id);
	        
	        rs = pstmt.executeQuery();

	        if(rs.next()) {
	            m.setPass(rs.getString("pass"));
	        }
	        
	        rs.close();
	        pstmt.close();
	        d.con.close();
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
	    return m;
	}
	
}
