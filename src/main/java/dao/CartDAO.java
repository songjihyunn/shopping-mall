package dao;

import java.beans.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.Cart;
import dto.Member;

public class CartDAO {
	Statement stmt;
	PreparedStatement pstmt;
	ResultSet rs;
	DAO d = new DAO();

	//추가
	public void insertCart(Cart c) {
		d.getCon();
		try {
			String sql = "insert into cart values (null,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = d.con.prepareStatement(sql);
			pstmt.setString(1, c.getOd_id());
			pstmt.setString(2, c.getMb_id());
			pstmt.setString(3, c.getIt_uid());
			pstmt.setInt(4, c.getIt_price());
			pstmt.setInt(5, c.getIt_point());
			pstmt.setInt(6, c.getIt_qty());
			pstmt.setString(7, c.getCt_status());
			pstmt.setString(8, c.getCt_date());
			pstmt.setString(9, c.getIt_name());
			pstmt.setString(10, c.getFile1());
			pstmt.setString(11, c.getIt_size());
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
	
	//장바구니 상품 존재시 수량 업데이트
		public void oneUpdate(Cart c) {
			d.getCon();
			try {
				String sql = "update cart set it_qty = it_qty + ? where od_id=? and it_uid=?";
				pstmt = d.con.prepareStatement(sql);
				pstmt.setInt(1, c.getIt_qty());
				pstmt.setString(2, c.getOd_id());
				pstmt.setString(3, c.getIt_uid());
				pstmt.executeUpdate();
				
			} catch (Exception e) {
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
		
		//카트정보
		public Cart oneCart(String ct_uid) {
			d.getCon(); //DB 접근
			
			Cart c = new Cart();
			
			try {
				String sql = "select * from cart where ct_uid=?";
				pstmt = d.con.prepareStatement(sql);
				
				pstmt.setString(1, ct_uid);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					
					String ct_date = rs.getString("ct_date").substring(0, 10); //등록일 년월일
					
					c.setCt_uid(rs.getInt("ct_uid"));
					c.setOd_id(rs.getString("od_id"));
					c.setMb_id(rs.getString("mb_id"));				
					c.setIt_uid(rs.getString("it_uid"));
					c.setIt_price(rs.getInt("it_price"));
					c.setIt_point(rs.getInt("it_point"));
					c.setIt_qty(rs.getInt("it_qty"));				
					c.setCt_status(rs.getString("ct_status"));
					c.setCt_date(ct_date);
					c.setIt_name(rs.getString("it_name"));
					c.setFile1(rs.getString("file1"));
					c.setIt_size(rs.getString("it_size"));

				}
				
				rs.close();
				pstmt.close();
				d.con.close();
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			return c;
		}
		//장바구니 상품 존재 여부
		public int selectItem(Cart c) {

			d.getCon();
			int num = 0;
			try {
				String sql = "select count(*) from cart where od_id=? and it_uid=?";
				pstmt = d.con.prepareStatement(sql);
				pstmt.setString(1, c.getOd_id());
				pstmt.setString(2, c.getIt_uid());
				rs = pstmt.executeQuery();

				if(rs.next()) {
					num = rs.getInt(1);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				try {
					rs.close();
					pstmt.close();
					d.con.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
			return num;
		}
	
		
		//총 장바구니 
				public int getAllcount(String field,String search) {
					d.getCon();
					
					int count = 0;
					
					try {
						String sql = "select count(*) from cart";
						if(search != null && !search.equals("")) {
							sql = "select count(*) from cart where " + field + " like ?";
						    
						    pstmt = d.con.prepareStatement(sql);
						    pstmt.setString(1, "%" + search + "%");
						}else {
							sql = "select count(*) from cart";

							pstmt = d.con.prepareStatement(sql);
						}
						
						rs = pstmt.executeQuery();
						
						if(rs.next()) {
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
		
		//장바구니목록
		public ArrayList<Cart> getAllMember(int startRow,int endRow, String field,String search, String id) {
			d.getCon();
			ArrayList<Cart> v = new ArrayList<Cart>();

			try {
		        // 기본 쿼리: mb_id 조건 추가
		        String sql = "select *,(select file1 from item where item.it_uid=cart.it_uid) as file1 from cart where mb_id = ? order by ct_uid desc limit ?,?";
		        
		        // 검색어가 있을 경우의 쿼리: mb_id 조건과 함께 검색어 조건 추가
		        if(search != null && !search.equals("")) {
		            sql = "select *,(select file1 from item where item.it_uid=cart.it_uid) as file1 from cart where " + field + " like '%" + search + "%' and cart.mb_id = ? order by ct_uid asc limit ?,?";
		        }

		        pstmt = d.con.prepareStatement(sql);
		        
		        // PreparedStatement 설정을 조건에 맞게 조정
		        if(search != null && !search.equals("")) {
		            pstmt.setString(1, id);
		            pstmt.setInt(2, startRow);
		            pstmt.setInt(3, endRow - startRow); // MySQL limit 구문의 두 번째 인자는 가져올 행의 수를 의미합니다.
		        } else {
		            pstmt.setString(1, id);
		            pstmt.setInt(2, startRow);
		            pstmt.setInt(3, endRow - startRow); // MySQL limit 구문의 두 번째 인자는 가져올 행의 수를 의미합니다.
		        }

				rs = pstmt.executeQuery();

				while(rs.next()) {
					Cart c = new Cart();

					String ct_date = rs.getString("ct_date").substring(0, 10); //등록일 년월일

					c.setCt_uid(rs.getInt("ct_uid"));
					c.setOd_id(rs.getString("od_id"));
					c.setMb_id(rs.getString("mb_id"));				
					c.setIt_uid(rs.getString("it_uid"));
					c.setIt_price(rs.getInt("it_price"));
					c.setIt_point(rs.getInt("it_point"));
					c.setIt_qty(rs.getInt("it_qty"));				
					c.setCt_status(rs.getString("ct_status"));
					c.setCt_date(ct_date);
					c.setIt_name(rs.getString("it_name"));
					c.setFile1(rs.getString("file1"));
					c.setIt_size(rs.getString("it_size"));
					
					v.add(c);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				try {
					rs.close();
					pstmt.close();
					d.con.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
			return v;
		}
		
		//장구바구니 삭제
		public void deleteCart(int ct_uid) {
			d.getCon();
			
			try {
				String sql = "delete from cart where ct_uid=?";
				pstmt = d.con.prepareStatement(sql);			
				pstmt.setInt(1, ct_uid);			
				pstmt.executeUpdate();
				
				pstmt.close();
				d.con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		//수량 변경 처리
		public void qtyUpdate(int ct_uid, String str) {
			d.getCon();
			try {
				String sql = "update cart set it_qty = it_qty - 1 where ct_uid=?"; //감소 버튼
				if(str.equals("p")) {
					sql = "update cart set it_qty = it_qty + 1 where ct_uid=?"; //증가 버튼
				}
				pstmt = d.con.prepareStatement(sql);
				pstmt.setInt(1, ct_uid);
				pstmt.executeUpdate();
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
