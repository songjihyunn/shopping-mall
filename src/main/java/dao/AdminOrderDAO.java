package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import dto.Order;

public class AdminOrderDAO {
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
			
			// 주문 내역 조회
			public ArrayList<Order> getAllOrders(int startRow, int endRow, String field, String search) {
			    d.getCon();
			    ArrayList<Order> orders = new ArrayList<>();

			    try {
			        // SQL 쿼리 작성 - 모든 주문 내역을 조회하는 쿼리
			        String sql = "SELECT o.od_uid, o.mb_name, o.mb_id, o.od_id, o.od_price, o.ct_status, o.od_date, o.od_image, o.it_size, o.it_point, o.od_name, o.it_qty " +
			                     "FROM orders o order by o.od_uid desc limit ?,?";
			        
			        // 검색어가 존재하는 경우 검색 조건을 SQL 쿼리에 추가
			        if(search != null && !search.equals("")) {
						sql = "SELECT o.od_uid, o.mb_name, o.mb_id, o.od_id, o.od_price, o.ct_status, o.od_date, o.od_image, o.it_size, o.it_point, o.od_name, o.it_qty "+
								"from orders o where "+field+" like '%"+search+"%' order by o.od_uid asc limit ?,?";
					}

			        // PreparedStatement 생성
			        pstmt = d.con.prepareStatement(sql);
			        pstmt.setInt(1, startRow);
					pstmt.setInt(2, endRow);

					rs = pstmt.executeQuery();

			        // ResultSet을 순회하면서 Order 객체를 생성하여 ArrayList에 추가
			        while (rs.next()) {
			            Order order = new Order();
			            order.setOd_uid(rs.getInt("od_uid"));
			            order.setMb_id(rs.getString("mb_id"));
			            order.setMb_name(rs.getString("mb_name"));
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
		    public ArrayList<Order> getFilteredOrders(String startDate, String endDate) {
		        d.getCon();
		        ArrayList<Order> o = new ArrayList<>();
		        
		        try {
		        	String sql = "SELECT o.od_uid, o.mb_name, o.mb_id, o.od_id, o.od_price, o.ct_status, o.od_date, o.od_image, o.it_size, o.od_name, o.it_point, o.it_qty " +
		                     "FROM orders o " +
		                     "WHERE o.od_date BETWEEN ? AND ? " +
		                     "ORDER BY o.od_uid ASC";
		        	
		            pstmt = d.con.prepareStatement(sql);
		            pstmt.setString(1, startDate);
		            pstmt.setString(2, endDate);
		            
		            rs = pstmt.executeQuery();
		            
		            while (rs.next()) {
			            Order order = new Order();
			            order.setOd_uid(rs.getInt("od_uid"));
			            order.setMb_id(rs.getString("mb_id"));
			            order.setMb_name(rs.getString("mb_name"));
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
		    
		    //주문 정보
		    public Order oneOrder(String id) {
		    	d.getCon();
		    	
		    	Order o = new Order();
		    	
		    	try {
		    		String sql = "select * from orders where mb_id=?";
		    		pstmt=d.con.prepareStatement(sql);
		    		
		    		pstmt.setString(1, id);
		    		
		    		rs = pstmt.executeQuery();
		    		
		    		if(rs.next()) {
		    			o.setMb_email(rs.getString("mb_email"));
		    			o.setMb_id(rs.getString("mb_id"));
		    			o.setMb_name(rs.getString("mb_name"));
		    			o.setOd_date(rs.getString("od_date"));
		    			o.setOd_id(rs.getString("od_id"));
		    			o.setOd_image(rs.getString("od_image"));
		    			o.setOd_name(rs.getString("od_name"));
		    			o.setIt_size(rs.getString("it_size"));
		    			o.setOd_price(rs.getInt("od_price"));
		    			o.setCt_status(rs.getString("ct_status"));
		    			o.setIt_point(rs.getInt("it_point"));
		    			o.setIt_qty(rs.getInt("it_qty"));
		    		}
		    		rs.close();
					pstmt.close();
					d.con.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
				return o;
		    }
		    
		    //주문 수정
		    public void updateOrder(Order o) {
		    	d.getCon();
		    	
		    	try {
		    		String sql = "update orders set od_name=?, od_id=?, ct_status=? where mb_id=?";
		    		pstmt=d.con.prepareStatement(sql);
		    		
		    		
		    		pstmt.setString(1, o.getOd_name());
		    		pstmt.setString(2, o.getOd_id());
		    		pstmt.setString(3, o.getCt_status());
		    		pstmt.setString(4, o.getMb_id());
		    		
		    		pstmt.executeUpdate();
		    	}catch (Exception e) {
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
		    //주문 삭제
		    public void deleteOrder(String id) {
		    	d.getCon();
		    	
		    	try {
		    		String sql = "delete from orders where od_uid=?";
		    		pstmt=d.con.prepareStatement(sql);
		    		pstmt.setString(1, id);
		    		pstmt.executeUpdate();
		    		
		    		pstmt.close();
		    		d.con.close();
		    	}catch (Exception e) {
					e.printStackTrace();
				}
		    }
			
}
