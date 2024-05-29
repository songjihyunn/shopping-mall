package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import dto.Review;

public class ReviewDAO {
	Statement stmt;
	PreparedStatement pstmt;
	ResultSet rs;
	
	DAO d = new DAO(); //d.getCon() , d.conn 사용 목적
	
		//총 게시물 수
	public int getAllcount(String field, String search, int uid) {
			
		d.getCon();
		int count = 0;
			
		try {
				
			String sql = "select count(*) from review where uid = ?";
			if(search != null && !search.equals("")) {
				sql = "select count(*) from review where uid = ? and "+field+" like '%"+search+"%'";
			}
			
			pstmt = d.con.prepareStatement(sql);
			pstmt.setInt(1, uid);
			rs = pstmt.executeQuery();
				
			if(rs.next()) {
				count = rs.getInt(1);
			}
				
			} catch (Exception e) {
				e.printStackTrace();
			}		
			return count;
		}
	
	//게시판목록
	public ArrayList<Review> getAllRev(int startRow,int endRow,String field,String search, int uid) {
		d.getCon();
		
		ArrayList<Review> v = new ArrayList<>();
		
		try {
			String sql = "select * from review where uid=? order by tb_date desc limit ?,?";
			if(search != null && !search.equals("")) {
				sql = "select * from review where uid = ?"+field+" like '%"+search+"%' order by tb_date desc limit ?,?";
			}
			
			pstmt = d.con.prepareStatement(sql);
			pstmt.setInt(1, uid);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
			
				Review rev = new Review(); // ResultSet에서 데이터를 가져와 Comment 객체에 할당합니다.
				
				rev.setUid(rs.getInt("uid")); //`uid` 필드에 정수 값 설
				rev.setTb_uid(rs.getInt("tb_uid")); // `tb_uid` 필드에 정수 값 설정
				rev.setTb_id(rs.getString("tb_id")); // `tb_id` 필드에 문자열 값 설정
				rev.setTb_name(rs.getString("tb_name")); // `tb_name` 필드에 문자열 값 설정
				rev.setTb_comment(rs.getString("tb_comment")); // `tb_comment` 필드에 문자열 값 설정
				rev.setTb_date(rs.getString("tb_date")); // `tb_date` 필드에 문자열 값 설정
				v.add(rev);
				System.out.println(v);
				
			}
			
			rs.close();
			pstmt.close();
			d.con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return v;
	}
	
	//게시판 정보
	public Review oneRev(String uid) {
		
		d.getCon();
		
		Review rev = new Review();
		try {
			String sql = "select * from review where uid=?";
			
			pstmt = d.con.prepareStatement(sql);
			pstmt.setString(1, uid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				// ResultSet에서 데이터를 가져와 Comment 객체에 할당합니다.
				rev.setUid(rs.getInt("uid")); // `uid` 필드에 정수 값 설정
				rev.setTb_id(rs.getString("tb_id")); // `tb_id` 필드에 문자열 값 설정
				rev.setTb_name(rs.getString("tb_name")); // `tb_name` 필드에 문자열 값 설정
				rev.setTb_comment(rs.getString("tb_comment")); // `tb_comment` 필드에 문자열 값 설정
				rev.setTb_date(rs.getString("tb_date")); // `tb_date` 필드에 문자열 값 설정
				
			}
			
			rs.close();
			pstmt.close();
			d.con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rev;
	}
	
	//댓글쓰기
	public Review insertRev(Review rev) {
		d.getCon(); //데이버베이스 접속
		
		Date today = new Date();
		SimpleDateFormat cal = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String signdate = cal.format(today);
		
		try {
			// SQL 쿼리: member 테이블에 데이터 삽입
			String sql = "insert into review (tb_id, uid, tb_name, tb_comment, tb_date) values (?, ?, ?, ?, ?)";

			// PreparedStatement 준비
			pstmt = d.con.prepareStatement(sql);

			// `b` 객체에서 데이터 가져오기
		
			pstmt.setString(1, rev.getTb_id());
			pstmt.setInt(2, rev.getUid()); 
			pstmt.setString(3, rev.getTb_name()); 
			pstmt.setString(4, rev.getTb_comment()); 
			pstmt.setString(5, signdate); 

			// 쿼리 실행
			pstmt.executeUpdate();

			// 자원 해제
			pstmt.close();
			d.con.close();
			
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
		return rev;
	}
	
	//게시물 삭제
	public void deleteRev(int tb_uid) {
		d.getCon();
		
		try {
			System.out.println(tb_uid);

			String sql = "delete from review where tb_uid=?";
			pstmt = d.con.prepareStatement(sql);			
			pstmt.setInt(1, tb_uid);			
			pstmt.executeUpdate();
			System.out.println("서블릿 호출");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				
				pstmt.close();
				d.con.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}

}
