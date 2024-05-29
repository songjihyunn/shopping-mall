package dto;

public class Cart {
	
	
	private int ct_uid;
	private String od_id;
	private String mb_id;
	private String it_uid;
	private int it_price;
	private int it_point;
	private int it_qty;
	private String ct_status;
	private String ct_date;
	private String file1; // item 테이블 file1_thum 가져오면 될 듯
	private String it_name;
	private String it_size;
	
	
	public int getCt_uid() {
		return ct_uid;
	}
	public void setCt_uid(int ct_uid) {
		this.ct_uid = ct_uid;
	}
	public String getOd_id() {
		return od_id;
	}
	public void setOd_id(String od_id) {
		this.od_id = od_id;
	}
	public String getMb_id() {
		return mb_id;
	}
	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}
	public String getIt_uid() {
		return it_uid;
	}
	public void setIt_uid(String it_uid) {
		this.it_uid = it_uid;
	}
	public int getIt_price() {
		return it_price;
	}
	public void setIt_price(int it_price) {
		this.it_price = it_price;
	}
	public int getIt_point() {
		return it_point;
	}
	public void setIt_point(int it_point) {
		this.it_point = it_point;
	}
	public int getIt_qty() {
		return it_qty;
	}
	public void setIt_qty(int it_qty) {
		this.it_qty = it_qty;
	}
	public String getCt_status() {
		return ct_status;
	}
	public void setCt_status(String ct_status) {
		this.ct_status = ct_status;
	}
	public String getCt_date() {
		return ct_date;
	}
	public void setCt_date(String ct_date) {
		this.ct_date = ct_date;
	}
	public String getFile1() {
		return file1;
	}
	public void setFile1(String file1) {
		this.file1 = file1;
	}
	public String getIt_name() {
		return it_name;
	}
	public void setIt_name(String it_name) {
		this.it_name = it_name;
	}
	public String getIt_size() {
		return it_size;
	}
	public void setIt_size(String it_size) {
		this.it_size = it_size;
	}
	
	@Override
	public String toString() {
		return "Cart [ct_uid=" + ct_uid + ", od_id=" + od_id + ", mb_id=" + mb_id + ", it_uid=" + it_uid + ", it_price="
				+ it_price + ", it_point=" + it_point + ", it_qty=" + it_qty + ", ct_status=" + ct_status + ", ct_date="
				+ ct_date + ", file1=" + file1 + ", it_name=" + it_name + ", it_size=" + it_size + "]";
	}
}
