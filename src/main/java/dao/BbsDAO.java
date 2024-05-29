package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import dto.Bbs;

public class BbsDAO {
	//사용할 객체를 미리 선언
		Statement stmt;
		PreparedStatement pstmt;
		ResultSet rs;
		
		DAO d = new DAO(); //d.getCon() , d.conn 사용 목적
		
		//총 게시물 수
		public int getAllcount(String field,String search) {
			d.getCon();
			
			int count = 0;
			
			try {
				String sql = "select count(*) from qna";
				if(search != null && !search.equals("")) {
					sql = "select count(*) from qna where "+field+" like '%"+search+"%'";
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
		
		//게시판목록
		public ArrayList<Bbs> getAllBbs(int startRow,int endRow,String field,String search) {
			d.getCon();
			
			ArrayList<Bbs> v = new ArrayList<>();
			
			try {
				String sql = "select * from qna order by signdate desc limit ?,?";
				if(search != null && !search.equals("")) {
					sql = "select * from qna where "+field+" like '%"+search+"%' order by signdate desc limit ?,?";
				}
				
				pstmt = d.con.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					Bbs b = new Bbs();
					
					// ResultSet에서 데이터를 가져와 b 객체의 필드에 값을 설정합니다.
					b.setUid(Integer.parseInt(rs.getString("uid")));  // `uid` 필드에 정수 값 설정
					b.setId(rs.getString("id"));  // `id` 필드에 문자열 값 설정
					b.setName(rs.getString("name"));  // `name` 필드에 문자열 값 설정
					b.setSubject(rs.getString("subject"));  // `subject` 필드에 문자열 값 설정
					b.setComment(rs.getString("comment"));  // `comment` 필드에 문자열 값 설정
					b.setSigndate(rs.getString("signdate"));  // `signdate` 필드에 문자열 값 설정
					b.setRef(Integer.parseInt(rs.getString("ref")));  // `ref` 필드에 정수 값 설정
					b.setGongji(rs.getString("gongji"));  // `gongji` 필드에 문자열 값 설정
					b.setFile1(rs.getString("file1"));  // `file1` 필드에 문자열 값 설정
					b.setFile1_o(rs.getString("file1_o"));  // `file1_o` 필드에 문자열 값 설정
					b.setFile1_s(rs.getString("file1_s"));  // `file1_s` 필드에 문자열 값 설정
					b.setFid(Integer.parseInt(rs.getString("fid")));  // `fid` 필드에 정수 값 설정
					b.setThread(rs.getString("thread"));  // `thread` 필드에 문자열 값 설정
				
					int len_num = b.getSubject().length(); //제목 길이
					if(len_num > 5){ //길이 비교

						b.setSubject(b.getSubject().substring(0, 5) + " ...");

					}
					v.add(b);
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
		public Bbs oneBbs(int uid) {
			d.getCon();
			
			Bbs b = new Bbs();
			
			try {
				String sql = "select * from qna where uid=?";
				pstmt = d.con.prepareStatement(sql);
				
				pstmt.setInt(1, uid);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					b.setUid(Integer.parseInt(rs.getString("uid")));  // `uid` 필드에 정수 값 설정
					b.setId(rs.getString("id"));  // `id` 필드에 문자열 값 설정
					b.setName(rs.getString("name"));  // `name` 필드에 문자열 값 설정
					b.setSubject(rs.getString("subject"));  // `subject` 필드에 문자열 값 설정
					b.setComment(rs.getString("comment"));  // `comment` 필드에 문자열 값 설정
					b.setSigndate(rs.getString("signdate"));  // `signdate` 필드에 문자열 값 설정
					b.setRef(Integer.parseInt(rs.getString("ref")));  // `ref` 필드에 정수 값 설정
					b.setGongji(rs.getString("gongji"));  // `gongji` 필드에 문자열 값 설정
					b.setFile1(rs.getString("file1"));  // `file1` 필드에 문자열 값 설정
					b.setFile1_o(rs.getString("file1_o"));  // `file1_o` 필드에 문자열 값 설정
					b.setFile1_s(rs.getString("file1_s"));  // `file1_s` 필드에 문자열 값 설정
					b.setFid(Integer.parseInt(rs.getString("fid")));  // `fid` 필드에 정수 값 설정
					b.setThread(rs.getString("thread"));  // `thread` 필드에 문자열 값 설정
				}
				
				rs.close();
				pstmt.close();
				d.con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return b;
		}
		
		//글쓰기
		public void insertBbs(Bbs b) {
			d.getCon(); //데이버베이스 접속
			
			try {
				// SQL 쿼리: member 테이블에 데이터 삽입
				String sql = "insert into qna values (null, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

				// PreparedStatement 준비
				pstmt = d.con.prepareStatement(sql);

				// `b` 객체에서 데이터 가져오기
				pstmt.setString(1, b.getId()); // `id` 필드에 문자열 값 설정
				pstmt.setString(2, b.getName()); // `name` 필드에 문자열 값 설정
				pstmt.setString(3, b.getSubject()); // `subject` 필드에 문자열 값 설정
				pstmt.setString(4, b.getComment()); // `comment` 필드에 문자열 값 설정
				pstmt.setString(5, b.getSigndate()); // `signdate` 필드에 문자열 값 설정
				pstmt.setInt(6, 0); // `ref` 필드에 정수 값 설정
				pstmt.setString(7, b.getGongji()); // `gongji` 필드에 문자열 값 설정
				pstmt.setString(8, b.getFile1()); // `file1` 필드에 문자열 값 설정
				pstmt.setString(9, b.getFile1_o()); // `file1_o` 필드에 문자열 값 설정
				pstmt.setString(10, b.getFile1_s()); // `file1_s` 필드에 문자열 값 설정
				pstmt.setInt(11, 1); // `fid` 필드에 정수 값 설정
				pstmt.setString(12, "A"); // `thread` 필드에 문자열 값 설정

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
		}
		
		//게시물수정
		public void updateBbs(Bbs b) {
			d.getCon(); //데이버베이스 접속
			
			try {
				
				String sql = "update qna set subject=?, comment=?, file1=?, file1_o=?, file1_s=? where uid=?";

				pstmt = d.con.prepareStatement(sql);			
				
				pstmt.setString(1, b.getSubject()); // `subject` 필드에 문자열 값 설정
				pstmt.setString(2, b.getComment()); // `comment` 필드에 문자열 값 설정
				pstmt.setString(3, b.getFile1()); // `file1` 필드에 문자열 값 설정
				pstmt.setString(4, b.getFile1_o()); // `file1_o` 필드에 문자열 값 설정
				pstmt.setString(5, b.getFile1_o()); // `file1_s` 필드에 문자열 값 설정
				pstmt.setInt(6, b.getUid()); // `uid` 필드에 정수 값 설정
				
				pstmt.executeUpdate();
				System.out.println("post3 제출:"+b.toString());
				System.out.println(pstmt.executeUpdate());

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
		
		//게시물 삭제
		public void deleteBbs(int uid) {
			d.getCon();
			
			try {
				System.out.println(uid);

				String sql = "delete from qna where uid=?";
				pstmt = d.con.prepareStatement(sql);			
				pstmt.setInt(1, uid);			
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
