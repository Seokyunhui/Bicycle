package database;

public class Add_fileDto {
	int File_id;
	String File_name;
	int File_size;
	String File_dir;
	String File_contenttype;
	int F_Board_id;
	String File_regdate;
	String File_editdate;
	int F_Member_id;

	public int getFile_id() {
		return File_id;
	}

	public void setFile_id(int file_id) {
		File_id = file_id;
	}

	public String getFile_name() {
		return File_name;
	}

	public void setFile_name(String file_name) {
		File_name = file_name;
	}

	public int getFile_size() {
		return File_size;
	}

	public void setFile_size(int file_size) {
		File_size = file_size;
	}

	public String getFile_dir() {
		return File_dir;
	}

	public void setFile_dir(String file_dir) {
		File_dir = file_dir;
	}

	public String getFile_contenttype() {
		return File_contenttype;
	}

	public void setFile_contenttype(String file_contenttype) {
		File_contenttype = file_contenttype;
	}

	public int getF_Board_id() {
		return F_Board_id;
	}

	public void setF_Board_id(int f_Board_id) {
		F_Board_id = f_Board_id;
	}

	public String getFile_regdate() {
		return File_regdate;
	}

	public void setFile_regdate(String file_regdate) {
		File_regdate = file_regdate;
	}

	public String getFile_editdate() {
		return File_editdate;
	}

	public void setFile_editdate(String file_editdate) {
		File_editdate = file_editdate;
	}

	public int getF_Member_id() {
		return F_Member_id;
	}

	public void setF_Member_id(int f_Member_id) {
		F_Member_id = f_Member_id;
	}

}
