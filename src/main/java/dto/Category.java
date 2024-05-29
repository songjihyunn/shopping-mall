package dto;

public class Category {
	String ca_id;
	String ca_name;
	String ca_use;
	public String getCa_id() {
		return ca_id;
	}
	public void setCa_id(String ca_id) {
		this.ca_id = ca_id;
	}
	public String getCa_name() {
		return ca_name;
	}
	public void setCa_name(String ca_name) {
		this.ca_name = ca_name;
	}
	public String getCa_use() {
		return ca_use;
	}
	public void setCa_use(String ca_use) {
		this.ca_use = ca_use;
	}
	@Override
	public String toString() {
		return "Category [ca_id=" + ca_id + ", ca_name=" + ca_name + ", ca_use=" + ca_use + "]";
	}
	
	
}
