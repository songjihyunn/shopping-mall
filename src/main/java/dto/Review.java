package dto;

public class Review {
		
	    private int tb_uid;
	    private int uid;
	    private String tb_id;
	    private String tb_name;
	    private String tb_comment;
	    private String tb_date;
	    
	    
		public int getTb_uid() {
			return tb_uid;
		}
		public void setTb_uid(int tb_uid) {
			this.tb_uid = tb_uid;
		}
		public int getUid() {
			return uid;
		}
		public void setUid(int uid) {
			this.uid = uid;
		}
		public String getTb_id() {
			return tb_id;
		}
		public void setTb_id(String tb_id) {
			this.tb_id = tb_id;
		}
		public String getTb_name() {
			return tb_name;
		}
		public void setTb_name(String tb_name) {
			this.tb_name = tb_name;
		}
		public String getTb_comment() {
			return tb_comment;
		}
		public void setTb_comment(String tb_comment) {
			this.tb_comment = tb_comment;
		}
		public String getTb_date() {
			return tb_date;
		}
		public void setTb_date(String tb_date) {
			this.tb_date = tb_date;
		}
		@Override
		public String toString() {
			return "Review [tb_uid=" + tb_uid + ", uid=" + uid + ", tb_id=" + tb_id + ", tb_name=" + tb_name
					+ ", tb_comment=" + tb_comment + ", tb_date=" + tb_date + "]";
		}
	 
}
