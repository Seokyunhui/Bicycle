package database;

import java.sql.*;
import java.util.ArrayList;

public class MarketBoardDao {
	private PreparedStatement pstmt;
	private ResultSet rs;
	DBDriver dbDriver = new DBDriver();

	public ArrayList<MarketBoardDto> getList() {
		Connection connection = dbDriver.connDB();
		String sql = "select * form market_board";
		ArrayList<MarketBoardDto> arrayList = new ArrayList<>();

		try {
			pstmt = connection.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int market_id = rs.getInt("Market_id");
				int m_Board_Id = rs.getInt("M_Board_id");
				int market_Price = rs.getInt("Market_price");
				String market_Addr = rs.getString("Market_addr");
				String market_Name = rs.getString("Market_name");

				MarketBoardDto marketBoardDto = new MarketBoardDto();
				marketBoardDto.setMarketId(market_id);
				marketBoardDto.setM_Board_Id(m_Board_Id);
				marketBoardDto.setMarketPrice(market_Price);
				marketBoardDto.setMarketAddr(market_Addr);
				marketBoardDto.setMarketName(market_Name);

				arrayList.add(marketBoardDto);

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return arrayList;

	}
	
	public boolean insert(String Category_big, String Category_small, String title, String content, String writer,
			int Member_id,String market_board_addr,String marketName,int market_price) {
		String sql = "insert into board (Category_big, Category_small, Board_title, Board_content, Board_writer, B_Member_id) values(?,?,?,?,?,?)";
		Connection connection = dbDriver.connDB();
		boolean check;
		try {
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, Category_big);
			pstmt.setString(2, Category_small);
			pstmt.setString(3, title);
			pstmt.setString(4, content);
			pstmt.setString(5, writer);
			pstmt.setInt(6, Member_id);
			pstmt.executeUpdate();
			check = true;
			
		} catch (SQLException e) {
			check = false;
			e.printStackTrace();
		}
		
		
		try {
			int board_id = 0;
			String boardid = 
					"select Board_id from board where Category_big = ? and Category_small = ? and Board_title = ? and Board_content = ? and Board_writer = ? and B_Member_id = ?";
			pstmt = connection.prepareStatement(boardid);
			pstmt.setString(1, Category_big);
			pstmt.setString(2, Category_small);
			pstmt.setString(3, title);
			pstmt.setString(4, content);
			pstmt.setString(5, writer);
			pstmt.setInt(6, Member_id);
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
			board_id = rs.getInt("board_id");
			}
			
			String marketSql = "insert into market_board(M_Board_id, Market_price, Market_addr, Market_name) values(?,?,?,?)";
			pstmt = connection.prepareStatement(marketSql);
			pstmt.setInt(1, board_id);
			pstmt.setInt(2, market_price);
			pstmt.setString(3, market_board_addr);
			pstmt.setNString(4, marketName);
			pstmt.executeUpdate();
			dbDriver.closeAll(pstmt, connection);
			check = true;
		} catch (SQLException e) {
			check = false;
			e.printStackTrace();
		}
		return check;

	}
	
	

}
