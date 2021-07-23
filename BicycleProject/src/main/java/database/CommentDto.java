package database;

public class CommentDto {
	
	private int Comment_id; // 덧글 번호
	private String Comment_name; // 아이디
	private String Comment_content; //내용
	private String Comment_regdate; // 댓글 작성일
	private String Comment_editdate; // 댓글 수정일
	private int C_Member_id; // 회원일련번호
	private int C_Board_id; // 문서일련번호
	private int member_uid;

	
	public int getMember_uid() {
		return member_uid;
	}
	public void setMember_uid(int member_uid) {
		this.member_uid = member_uid;
	}
	public void setComment_id(int comment_id) {
		Comment_id = comment_id;
	}
	public void setComment_name(String comment_name) {
		Comment_name = comment_name;
	}
	public void setComment_content(String comment_content) {
		Comment_content = comment_content;
	}
	public void setComment_regdate(String comment_regdate) {
		Comment_regdate = comment_regdate;
	}
	public void setComment_editdate(String comment_editdate) {
		Comment_editdate = comment_editdate;
	}
	public void setC_Member_id(int member_id) {
		C_Member_id = member_id;
	}
	public void setC_Board_id(int board_id) {
		C_Board_id = board_id;
	}
	public int getComment_id() {
		return Comment_id;
	}
	public String getComment_name() {
		return Comment_name;
	}
	public String getComment_content() {
		return Comment_content;
	}
	public String getComment_regdate() {
		return Comment_regdate;
	}
	public String getComment_editdate() {
		return Comment_editdate;
	}
	public int getMember_id() {
		return C_Member_id;
	}
	public int getBoard_id() {
		return C_Board_id;
	}
	
	

}
