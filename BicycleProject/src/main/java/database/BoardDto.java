package database;


public class BoardDto {
	private int info_id;
	private String Category_big;
	private String Category_small;
	private String info_writer;
	private String info_content;
	private int info_hit;
	private String info_regate;
	private String info_editdate;
	
	
	

	public int getInfo_id() {
		return info_id;
	}

	public void setInfo_id(int info_id) {
		this.info_id = info_id;
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

	public String getInfo_writer() {
		return info_writer;
	}

	public void setInfo_writer(String info_writer) {
		this.info_writer = info_writer;
	}

	public String getInfo_content() {
		return info_content;
	}

	public void setInfo_content(String info_content) {
		this.info_content = info_content;
	}

	public int getInfo_hit() {
		return info_hit;
	}

	public void setInfo_hit(int info_hit) {
		this.info_hit = info_hit;
	}

	public String getInfo_regate() {
		return info_regate;
	}

	public void setInfo_regate(String info_regate) {
		this.info_regate = info_regate;
	}

	public String getInfo_editdate() {
		return info_editdate;
	}

	public void setInfo_editdate(String info_editdate) {
		this.info_editdate = info_editdate;
	}
	
	
}