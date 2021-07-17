package database;

import java.sql.*;
import java.util.ArrayList;

public class MarketBoardDao {
	private PreparedStatement pstmt;
	private ResultSet rs;
	DBDriver dbDriver = new DBDriver();

	public ArrayList<BoardDto> getList() {
		Connection connection = dbDriver.connDB();
		String sql = "select * from boardc";
		ArrayList<BoardDto> arrayList = new ArrayList<>();

		try {
			pstmt = connection.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int market_id = rs.getInt("Market_id");
				int m_Member_id = rs.getInt("B_Member_id");
				int market_Price = rs.getInt("Market_price");
				String market_Addr = rs.getString("Market_addr");
				String boardWriter = rs.getString("member_id");
				String market_Name = rs.getString("Market_name");
				String categorySmall = rs.getString("Category_small");
				String boardRegDate = rs.getString("Board_regdate").substring(0, 10);
				String boardContent = rs.getString("Board_content");
				String boardTitle = rs.getString("Board_title");
				int boardId = rs.getInt("Board_id");
				
				
				BoardDto boardDto = new BoardDto();
				
				boardDto.setMarketId(market_id);
				boardDto.setBoard_writer(boardWriter);
				boardDto.setMember_uid(m_Member_id);
				boardDto.setMarketPrice(market_Price);
				boardDto.setMarketAddr(market_Addr);
				boardDto.setMarketName(market_Name);
				boardDto.setCategory_small(categorySmall);
				boardDto.setBoard_regdate(boardRegDate);
				boardDto.setBoard_content(boardContent);
				boardDto.setBoard_title(boardTitle);
				boardDto.setBoard_id(boardId);
				
				arrayList.add(boardDto);

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return arrayList;

	}
	
	public boolean insert(int Member_id,String market_board_addr,String marketName,int market_price, int board_id) {
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
	
	public BoardDto getDto(int Market_id) {
		Connection connection = dbDriver.connDB();
		String sql = "select * from boardc where market_id = ?";
		BoardDto boardDto = new BoardDto();

		try {
			pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1, Market_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int market_id = rs.getInt("Market_id");
				int m_Member_id = rs.getInt("B_Member_id");
				int market_Price = rs.getInt("Market_price");
				String market_Addr = rs.getString("Market_addr");
				String boardWriter = rs.getString("member_id");
				String market_Name = rs.getString("Market_name");
				String categorySmall = rs.getString("Category_small");
				String boardRegDate = rs.getString("Board_regdate").substring(0, 10);
				String boardContent = rs.getString("Board_content");
				String boardTitle = rs.getString("Board_title");
				int boardId = rs.getInt("Board_id");
				
				
				
				
				boardDto.setMarketId(market_id);
				boardDto.setBoard_writer(boardWriter);
				boardDto.setMember_uid(m_Member_id);
				boardDto.setMarketPrice(market_Price);
				boardDto.setMarketAddr(market_Addr);
				boardDto.setMarketName(market_Name);
				boardDto.setCategory_small(categorySmall);
				boardDto.setBoard_regdate(boardRegDate);
				boardDto.setBoard_content(boardContent);
				boardDto.setBoard_title(boardTitle);
				boardDto.setBoard_id(boardId);
				
				

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return boardDto;

	}
	
	
	public boolean updateMarket(int market_id, String market_name, String market_price) {
		String sql = "update market_board set Market_name = ?, Market_price = ?, Market_addr = ? WHERE market_id = ? ";
		Connection connection = dbDriver.connDB();
		boolean check;
		try {
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, market_name);
			pstmt.setString(2, market_price);
			pstmt.setInt(3, market_id);
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
