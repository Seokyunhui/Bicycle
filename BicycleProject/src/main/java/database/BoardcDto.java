package database;

public class BoardcDto {
	private int b_Member_Id; // 글 등록 회원 일련번호
	private String member_Id; // 글 등록 회원 아이디 필드
	private String member_Phone; // 글 등록 회원 전화번호 필드
	private String category_Small; // 게시글 소분류 필드
	private int board_Id; // 게시글 일련번호 필드
	private String board_Title; // 게시글 제목 필드
	private String board_Content; // 게시글 내용 필드
	private String board_Editdate; // 게시글 작성&수정 날짜 필드
	private String market_Name; // 중고거래 종류
	private int market_Price; // 중고거래 물품 가격 필드
	private String market_Addr; // 중고거래 거래 지역 필드
	private int market_Id; // 중고거래 테이블 PK

	public int getB_Member_Id() {
		return b_Member_Id;
	}

	public void setB_Member_Id(int b_Member_Id) {
		this.b_Member_Id = b_Member_Id;
	}

	public String getMember_Id() {
		return member_Id;
	}

	public void setMember_Id(String member_Id) {
		this.member_Id = member_Id;
	}

	public String getMember_Phone() {
		return member_Phone;
	}

	public void setMember_Phone(String member_Phone) {
		this.member_Phone = member_Phone;
	}

	public String getCategory_Small() {
		return category_Small;
	}

	public void setCategory_Small(String category_Small) {
		this.category_Small = category_Small;
	}

	public int getBoard_Id() {
		return board_Id;
	}

	public void setBoard_Id(int board_Id) {
		this.board_Id = board_Id;
	}

	public String getBoard_Title() {
		return board_Title;
	}

	public void setBoard_Title(String board_Title) {
		this.board_Title = board_Title;
	}

	public String getBoard_Content() {
		return board_Content;
	}

	public void setBoard_Content(String board_Content) {
		this.board_Content = board_Content;
	}

	public String getBoard_Editdate() {
		return board_Editdate;
	}

	public void setBoard_Editdate(String board_Editdate) {
		this.board_Editdate = board_Editdate;
	}

	public String getMarket_Name() {
		return market_Name;
	}

	public void setMarket_Name(String market_Name) {
		this.market_Name = market_Name;
	}

	public int getMarket_Price() {
		return market_Price;
	}

	public void setMarket_Price(int market_Price) {
		this.market_Price = market_Price;
	}

	public String getMarket_Addr() {
		return market_Addr;
	}

	public void setMarket_Addr(String market_Addr) {
		this.market_Addr = market_Addr;
	}

	public int getMarket_Id() {
		return market_Id;
	}

	public void setMarket_Id(int market_Id) {
		this.market_Id = market_Id;
	}

}