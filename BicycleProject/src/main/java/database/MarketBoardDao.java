package database;

import java.sql.*;
import java.util.ArrayList;

public class MarketBoardDao {
	private PreparedStatement pstmt;
	private ResultSet rs;
	DBDriver dbDriver = new DBDriver();

	public boolean insert(int Member_id, String market_board_addr, String marketName, int market_price, int board_id) {
		Connection connection = dbDriver.connDB();
		boolean check;

		try {
			String marketSql = "insert into market_board(M_Board_id, Market_price, Market_addr, Market_name) values(?,?,?,?)";
			pstmt = connection.prepareStatement(marketSql);
			pstmt.setInt(1, board_id);
			pstmt.setInt(2, market_price);
			pstmt.setString(3, market_board_addr);
			pstmt.setString(4, marketName);
			pstmt.executeUpdate();
			dbDriver.closeAll(pstmt, connection);
			check = true;
		} catch (SQLException e) {
			check = false;
			e.printStackTrace();
		}
		return check;

	}

	public BoardcDto getDto(int Market_id) {
		Connection connection = dbDriver.connDB();
		String sql = "select * from boardc where market_id = ?";
		BoardcDto boardcDto = new BoardcDto();

		try {
			pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1, Market_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int b_Member_Id = rs.getInt("B_Member_id");
				String member_Id = rs.getString("member_id");
				String member_Phone = rs.getString("Member_phone");
				String category_Small = rs.getString("Category_small");
				int board_Id = rs.getInt("Board_id");
				String board_Title = rs.getString("Board_title");
				String board_Content = rs.getString("Board_content");
				String board_Editdate = rs.getString("Board_editdate").substring(0, 10);
				String market_Name = rs.getString("Market_name");
				int market_Price = rs.getInt("Market_price");
				String market_Addr = rs.getString("Market_addr");
				int market_Id = rs.getInt("Market_id");

				boardcDto.setB_Member_Id(b_Member_Id);
				boardcDto.setMember_Id(member_Id);
				boardcDto.setMember_Phone(member_Phone);
				boardcDto.setCategory_Small(category_Small);
				boardcDto.setBoard_Id(board_Id);
				boardcDto.setBoard_Title(board_Title);
				boardcDto.setBoard_Content(board_Content);
				boardcDto.setBoard_Editdate(board_Editdate);
				boardcDto.setMarket_Name(market_Name);
				boardcDto.setMarket_Price(market_Price);
				boardcDto.setMarket_Addr(market_Addr);
				boardcDto.setMarket_Id(market_Id);

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return boardcDto;

	}

	public MarketBoardDto getMarketDto(int Market_id) {
		Connection connection = dbDriver.connDB();
		String sql = "select * from market_board where market_id = ?";
		MarketBoardDto marBoardDto = new MarketBoardDto();

		try {
			pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1, Market_id); 
			rs = pstmt.executeQuery();
			while (rs.next()) {

				marBoardDto.setMarketId(rs.getInt("Market_id"));
				marBoardDto.setM_Board_Id(rs.getInt("M_Board_id"));
				marBoardDto.setMarketName(rs.getString("market_name"));
				marBoardDto.setMarketPrice(rs.getInt("Market_price"));
				marBoardDto.setMarketAddr(rs.getString("Market_addr"));
				marBoardDto.setMarketState(rs.getString("Market_state"));

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return marBoardDto;

	}

	public boolean updateMarket(int market_id, String market_name, String marekt_addr, String market_price, String market_State) {
		String sql = "update market_board set Market_name = ?, Market_price = ?, Market_addr = ?, Market_state = ? WHERE market_id = ? ";
		Connection connection = dbDriver.connDB();
		boolean check;
		try {
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, market_name);
			pstmt.setString(2, market_price);
			pstmt.setString(3, marekt_addr);
			pstmt.setString(4, market_State);
			pstmt.setInt(5, market_id);
			
			pstmt.executeUpdate();
			check = true;
			dbDriver.closeAll(pstmt, connection);
		} catch (SQLException e) {
			check = false;
			e.printStackTrace();
		}

		return check;

	}

	public boolean deletemarekt(int Board_id, int market_id) {
		String sql = "DELETE FROM market_board WHERE M_Board_id = ? AND Market_id = ?";
		Connection connection = dbDriver.connDB();
		boolean check;
		try {
			pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1, Board_id);
			pstmt.setInt(2, market_id);
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
