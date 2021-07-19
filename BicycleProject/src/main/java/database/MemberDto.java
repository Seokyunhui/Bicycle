package database;

public class MemberDto {
	private int Member_uid;	
	private String Member_id;	// 아이디
	private String Member_pw;	// 패스워드
	private String Member_name;	// 이름
	private int Member_phone;	// 전화번호 	
	private String Member_mail;	// 메일
	private String Member_regdate;	// 가입날짜
	private int Member_group; // 기본 :0 , 카카오 : 1 , 네이버 : 2 , 구글 : 3 ,관리자 : 5
	private int Member_regcount;	// 글 등록 개수
	private int Member_comcount;	// 댓글 등록 개수
	private int Member_ch_dist;	// 챌린지 주행거리 
	
	
	public MemberDto(String Member_id){
		this.Member_id = Member_id;
	}
	// 로그인 생성자
	public MemberDto(String Member_id, String Member_pw, String Member_name, int Member_group) {
		this.Member_id = Member_id;
		this.Member_pw = Member_pw;
		this.Member_name = Member_name;
		this.Member_group = Member_group;
	}
	// 회원가입 생성자
	public MemberDto(String Member_id, String Member_pw, String Member_name,int Member_phone,String Member_mail) {
		this.Member_id = Member_id;
		this.Member_pw = Member_pw;
		this.Member_name = Member_name;
		this.Member_phone = Member_phone;
		this.Member_mail = Member_mail;
	}
	//userInfo 생성자
	public MemberDto(int Member_uid,String Member_id,String Member_pw,String Member_name,int Member_phone,String Member_mail,String Member_regdate,int Member_group,int Member_regcount,int Member_comcount,int Member_ch_dist) {
		this.Member_id = Member_id;
		this.Member_pw = Member_pw;
		this.Member_name = Member_name;
		this.Member_phone = Member_phone;
		this.Member_mail = Member_mail;
		this.Member_regdate = Member_regdate;
		this.Member_group = Member_group;
		this.Member_regcount = Member_regcount;
		this.Member_comcount = Member_comcount;
		this.Member_ch_dist = Member_ch_dist;
	}
	public String getMember_id() {
		return Member_id;
	}
	public void setMember_id(String member_id) {
		Member_id = member_id;
	}
	public String getMember_pw() {
		return Member_pw;
	}
	public void setMember_pw(String member_pw) {
		Member_pw = member_pw;
	}
	public String getMember_name() {
		return Member_name;
	}
	public void setMember_name(String member_name) {
		Member_name = member_name;
	}
	public int getMember_phone() {
		return Member_phone;
	}
	public void setMember_phone(int member_phone) {
		Member_phone = member_phone;
	}
	public String getMember_mail() {
		return Member_mail;
	}
	public void setMember_mail(String member_mail) {
		Member_mail = member_mail;
	}
	public int getMember_group() {
		return Member_group;
	}
	public void setMember_group(int member_group) {
		Member_group = member_group;
	}
	public int getMember_regcount() {
		return Member_regcount;
	}
	public void setMember_regcount(int member_regcount) {
		Member_regcount = member_regcount;
	}
	public int getMember_comcount() {
		return Member_comcount;
	}
	public void setMember_comcount(int member_comcount) {
		Member_comcount = member_comcount;
	}
	public int getMember_ch_dist() {
		return Member_ch_dist;
	}
	public void setMember_ch_dist(int member_ch_dist) {
		Member_ch_dist = member_ch_dist;
	}
	public int getMember_uid() {
		return Member_uid;
	}
	public String getMember_regdate() {
		return Member_regdate;
	}
}
