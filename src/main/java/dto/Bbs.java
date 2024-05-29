package dto;

public class Bbs {
	    private int uid; // uid 필드
	    private String id; // 사용자 ID
	    private String name; // 이름
	    private String subject; // 주제
	    private String comment; // 댓글
	    private String signdate; // 서명 날짜
	    private int ref; // 참조
	    private String gongji; // '1', '2', '3' 중 하나를 가지는 필드
	    private String file1; // 파일 1
	    private String file1_o; // 원본 파일 1
	    private String file1_s; // 축소 파일 1
	    private int fid; // fid 필드
	    private String thread; // 스레드
	    
		public int getUid() {
			return uid;
		}
		public void setUid(int uid) {
			this.uid = uid;
		}
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getSubject() {
			return subject;
		}
		public void setSubject(String subject) {
			this.subject = subject;
		}
		public String getComment() {
			return comment;
		}
		public void setComment(String comment) {
			this.comment = comment;
		}
		public String getSigndate() {
			return signdate;
		}
		public void setSigndate(String signdate) {
			this.signdate = signdate;
		}
		public int getRef() {
			return ref;
		}
		public void setRef(int ref) {
			this.ref = ref;
		}
		public String getGongji() {
			return gongji;
		}
		public void setGongji(String gongji) {
			this.gongji = gongji;
		}
		public String getFile1() {
			return file1;
		}
		public void setFile1(String file1) {
			this.file1 = file1;
		}
		public String getFile1_o() {
			return file1_o;
		}
		public void setFile1_o(String file1_o) {
			this.file1_o = file1_o;
		}
		public String getFile1_s() {
			return file1_s;
		}
		public void setFile1_s(String file1_s) {
			this.file1_s = file1_s;
		}
		public int getFid() {
			return fid;
		}
		public void setFid(int fid) {
			this.fid = fid;
		}
		public String getThread() {
			return thread;
		}
		public void setThread(String thread) {
			this.thread = thread;
		}
		
		@Override
		public String toString() {
			return "Bbs [uid=" + uid + ", id=" + id + ", name=" + name + ", subject=" + subject + ", comment=" + comment
					+ ", signdate=" + signdate + ", ref=" + ref + ", gongji=" + gongji + ", file1=" + file1
					+ ", file1_o=" + file1_o + ", file1_s=" + file1_s + ", fid=" + fid + ", thread=" + thread + "]";
		}
}
