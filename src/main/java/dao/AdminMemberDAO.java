package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import dto.Member;

public class AdminMemberDAO {

	//사용할 객체를 미리 선언
	Statement stmt;
	PreparedStatement pstmt;
	ResultSet rs;
	
	DAO d = new DAO(); //d.getCon() , d.conn 사용 목적
	
	//총 회원 수
	public int getAllcount(String field,String search) {
		d.getCon();
		
		int count = 0;
		
		try {
			String sql = "select count(*) from member";
			if(search != null && !search.equals("")) {
				sql = "select count(*) from member where "+field+" like '%"+search+"%'";
			}
			
			pstmt = d.con.prepareStatement(sql);			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}			
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return count;
	}
	
	//회원목록
	public ArrayList<Member> getAllMember(int startRow,int endRow,String field,String search) {
		d.getCon();
		
		ArrayList<Member> v = new ArrayList<>();
		
		try {
			String sql = "select * from member order by signdate desc limit ?,?";
			if(search != null && !search.equals("")) {
				sql = "select * from member where "+field+" like '%"+search+"%' order by signdate desc limit ?,?";
			}
			
			pstmt = d.con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Member m = new Member();
				
				m.setId(rs.getString("id"));
				m.setPass(rs.getString("pass"));
				m.setName(rs.getString("name"));
				m.setAge(rs.getInt("age"));
				m.setGender(rs.getString("gender"));
				m.setEmail(rs.getString("email"));
				m.setLevel(rs.getString("level"));
				m.setMemo(rs.getString("memo"));
				m.setStatus(rs.getString("status"));
				m.setSigndate(rs.getString("signdate"));
				
				v.add(m);
			}
			
			rs.close();
			pstmt.close();
			d.con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return v;
	}
	
	//회원정보
	public Member oneMember(String id) {
		d.getCon();
		
		Member m = new Member();
		
		try {
			String sql = "select * from member where id=?";
			pstmt = d.con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				m.setId(rs.getString("id"));
				m.setPass(rs.getString("pass"));
				m.setName(rs.getString("name"));
				m.setAge(rs.getInt("age"));
				m.setGender(rs.getString("gender"));
				m.setEmail(rs.getString("email"));
				m.setLevel(rs.getString("level"));
				m.setMemo(rs.getString("memo"));
				m.setStatus(rs.getString("status"));
				m.setSigndate(rs.getString("signdate"));
			}
			
			rs.close();
			pstmt.close();
			d.con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return m;
	}
	
	//회원가입
	public void insertMember(Member m) {
		d.getCon(); //데이버베이스 접속
		
		try {
			String sql = "insert into member values (?,?,?,?,?,?,?,?,?,?)";
			
			pstmt = d.con.prepareStatement(sql);
			
			pstmt.setString(1, m.getId());
			pstmt.setString(2, m.getPass());
			pstmt.setString(3, m.getName());
			pstmt.setInt(4, m.getAge());
			pstmt.setString(5, m.getGender());
			pstmt.setString(6, m.getEmail());
			pstmt.setString(7, m.getLevel());
			pstmt.setString(8, m.getMemo());
			pstmt.setString(9, m.getStatus());
			pstmt.setString(10, m.getSigndate());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				d.con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}			
		}		
	}
	
	//회원수정
	public void updateMember(Member m) {
		d.getCon(); //데이버베이스 접속
		
		try {
			String str = "";
			if(m.getPass() != null && !m.getPass().equals("")) {
				str = ",pass='"+m.getPass()+"'";
			}
			
			String sql = "update member set name=?,age=?,gender=?,email=?,level=?,memo=?,status=?,signdate=?"+str+" where id=?";
			pstmt = d.con.prepareStatement(sql);			
			
			pstmt.setString(1, m.getName());
			pstmt.setInt(2, m.getAge());
			pstmt.setString(3, m.getGender());
			pstmt.setString(4, m.getEmail());
			pstmt.setString(5, m.getLevel());
			pstmt.setString(6, m.getMemo());
			pstmt.setString(7, m.getStatus());
			pstmt.setString(8, m.getSigndate());			
			pstmt.setString(9, m.getId());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				d.con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}			
		}
	}
	
	//회원삭제
	public void deleteMember(String id) {
		d.getCon();
		
		try {
			String sql = "delete from member where id=?";
			pstmt = d.con.prepareStatement(sql);			
			pstmt.setString(1, id);			
			pstmt.executeUpdate();
			
			pstmt.close();
			d.con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//아이디 존재여부
	public int loginSelect(String id) {
		d.getCon();
		
		int num = 0;
		
		try {
			String sql = "select count(*) from member where id=?";
			pstmt = d.con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				num = rs.getInt(1);
			}
			
			rs.close();
			pstmt.close();
			d.con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return num;
	}
}

















