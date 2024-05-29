package dto;

public class Item {

	private int it_uid;
	private String category1;
	private String category2;
	private String mb_id;
	private String it_name;
	private int it_sale; //세일가격
	private int it_price; //가격
	private int it_point;
	private int it_qty; //재고수량
	private String it_option; //옵션
	private String it_use; //판매여부
	private String it_date; //작성일
	private String it_type1; //히트
	private String it_type2; //추천
	private String it_type3; //신상
	private String it_type4; //인기
	private String it_type5; //할인
	private String file1;
	private String file2;
	private String file3;
	private String file4;
	private String file5;
	private String file1_thumb; //썸네일
	private String it_size;
	public int getIt_uid() {
		return it_uid;
	}
	public void setIt_uid(int it_uid) {
		this.it_uid = it_uid;
	}
	public String getCategory1() {
		return category1;
	}
	public void setCategory1(String category1) {
		this.category1 = category1;
	}
	public String getCategory2() {
		return category2;
	}
	public void setCategory2(String category2) {
		this.category2 = category2;
	}
	public String getMb_id() {
		return mb_id;
	}
	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}
	public String getIt_name() {
		return it_name;
	}
	public void setIt_name(String it_name) {
		this.it_name = it_name;
	}
	public int getIt_sale() {
		return it_sale;
	}
	public void setIt_sale(int it_sale) {
		this.it_sale = it_sale;
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
	public String getIt_option() {
		return it_option;
	}
	public void setIt_option(String it_option) {
		this.it_option = it_option;
	}
	public String getIt_use() {
		return it_use;
	}
	public void setIt_use(String it_use) {
		this.it_use = it_use;
	}
	public String getIt_date() {
		return it_date;
	}
	public void setIt_date(String it_date) {
		this.it_date = it_date;
	}
	public String getIt_type1() {
		return it_type1;
	}
	public void setIt_type1(String it_type1) {
		this.it_type1 = it_type1;
	}
	public String getIt_type2() {
		return it_type2;
	}
	public void setIt_type2(String it_type2) {
		this.it_type2 = it_type2;
	}
	public String getIt_type3() {
		return it_type3;
	}
	public void setIt_type3(String it_type3) {
		this.it_type3 = it_type3;
	}
	public String getIt_type4() {
		return it_type4;
	}
	public void setIt_type4(String it_type4) {
		this.it_type4 = it_type4;
	}
	public String getIt_type5() {
		return it_type5;
	}
	public void setIt_type5(String it_type5) {
		this.it_type5 = it_type5;
	}
	public String getFile1() {
		return file1;
	}
	public void setFile1(String file1) {
		this.file1 = file1;
	}
	public String getFile2() {
		return file2;
	}
	public void setFile2(String file2) {
		this.file2 = file2;
	}
	public String getFile3() {
		return file3;
	}
	public void setFile3(String file3) {
		this.file3 = file3;
	}
	public String getFile4() {
		return file4;
	}
	public void setFile4(String file4) {
		this.file4 = file4;
	}
	public String getFile5() {
		return file5;
	}
	public void setFile5(String file5) {
		this.file5 = file5;
	}
	public String getFile1_thumb() {
		return file1_thumb;
	}
	public void setFile1_thumb(String file1_thumb) {
		this.file1_thumb = file1_thumb;
	}
	public String getIt_size() {
		return it_size;
	}
	public void setIt_size(String it_size) {
		this.it_size = it_size;
	}
	@Override
	public String toString() {
		return "Item [it_uid=" + it_uid + ", category1=" + category1 + ", category2=" + category2 + ", mb_id=" + mb_id
				+ ", it_name=" + it_name + ", it_sale=" + it_sale + ", it_price=" + it_price + ", it_point=" + it_point
				+ ", it_qty=" + it_qty + ", it_option=" + it_option + ", it_use=" + it_use + ", it_date=" + it_date
				+ ", it_type1=" + it_type1 + ", it_type2=" + it_type2 + ", it_type3=" + it_type3 + ", it_type4="
				+ it_type4 + ", it_type5=" + it_type5 + ", file1=" + file1 + ", file2=" + file2 + ", file3=" + file3
				+ ", file4=" + file4 + ", file5=" + file5 + ", file1_thumb=" + file1_thumb + ", it_size=" + it_size
				+ "]";
	}
	
	
}
