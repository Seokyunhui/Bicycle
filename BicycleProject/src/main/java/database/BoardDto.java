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