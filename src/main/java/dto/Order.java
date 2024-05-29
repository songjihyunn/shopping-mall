package dto;

public class Order {
	private int od_uid;	//번호
	String od_id;	//주문번호
	int od_price;	//주문가격
	String ct_status;	//주문상태
	String od_date;		//주문일자
	String mb_id; //주문한 회원 아이디
	String mb_name; //주문한 회원 이름
	String mb_email; //주문한 회원 이메일
	String it_size; //주문한 상품 사이즈
	String od_image; //주문한 상품 이미지
	String od_name; //주문한 상품 이름
	String od_option; //주문한 상품 이름
	int it_qty; //재고수량
	int it_point; //상품 포인트
	
	public int getOd_uid() {
		return od_uid;
	}
	public void setOd_uid(int od_uid) {
		this.od_uid = od_uid;
	}
	public String getOd_id() {
		return od_id;
	}
	public void setOd_id(String od_id) {
		this.od_id = od_id;
	}
	public int getOd_price() {
		return od_price;
	}
	public void setOd_price(int od_price) {
		this.od_price = od_price;
	}
	public String getCt_status() {
		return ct_status;
	}
	public void setCt_status(String ct_status) {
		this.ct_status = ct_status;
	}
	public String getOd_date() {
		return od_date;
	}
	public void setOd_date(String od_date) {
		this.od_date = od_date;
	}
	public String getMb_id() {
		return mb_id;
	}
	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}
	public String getMb_name() {
		return mb_name;
	}
	public void setMb_name(String mb_name) {
		this.mb_name = mb_name;
	}
	public String getMb_email() {
		return mb_email;
	}
	public void setMb_email(String mb_email) {
		this.mb_email = mb_email;
	}
	public String getIt_size() {
		return it_size;
	}
	public void setIt_size(String it_size) {
		this.it_size = it_size;
	}
	public String getOd_image() {
		return od_image;
	}
	public void setOd_image(String od_image) {
		this.od_image = od_image;
	}
	public String getOd_name() {
		return od_name;
	}
	public void setOd_name(String od_name) {
		this.od_name = od_name;
	}
	public int getIt_point() {
		return it_point;
	}
	public void setIt_point(int it_point) {
		this.it_point = it_point;
	}
	public String getOd_option() {
		return od_option;
	}
	public void setOd_option(String od_option) {
		this.od_option = od_option;
	}
	public int getIt_qty() {
		return it_qty;
	}
	public void setIt_qty(int it_qty) {
		this.it_qty = it_qty;
	}
	@Override
	public String toString() {
		return "Order [od_uid=" + od_uid + ", od_id=" + od_id + ", od_price=" + od_price + ", ct_status=" + ct_status
				+ ", od_date=" + od_date + ", mb_id=" + mb_id + ", mb_name=" + mb_name + ", mb_email=" + mb_email
				+ ", it_size=" + it_size + ", od_image=" + od_image + ", od_name=" + od_name + ", od_option="
				+ od_option + ", it_qty=" + it_qty + ", it_point=" + it_point + "]";
	}
	
}
