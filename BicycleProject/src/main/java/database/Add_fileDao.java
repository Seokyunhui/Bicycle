package database;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Add_fileDao {

	private PreparedStatement pstmt;
	private ResultSet rs;
	DBDriver dbDriver = new DBDriver();

	public Add_fileDto getDto(int id) {
		Connection connection = dbDriver.connDB();
		String sql = "select * from add_file where F_Board_id= ? ";
		Add_fileDto add_fileDto = new Add_fileDto();
		try {
			pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int file_Id = rs.getInt("File_Id");
				String file_Name = rs.getString("File_name");
				int file_Size = rs.getInt("File_size");
				String file_Dir = rs.getString("File_dir");
				String file_Contenttype = rs.getString("File_contenttype");
				int f_Board_Id = rs.getInt("F_Board_id");
				String file_Regdate = rs.getString("File_regdate");
				String file_Editdate = rs.getString("File_editdate");
				int F_Member_id = rs.getInt("F_Member_id");

				add_fileDto.setFile_id(file_Id);
				add_fileDto.setFile_name(file_Name);
				add_fileDto.setFile_size(file_Size);
				add_fileDto.setFile_dir(file_Dir);
				add_fileDto.setFile_contenttype(file_Contenttype);
				add_fileDto.setF_Board_id(f_Board_Id);
				add_fileDto.setFile_regdate(file_Regdate);
				add_fileDto.setFile_editdate(file_Editdate);
				add_fileDto.setF_Member_id(F_Member_id);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return add_fileDto;
	}

	public boolean insert(String file_name, int file_size, String file_dir, String file_Contenttype, int f_Board_id,
			int Member_id) {
		String sql = "insert into add_file (File_name, File_size, File_dir, File_contenttype, F_Board_id, F_Member_id) values(?,?,?,?,?,?)";
		Connection connection = dbDriver.connDB();
		boolean check;
		try {
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, file_name);
			pstmt.setInt(2, file_size);
			pstmt.setString(3, file_dir);
			pstmt.setString(4, file_Contenttype);
			pstmt.setInt(5, f_Board_id);
			pstmt.setInt(6, Member_id);
			pstmt.executeUpdate();
			check = true;
			dbDriver.closeAll(pstmt, connection);
		} catch (SQLException e) {
			check = false;
			e.printStackTrace();
		}
		return check;

	}

	public boolean update(String file_name, int file_size, String file_dir, String file_Contenttype, int f_Board_id) {
		String sql = "update add_file set File_name= ?, File_size = ?,File_dir = ?, File_contenttype = ?  WHERE F_Board_id = ?";
		Connection connection = dbDriver.connDB();
		boolean check;
		try {
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, file_name);
			pstmt.setInt(2, file_size);
			pstmt.setString(3, file_dir);
			pstmt.setString(4, file_Contenttype);
			pstmt.setInt(5, f_Board_id);
			pstmt.executeUpdate();
			check = true;
		} catch (SQLException e) {
			check = false;
			e.printStackTrace();
		}

		return check;

	}

	public void deleteFile(String file) {

		String filePath = "E:\\유창석\\bicycleproject\\Bicycle\\BicycleProject\\src\\main\\WebContent\\web\\upload" + file;

		File deleteFile = new File(filePath);

		if (deleteFile.exists()) {

			deleteFile.delete();

		}
	}

}
