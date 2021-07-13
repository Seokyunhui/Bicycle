package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class BoardDao {
	private PreparedStatement pstmt;
	private ResultSet rs;
	DBDriver dbDriver = new DBDriver();

//	public void addBoard() {
//		Connection connection = dbDriver.connDB();
//		String sql = "insert into "
//		Connection
//		
//		
//	}
	
	public ArrayList<BoardDto> getList() {
		ArrayList<BoardDto> arrayList = new ArrayList<>();
		Connection connection = dbDriver.connDB();
		String sql = "select * from Board";
		try {
			pstmt = connection.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String categoryBig = rs.getString("Category_big");
				String categorySmall = rs.getString("Category_small");
				String boardRegDate = rs.getString("Board_regdate");
				String boardContent = rs.getString("Board_content");
				String boardWriter = rs.getString("Board_writer");

				BoardDto boardDto = new BoardDto();
				boardDto.setCategory_big(categoryBig);
				boardDto.setCategory_small(categorySmall);
				boardDto.setBoard_regdate(boardRegDate);
				boardDto.setBoard_content(boardContent);
				boardDto.setBoard_writer(boardWriter);

				arrayList.add(boardDto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return arrayList;

	}

}
