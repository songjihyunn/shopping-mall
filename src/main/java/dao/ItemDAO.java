package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import dto.Category;
import dto.Item;
import dto.Member;

public class ItemDAO {

	// 사용할 객체를 미리 선언
	Statement stmt;
	PreparedStatement pstmt;
	ResultSet rs;

	DAO d = new DAO();

	// 총 게시물 수
	public int getAllcount(String field, String search) {
		d.getCon();

		int count = 0;
		try {
			String sql = "";

			if (search != null && !search.equals("")) {
				sql = "select count(*) from item where ? like '%?%'";

				pstmt = d.con.prepareStatement(sql);
				pstmt.setString(1, field);
				pstmt.setString(2, search);
			} else {
				sql = "select count(*) from item";

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

	// 목록
	public ArrayList<Item> getAllMember(int startRow, int endRow, String field, String search) {
		d.getCon();

		ArrayList<Item> v = new ArrayList<Item>();

		try {
			String sql = "select * from item order by it_uid desc limit ?,?";
			if (search != null && !search.equals("")) {
				sql = "select * from item where " + field + " like '%" + search + "%' order by it_uid asc limit ?,?";
			}

			pstmt = d.con.prepareStatement(sql);

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				Item i = new Item();

				i.setIt_uid(rs.getInt("it_uid"));
				i.setIt_name(rs.getString("it_name"));
				i.setCategory1(rs.getString("category1"));
				i.setCategory2(rs.getString("category2"));
				i.setMb_id(rs.getString("mb_id"));
				i.setIt_sale(rs.getInt("it_sale"));
				i.setIt_price(rs.getInt("it_price"));
				i.setIt_use(rs.getNString("it_use"));
				i.setFile1(rs.getString("file1"));
				i.setFile1_thumb(rs.getString("file1_thumb")); // 썸네일
				i.setIt_size(rs.getString("it_size")); // 썸네일
				v.add(i);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				d.con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return v;
	}

	// 카테고리 대분류
	public ArrayList<Category> getTotal() {
		d.getCon();

		ArrayList<Category> v = new ArrayList<Category>();

		try {
			String sql = "select * from category where length(ca_id)=2 and ca_use='Y'";

			pstmt = d.con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				Category c = new Category();

				c.setCa_id(rs.getString("ca_id"));
				c.setCa_name(rs.getString("ca_name"));

				v.add(c);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				d.con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return v;
	}

	// 카테고리 중분류
	public ArrayList<Category> getCategory2(String ca_id) {
		d.getCon();

		ArrayList<Category> v = new ArrayList<Category>();

		try {
			String sql = "select * from category where left(ca_id,2)=? and length(ca_id)=4 and ca_use='Y'";

			pstmt = d.con.prepareStatement(sql);

			pstmt.setString(1, ca_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				Category c = new Category();

				c.setCa_id(rs.getString("ca_id"));
				c.setCa_name(rs.getString("ca_name"));

				v.add(c);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				d.con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return v;
	}

	// 등록
	public void insertItem(Item i) {
		d.getCon();

		try {
			String sql = "insert into item values (null,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = d.con.prepareStatement(sql);

			pstmt.setString(1, i.getCategory1());
			pstmt.setString(2, i.getCategory2());
			pstmt.setString(3, i.getMb_id());
			pstmt.setString(4, i.getIt_name());
			pstmt.setInt(5, i.getIt_sale());
			pstmt.setInt(6, i.getIt_price());
			pstmt.setInt(7, i.getIt_point());
			pstmt.setInt(8, i.getIt_qty());
			pstmt.setString(9, i.getIt_option());
			pstmt.setString(10, i.getIt_use());
			pstmt.setString(11, i.getIt_date());
			pstmt.setString(12, i.getIt_type1());
			pstmt.setString(13, i.getIt_type2());
			pstmt.setString(14, i.getIt_type3());
			pstmt.setString(15, i.getIt_type4());
			pstmt.setString(16, i.getIt_type5());
			pstmt.setString(17, i.getFile1());
			pstmt.setString(18, i.getFile2());
			pstmt.setString(19, i.getFile3());
			pstmt.setString(20, i.getFile4());
			pstmt.setString(21, i.getFile5());
			pstmt.setString(22, i.getFile1_thumb()); // 썸네일
			pstmt.setString(23, i.getIt_size());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				d.con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	//삭제
	
	public void deleteItem(int it_uid) {
		d.getCon();
		try {
			String sql = "delete from item where it_uid=?";
			pstmt = d.con.prepareStatement(sql);
			pstmt.setInt(1, it_uid);
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
	
	// 상품 상세
	public Item oneItem(int it_uid) {
		d.getCon();
		Item item = new Item();
		try {
			String sql = "select * from item where it_uid=?";
			pstmt = d.con.prepareStatement(sql);

			pstmt.setInt(1, it_uid);
			rs = pstmt.executeQuery();

			if (rs.next()) {

				item.setIt_uid(rs.getInt("it_uid"));
				item.setCategory1(rs.getString("category1"));
				item.setCategory2(rs.getString("category2"));
				item.setMb_id(rs.getString("mb_id"));
				item.setIt_name(rs.getString("it_name"));
				item.setIt_sale(rs.getInt("it_sale"));
				item.setIt_price(rs.getInt("it_price"));
				item.setIt_point(rs.getInt("it_point"));
				item.setIt_qty(rs.getInt("it_qty"));
				item.setIt_option(rs.getString("it_option"));
				item.setIt_use(rs.getString("it_use"));
				item.setIt_date(rs.getString("it_date"));
				item.setIt_type1(rs.getString("it_type1"));
				item.setIt_type2(rs.getString("it_type2"));
				item.setIt_type3(rs.getString("it_type3"));
				item.setIt_type4(rs.getString("it_type4"));
				item.setIt_type5(rs.getString("it_type5"));
				item.setFile1(rs.getString("file1"));
				item.setFile2(rs.getString("file2"));
				item.setFile3(rs.getString("file3"));
				item.setFile4(rs.getString("file4"));
				item.setFile5(rs.getString("file5"));
				item.setFile1_thumb(rs.getString("file1_thumb"));
				item.setIt_size(rs.getString("it_size"));

			}

		} catch (Exception e) {
			e.getStackTrace();
		}

		return item;
	}
	
	 // 상품 수정 
	public Item updateitem(Item i) {
		d.getCon();
		Item item = new Item();
					
		 try {
			 	 
			 	String file1,file2,file3,file4,file5,file1_thumb;
				if(!i.getFile1().equals("")) { file1 = ",file1='"+i.getFile1()+"'"; }else { file1 = "";	}
				if(!i.getFile2().equals("")) { file2 = ",file2='"+i.getFile2()+"'"; }else { file2 = "";	}
				if(!i.getFile3().equals("")) { file3 = ",file3='"+i.getFile3()+"'"; }else { file3 = "";	}
				if(!i.getFile4().equals("")) { file4 = ",file4='"+i.getFile4()+"'"; }else { file4 = "";	}
				if(!i.getFile5().equals("")) { file5 = ",file5='"+i.getFile5()+"'"; }else { file5 = "";	}
				if(!i.getFile1_thumb().equals("")) { file1_thumb = ",file1_thumb='"+i.getFile1_thumb()+"'"; }else { file1_thumb = "";	}
			 
				String sql = "update item set category1=?,category2=?,mb_id=?,it_name=?,it_sale=?,it_price=?";
				sql += ",it_point=?,it_qty=?,it_option=?,it_use=?,it_date=?,it_type1=?,it_type2=?,it_type3=?,it_type4=?,it_type5=?";
				sql += file1+file2+file3+file4+file5+file1_thumb+"it_size=? where it_uid=?";
				 
			 	pstmt = d.con.prepareStatement(sql); 
			 	pstmt.setString(1, i.getCategory1());
				pstmt.setString(2, i.getCategory2());
				pstmt.setString(3, i.getMb_id());
				pstmt.setString(4, i.getIt_name());
				pstmt.setInt(5, i.getIt_sale());
				pstmt.setInt(6, i.getIt_price());
				pstmt.setInt(7, i.getIt_point());
				pstmt.setInt(8, i.getIt_qty());
				pstmt.setString(9, i.getIt_option());
				pstmt.setString(10, i.getIt_use());
				pstmt.setString(11, i.getIt_date());
				pstmt.setString(12, i.getIt_type1());
				pstmt.setString(13, i.getIt_type2());
				pstmt.setString(14, i.getIt_type3());
				pstmt.setString(15, i.getIt_type4());
				pstmt.setString(16, i.getIt_type5());
				pstmt.setString(17, i.getIt_size());

				//첨부파일
				pstmt.setInt(18, i.getIt_uid());

				pstmt.executeUpdate();
		 } catch (Exception e) {
			 e.printStackTrace();
			 } finally{
				 
				 try {
					 pstmt.close();
					 d.con.close();
				 } catch (Exception e2) {
					 e2.printStackTrace();
				 }
			} 
		 return i;
		 }
	// 최신 상품 목록
	public ArrayList<Item> getTimeMember(int startRow, int endRow, String field, String search) {
		d.getCon();

		ArrayList<Item> v4 = new ArrayList<Item>();

		try {
			String sql = "select * from item order by it_date desc limit ?,?";
			if (search != null && !search.equals("")) {
				sql = "select * from item where " + field + " like '%" + search + "%' order by it_uid asc limit ?,?";
			}

			pstmt = d.con.prepareStatement(sql);

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				Item i = new Item();

				i.setIt_uid(rs.getInt("it_uid"));
				i.setIt_name(rs.getString("it_name"));
				i.setIt_use(rs.getNString("it_use"));
				i.setFile1_thumb(rs.getString("file1_thumb")); // 썸네일
				i.setIt_date(rs.getString("it_date"));
				v4.add(i);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				d.con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return v4;
	}
	// 인기상품목록
	public ArrayList<Item> getPopularMember(int startRow, int endRow, String field, String search) {
	    d.getCon();

	    ArrayList<Item> v1 = new ArrayList<Item>();

	    try {
	        // SQL 쿼리 문자열을 초기화
	        String sql = "SELECT it_uid, file1_thumb, it_type4, category1 FROM item WHERE it_type4 = 'Y'";
	        if (search != null && !search.equals("")) {
	            sql += " AND " + field + " LIKE ?"; // 검색 조건 추가
	        }
	        sql += " ORDER BY it_uid DESC LIMIT ?, ?"; // 정렬과 제한 추가

	        // PreparedStatement 생성
	        pstmt = d.con.prepareStatement(sql);

	        int paramIndex = 1;

	        // 검색 조건이 있으면 검색 조건을 PreparedStatement에 설정
	        if (search != null && !search.equals("")) {
	            pstmt.setString(paramIndex++, "%" + search + "%");
	        }

	        // LIMIT 시작 인덱스와 행 수 설정
	        pstmt.setInt(paramIndex++, startRow);
	        pstmt.setInt(paramIndex, endRow - startRow + 1); // endRow - startRow는 가져올 행의 수를 의미

	        rs = pstmt.executeQuery();

	        // 결과를 처리하여 ArrayList에 추가
	        while (rs.next()) {
	            Item i = new Item();
	            i.setIt_uid(rs.getInt("it_uid"));
	            i.setIt_type4(rs.getString("it_type4"));
	            i.setFile1_thumb(rs.getString("file1_thumb")); // 썸네일
	            i.setCategory1(rs.getString("category1"));
	            v1.add(i);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (pstmt != null) pstmt.close();
	            if (d.con != null) d.con.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	    return v1;
	}
	//모자
	public ArrayList<Item> gethatItems(int startRow, int endRow, String field, String search) {
	    d.getCon();
	    ArrayList<Item> v3 = new ArrayList<>();

	    try {
	        // SQL 쿼리 문자열을 초기화
	        String sql = "SELECT it_uid, file1_thumb, it_type4, it_name, it_price, category1 FROM item WHERE category1 = '30'";
	        if (search != null && !search.equals("")) {
	            sql += " AND " + field + " LIKE ?"; // 검색 조건 추가
	        }
	        sql += " ORDER BY it_uid DESC LIMIT ?, ?"; // 정렬과 제한 추가

	        // PreparedStatement 생성
	        pstmt = d.con.prepareStatement(sql);

	        int paramIndex = 1;

	        // 검색 조건이 있으면 검색 조건을 PreparedStatement에 설정
	        if (search != null && !search.equals("")) {
	            pstmt.setString(paramIndex++, "%" + search + "%");
	        }

	        // LIMIT 시작 인덱스와 행 수 설정
	        pstmt.setInt(paramIndex++, startRow);
	        pstmt.setInt(paramIndex, endRow - startRow + 1); // endRow - startRow는 가져올 행의 수를 의미

	        rs = pstmt.executeQuery();

	        // 결과를 처리하여 ArrayList에 추가
	        while (rs.next()) {
	            Item i = new Item();
	            i.setIt_uid(rs.getInt("it_uid"));
	            i.setIt_type4(rs.getString("it_type4"));
	            i.setFile1_thumb(rs.getString("file1_thumb")); // 썸네일
	            i.setCategory1(rs.getString("category1"));
	            i.setIt_name(rs.getString("it_name"));
	            i.setIt_price(rs.getInt("it_price"));
	            v3.add(i);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (pstmt != null) pstmt.close();
	            if (d.con != null) d.con.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	    return v3;
	}
	//악세사리
	public ArrayList<Item> getAccItems(int startRow, int endRow, String field, String search) {
	    d.getCon();
	    ArrayList<Item> v4 = new ArrayList<>();

	    try {
	        // SQL 쿼리 문자열을 초기화
	        String sql = "SELECT it_uid, file1_thumb, it_type4, category1, it_name, it_price FROM item WHERE category1 = '50'";
	        if (search != null && !search.equals("")) {
	            sql += " AND " + field + " LIKE ?"; // 검색 조건 추가
	        }
	        sql += " ORDER BY it_uid DESC LIMIT ?, ?"; // 정렬과 제한 추가

	        // PreparedStatement 생성
	        pstmt = d.con.prepareStatement(sql);

	        int paramIndex = 1;

	        // 검색 조건이 있으면 검색 조건을 PreparedStatement에 설정
	        if (search != null && !search.equals("")) {
	            pstmt.setString(paramIndex++, "%" + search + "%");
	        }

	        // LIMIT 시작 인덱스와 행 수 설정
	        pstmt.setInt(paramIndex++, startRow);
	        pstmt.setInt(paramIndex, endRow - startRow + 1); // endRow - startRow는 가져올 행의 수를 의미

	        rs = pstmt.executeQuery();

	        // 결과를 처리하여 ArrayList에 추가
	        while (rs.next()) {
	            Item i = new Item();
	            i.setIt_uid(rs.getInt("it_uid"));
	            i.setIt_type4(rs.getString("it_type4"));
	            i.setFile1_thumb(rs.getString("file1_thumb")); // 썸네일
	            i.setCategory1(rs.getString("category1"));
	            i.setIt_name(rs.getString("it_name"));
	            i.setIt_price(rs.getInt("it_price"));
	            v4.add(i);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (pstmt != null) pstmt.close();
	            if (d.con != null) d.con.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	    return v4;
	}
	public ArrayList<Item> getcategory1(int startRow, int endRow, String field, String search, int category1) {
	    d.getCon();
	    ArrayList<Item> v = new ArrayList<>();

	    try {
	        // SQL 쿼리 문자열을 초기화
	        String sql = "SELECT it_uid, file1_thumb, it_type4, it_name, it_price, category1 FROM item WHERE category1 = ?";
	        if (search != null && !search.equals("")) {
	            sql += " AND " + field + " LIKE ?"; // 검색 조건 추가
	        }
	        sql += " ORDER BY it_uid DESC LIMIT ?, ?"; // 정렬과 제한 추가

	        // PreparedStatement 생성
	        pstmt = d.con.prepareStatement(sql);

	        int paramIndex = 1;

	        // category1 값 설정
	        pstmt.setInt(paramIndex++, category1);

	        // 검색 조건이 있으면 검색 조건을 PreparedStatement에 설정
	        if (search != null && !search.equals("")) {
	            pstmt.setString(paramIndex++, "%" + search + "%");
	        }

	        // LIMIT 시작 인덱스와 행 수 설정
	        pstmt.setInt(paramIndex++, startRow);
	        pstmt.setInt(paramIndex, endRow - startRow + 1); // endRow - startRow는 가져올 행의 수를 의미

	        rs = pstmt.executeQuery();

	        // 결과를 처리하여 ArrayList에 추가
	        while (rs.next()) {
	            Item i = new Item();
	            i.setIt_uid(rs.getInt("it_uid"));
	            i.setIt_type4(rs.getString("it_type4"));
	            i.setFile1_thumb(rs.getString("file1_thumb")); // 썸네일
	            i.setCategory1(rs.getString("category1"));
	            i.setIt_name(rs.getString("it_name"));
	            i.setIt_price(rs.getInt("it_price"));
	            v.add(i);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (pstmt != null) pstmt.close();
	            if (d.con != null) d.con.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	    return v;
	}
}
