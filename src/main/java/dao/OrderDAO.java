package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import dto.Order;

public class OrderDAO {
	//사용할 객체 미리 선언
		Statement stmt;
		PreparedStatement pstmt;
		ResultSet rs;
		
		DAO d = new DAO();
		
		//총 수
		public int getAllcount(String field,String search) {
			d.getCon();

			int count = 0;

			try {
				String sql = "select count(*) from orders";
				if (search != null && !search.equals("")) {
				    sql = "select count(*) from orders where " + field + " like ?";
				    
				    pstmt = d.con.prepareStatement(sql);
				    pstmt.setString(1, "%" + search + "%");
				}else {
					sql = "select count(*) from orders";

					pstmt = d.con.prepareStatement(sql);
				}
				
				rs = pstmt.executeQuery();

				if (rs.next()) {
					count = rs.getInt(1);
				}

				rs.close();
				pstmt.close();
				d.con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return count;
		}
		//주문 내역 조회
		public ArrayList<Order> getAllOrder(int startRow, int endRow, String field, String search, String id) {
		    // 데이터베이스 연결 객체 획득
		    d.getCon();
		    ArrayList<Order> orders = new ArrayList<>();

		    try {
		        // SQL 쿼리 작성
		        String sql = "SELECT o.od_uid, m.id, o.mb_name, o.od_id, o.od_price, o.ct_status, o.od_date, o.od_image, o.it_size, o.od_name, o.it_point, o.it_qty " +
		                     "FROM orders o " +
		                     "INNER JOIN member m ON o.mb_id = m.id " +
		                     "WHERE m.id = ? ";

		        // 검색어가 존재하는 경우 검색 조건을 SQL 쿼리에 추가
		        if (search != null && !search.equals("")) {
		            sql += "AND " + field + " LIKE ? ";
		        }

		        sql += "ORDER BY o.od_uid ASC LIMIT ?, ?";

		        // PreparedStatement 생성
		        pstmt = d.con.prepareStatement(sql);
		        pstmt.setString(1, id);  // mb_id 매개변수 설정
		        int parameterIndex = 2;  // SQL 파라미터 인덱스 설정

		        if (search != null && !search.equals("")) {
		            pstmt.setString(parameterIndex++, "%" + search + "%");  // 검색어 매개변수 설정
		        }

		        pstmt.setInt(parameterIndex++, startRow);  // startRow 매개변수 설정
		        pstmt.setInt(parameterIndex, endRow);  // endRow 매개변수 설정

		        // SQL 쿼리 실행 결과를 ResultSet으로 받음
		        rs = pstmt.executeQuery();

		        // ResultSet을 순회하면서 Order 객체를 생성하여 ArrayList에 추가
		        while (rs.next()) {
		            Order order = new Order();
		            order.setOd_uid(rs.getInt("od_uid"));
		            order.setMb_name(rs.getString("mb_name"));
		            order.setMb_id(rs.getString("id"));
		            order.setOd_id(rs.getString("od_id"));
		            order.setOd_price(rs.getInt("od_price"));
		            order.setCt_status(rs.getString("ct_status"));
		            order.setOd_date(rs.getString("od_date"));
		            order.setOd_image(rs.getString("od_image"));
		            order.setIt_size(rs.getString("it_size"));
		            order.setOd_name(rs.getString("od_name"));
		            order.setIt_point(rs.getInt("it_point"));
		            order.setIt_qty(rs.getInt("it_qty"));
		            orders.add(order);
		        }
		    } catch (Exception e) {
		        e.printStackTrace();  // 예외 발생 시 로그 출력
		    } finally {
		        try {
		            // 자원 반환
		            if (rs != null) {
		                rs.close();
		            }
		            if (pstmt != null) {
		                pstmt.close();
		            }
		            if (d.con != null) {
		                d.con.close();
		            }
		        } catch (Exception e) {
		            e.printStackTrace();
		        }
		    }
		    return orders;  // 조회 결과를 반환
		}

		// 주문일자로 필터링된 주문 내역 조회
	    public ArrayList<Order> getFilteredOrders(String startDate, String endDate, String id) {
	        d.getCon();
	        ArrayList<Order> o = new ArrayList<>();
	        
	        try {
	        	String sql = "SELECT o.od_uid, m.id, o.od_id, o.od_price, o.ct_status, o.od_date, o.od_image, o.it_size, o.od_name, o.it_point, o.it_qty" +
	                     "FROM orders o " +
	                     "INNER JOIN member m ON o.mb_id = m.id " +
	                     "WHERE o.od_date BETWEEN ? AND ? AND m.id = ? " +
	                     "ORDER BY o.od_uid ASC";
	        	
	            pstmt = d.con.prepareStatement(sql);
	            pstmt.setString(1, startDate);
	            pstmt.setString(2, endDate);
	            pstmt.setString(3, id);
	            
	            rs = pstmt.executeQuery();
	            
	            while (rs.next()) {
		            Order order = new Order();
		            order.setOd_uid(rs.getInt("od_uid"));
		            order.setMb_id(rs.getString("id"));
		            order.setOd_id(rs.getString("od_id"));
		            order.setOd_price(rs.getInt("od_price"));
		            order.setCt_status(rs.getString("ct_status"));
		            order.setOd_date(rs.getString("od_date"));
		            order.setOd_image(rs.getString("od_image"));
		            order.setIt_size(rs.getString("it_size"));
		            order.setOd_name(rs.getString("od_name"));
		            order.setIt_point(rs.getInt("it_point"));
		            order.setIt_qty(rs.getInt("it_qty"));

		            o.add(order);
		        }
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	        	try {
					rs.close();
					pstmt.close();
					d.con.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
	        }
	        
	        return o;
	    }
	  //추가
	    public void insertOrder(Order o) {
	        d.getCon();
	        PreparedStatement pstmt = null; // PreparedStatement 선언
	        try {
	            String sql = "insert into orders values (null,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	            pstmt = d.con.prepareStatement(sql);

	            // 각 속성에 대한 값을 PreparedStatement에 설정
	            pstmt.setString(1, o.getOd_id()); // od_id
	            pstmt.setInt(2, o.getOd_price()); // od_price
	            pstmt.setString(3, o.getCt_status()); // ct_status
	            pstmt.setString(4, o.getOd_date()); // signDate
	            pstmt.setString(5, o.getMb_id()); // mb_id
	            pstmt.setString(6, o.getMb_name()); // mb_name
	            pstmt.setString(7, o.getMb_email()); // mb_email
	            pstmt.setString(8, o.getOd_option()); // ob_option
	            pstmt.setString(9, o.getOd_image()); // od_image
	            pstmt.setString(10, o.getOd_name()); // od_name
	            pstmt.setInt(11, o.getIt_point()); // it_point
	            pstmt.setString(12, o.getIt_size()); // it_point
	            pstmt.setInt(13, o.getIt_qty()); // it_point

	            pstmt.executeUpdate();

	        } catch(Exception e) {
	            e.printStackTrace();
	        } finally {
	            try {
	                if (pstmt != null) pstmt.close(); // pstmt가 null이 아닐 때만 close() 호출
	                if (d.con != null) d.con.close(); // d.con이 null이 아닐 때만 close() 호출
	            } catch(Exception e) {
	                e.printStackTrace();
	            }
	        }
	    }

		
}
