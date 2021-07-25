package database;

import java.sql.*;
import java.util.*;

public class CommentDao {
	private PreparedStatement pstmt;
	private ResultSet rs;
	DBDriver dbDriver = new DBDriver();
	
	public int getboardId(String writer, String boardContent , int member_id) {
		Connection connection = dbDriver.connDB();
		String sql = "select Board_id from Board where Board_writer = ? AND Board_content = ? AND B_Member_id = ?  ";
		int boardId = 0;
		try {
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, writer);
			pstmt.setString(2, boardContent);
			pstmt.setInt(3, member_id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				boardId = rs.getInt("Board_id");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return boardId;
		
		
	}
	
	

	public ArrayList<CommentDto> getList(int boardid) {
		ArrayList<CommentDto> arrayList = new ArrayList<>();
		Connection connection = dbDriver.connDB();
		String sql = "select * from Comment where C_Board_id = ?";
		try {
			pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1, boardid);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int CommentId = rs.getInt("Comment_id");
				String Commentname = rs.getString("Comment_name");
				String CommentContent = rs.getString("Comment_content");
				String CommentReg = rs.getString("Comment_regdate");
				String CommentEdit = rs.getString("Comment_editdate");
				int MemberId = rs.getInt("C_Member_id");
				int BoardId = rs.getInt("C_Board_id");
				int member_uid = rs.getInt("C_Member_id");
				
				CommentDto commentDto = new CommentDto();
				commentDto.setComment_id(CommentId);
				commentDto.setComment_name(Commentname);
				commentDto.setComment_content(CommentContent);
				commentDto.setComment_regdate(CommentReg);
				commentDto.setComment_editdate(CommentEdit);
				commentDto.setC_Member_id(MemberId);
				commentDto.setC_Board_id(BoardId);
				commentDto.setMember_uid(member_uid);
				
				arrayList.add(commentDto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return arrayList;

	}
	public CommentDto getDto(int id) {
		Connection connection = dbDriver.connDB();
		String sql = "select * from Comment where C_Board_id= ? ";
		CommentDto commentDto = new CommentDto();
		try {
			pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int CommentId = rs.getInt("Comment_id");
				String Commentname = rs.getString("Comment_name");
				String CommentContent = rs.getString("Comment_content");
				String CommentReg = rs.getString("Comment_regdate");
				String CommentEdit = rs.getString("Comment_editdate");
				int MemberId = rs.getInt("C_Member_id");
				int BoardId = rs.getInt("C_Board_id");

				commentDto.setComment_id(CommentId);
				commentDto.setComment_name(Commentname);
				commentDto.setComment_content(CommentContent);
				commentDto.setComment_regdate(CommentReg);
				commentDto.setComment_editdate(CommentEdit);
				commentDto.setC_Member_id(MemberId);
				commentDto.setC_Board_id(BoardId);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return commentDto;
	}
	public CommentDto getcontent(int id) {
		Connection connection = dbDriver.connDB();
		String sql = "select * from Comment where Comment_id= ? ";
		CommentDto commentDto = new CommentDto();
		try {
			pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int CommentId = rs.getInt("Comment_id");
				String Commentname = rs.getString("Comment_name");
				String CommentContent = rs.getString("Comment_content");
				int MemberId = rs.getInt("C_Member_id");
				int BoardId = rs.getInt("C_Board_id");

				commentDto.setComment_id(CommentId);
				commentDto.setComment_name(Commentname);
				commentDto.setComment_content(CommentContent);
				commentDto.setC_Member_id(MemberId);
				commentDto.setC_Board_id(BoardId);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return commentDto;
	}

	public boolean insert(String Comment_name, String Comment_content,int C_Member_id, int C_Board_id) {
		String sql = "insert into comment (Comment_name, Comment_content, C_Member_id, C_Board_id) values(?,?,?,?)";
		Connection connection = dbDriver.connDB();
		boolean check;
		try {
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, Comment_name);
			pstmt.setString(2, Comment_content);
			pstmt.setInt(3, C_Member_id);
			pstmt.setInt(4, C_Board_id);
			pstmt.executeUpdate();
			check = true;
			dbDriver.closeAll(pstmt, connection);
		} catch (SQLException e) {
			check = false;
			e.printStackTrace();
		}
		return check;

	} //물어보기

	public boolean delete(int Comment_id) {
		String sql = "DELETE FROM comment WHERE Comment_id=?";
		Connection connection = dbDriver.connDB();
		boolean check;
		try {
			pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1, Comment_id);
			pstmt.executeUpdate();
			dbDriver.closeAll(pstmt, connection);
			check = true;
		} catch (SQLException e) {
			check = false;
			e.printStackTrace();
		}
		return check;

	}

	public boolean update(int Comment_id, String content) {
		String sql = "update comment set Comment_content = ? WHERE Comment_id = ? ";
		Connection connection = dbDriver.connDB();
		boolean check;
		try {
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, content);
			pstmt.setInt(2, Comment_id);
			pstmt.executeUpdate();
			check = true;
			dbDriver.closeAll(pstmt, connection);
		} catch (SQLException e) {
			check = false;
			e.printStackTrace();
		}

		return check;

	}
	
	public int countComment(int Board_id) {
		String sql = "select count(*) from comment where C_Board_id = ?";
		Connection connection = dbDriver.connDB();
		int count_cmt = 0;
		try {
			pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1, Board_id);
			pstmt.executeQuery();
			while (rs.next()) {
				count_cmt = rs.getInt("Count(*)");
			}
			return count_cmt;
			
		} catch (Exception e) {
			
		}
		return 0;
	}
	

}
