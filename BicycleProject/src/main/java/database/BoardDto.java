package database;

public class BoardDto {
	private int Board_id;
	private String Category_big;
	private String Category_small;
	private String Board_writer;
	private String Board_content;
	private int info_hit;
	private String Board_regdate;
	private String Board_editdate;
	private String Board_title;
	private int marketId; // 중고거래 테이블 PK
	private int m_Board_Id; // 게시판 테이블 FK
	private int marketPrice; // 중고거래 가격
	private String marketAddr; // 중고거래 주소
	private String marketName; // 중고거래 종류
	private int member_uid;

	public int getMember_uid() {
		return member_uid;
	}

	public void setMember_uid(int member_uid) {
		this.member_uid = member_uid;
	}

	public int getMarketId() {
		return marketId;
	}

	public void setMarketId(int marketId) {
		this.marketId = marketId;
	}

	public int getM_Board_Id() {
		return m_Board_Id;
	}

	public void setM_Board_Id(int m_Board_Id) {
		this.m_Board_Id = m_Board_Id;
	}

	public int getMarketPrice() {
		return marketPrice;
	}

	public void setMarketPrice(int marketPrice) {
		this.marketPrice = marketPrice;
	}

	public String getMarketAddr() {
		return marketAddr;
	}

	public void setMarketAddr(String marketAddr) {
		this.marketAddr = marketAddr;
	}

	public String getMarketName() {
		return marketName;
	}

	public void setMarketName(String marketName) {
		this.marketName = marketName;
	}

	public String getBoard_title() {
		return Board_title;
	}

	public void setBoard_title(String board_title) {
		Board_title = board_title;
	}

	public int getBoard_id() {
		return Board_id;
	}

	public void setBoard_id(int board_id) {
		Board_id = board_id;
	}

	public String getCategory_big() {
		return Category_big;
	}

	public void setCategory_big(String category_big) {
		Category_big = category_big;
	}

	public String getCategory_small() {
		return Category_small;
	}

	public void setCategory_small(String category_small) {
		Category_small = category_small;
	}

	public String getBoard_writer() {
		return Board_writer;
	}
	
	public void setBoard_writer(String board_writer) {
		Board_writer = board_writer;
	}

	public String getBoard_content() {
		return Board_content;
	}

	public void setBoard_content(String board_content) {
		Board_content = board_content;
	}

	public int getInfo_hit() {
		return info_hit;
	}

	public void setInfo_hit(int info_hit) {
		this.info_hit = info_hit;
	}

	public String getBoard_regdate() {
		return Board_regdate;
	}

	public void setBoard_regdate(String board_regdate) {
		Board_regdate = board_regdate;
	}

	public String getBoard_editdate() {
		return Board_editdate;
	}

	public void setBoard_editdate(String board_editdate) {
		Board_editdate = board_editdate;
	}

}