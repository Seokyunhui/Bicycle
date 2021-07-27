package database;

import java.sql.*;
import java.util.ArrayList;

public class BoardcDao {
	private PreparedStatement pstmt;
	private ResultSet rs;
	DBDriver dbDriver = new DBDriver();
	
	//BoardC 테이블 리스트 리턴 처리 페이지네이션 처리?
	public ArrayList<BoardcDto> getList(String cetegory_sm, int pagesize) {
		Connection connection = dbDriver.connDB();
		String sql = "select * from boardc where Category_small = ? ORDER BY Board_id DESC LIMIT ?, 10 ";
		ArrayList<BoardcDto> arrayList = new ArrayList<>();

		try {
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, cetegory_sm);
			pstmt.setInt(2, pagesize);
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

				BoardcDto boardcDto = new BoardcDto();

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

				arrayList.add(boardcDto);

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return arrayList;

	}
	
	//BoardC 테이블 리스트 리턴 처리
	public ArrayList<BoardcDto> getList(String cetegory_sm) {
		Connection connection = dbDriver.connDB();
		String sql = "select * from boardc where Category_small = ? ORDER BY Board_id DESC";
		ArrayList<BoardcDto> arrayList = new ArrayList<>();

		try {
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, cetegory_sm);
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

				BoardcDto boardcDto = new BoardcDto();

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

				arrayList.add(boardcDto);

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return arrayList;

	}
	
	//BoardcDto를 market_id 값으로 객체 리턴 처리
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
}
