package database;

import org.json.simple.JSONArray;

import java.sql.*;
import java.util.ArrayList;

public class ChallegeDao {
	private PreparedStatement pstmt;
	private ResultSet rs;
	DBDriver dbDriver = new DBDriver();
	MemberDao memberDao = new MemberDao();

	public JSONArray getdistrank() {

		Connection con = dbDriver.connDB();

		String sql = "SELECT Ch_Member_id,sum(Challenge_dist) from challege where admin_approval = 1 group by Ch_Member_id order by sum(Challenge_dist) desc Limit 5";

		JSONArray jsonArray = new JSONArray();

		JSONArray colNameArray = new JSONArray(); // 컬 타이틀 설정
		
		int i = 1;

		colNameArray.add("단위(km)");

		colNameArray.add("주행거리");
		
		jsonArray.add(colNameArray);

		try {

			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				JSONArray rowArray = new JSONArray();
				String rank = i + "등 )";
				String Member_name = String.format("%s %s님", rank, memberDao.getUserInfo(rs.getInt("Ch_Member_id")).getMember_id() );
				
				rowArray.add(Member_name);
				
				rowArray.add(rs.getInt("sum(Challenge_dist)"));

				jsonArray.add(rowArray);
				
				i++;
				
			} 

		} catch (Exception e) {

			e.printStackTrace();

		} finally {

			dbDriver.connDB();

		}

		return jsonArray;

	}
	
	public ArrayList<ChallegeDto> getList(){
		
		ArrayList<ChallegeDto> arrayList = new ArrayList<>();
		Connection con = dbDriver.connDB();
		String sql = "select * from challege order by Challenge_regdate desc";
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
			int challebge_id = rs.getInt("Challenge_id");
			int ch_Member_Id = rs.getInt("Ch_Member_id");
			String Challenge_content = rs.getString("Challenge_contents");
			int challenge_Dist = rs.getInt("Challenge_dist");
			String challenge_regdate = rs.getString("Challenge_regdate").substring(0, 10);
			int admin_approval = rs.getInt("admin_approval");
			
			ChallegeDto challegeDto = new ChallegeDto();
			challegeDto.setChallenge_id(challebge_id);
			challegeDto.setCh_Member_id(ch_Member_Id);
			challegeDto.setChallenge_content(Challenge_content);
			challegeDto.setChallenge_dist(challenge_Dist);
			challegeDto.setChallenge_regdate(challenge_regdate);
			challegeDto.setAdmin_approval(admin_approval);
			
			arrayList.add(challegeDto);
			
			}
			
			
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		return arrayList;
		
	}
	public ArrayList<ChallegeDto> getList(int member_uid){
		
		ArrayList<ChallegeDto> arrayList = new ArrayList<>();
		Connection con = dbDriver.connDB();
		String sql = "select * from challege where Ch_Member_id = ? order by Challenge_regdate desc";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, member_uid);
			rs = pstmt.executeQuery();
			while(rs.next()) {
			int challebge_id = rs.getInt("Challenge_id");
			int ch_Member_Id = rs.getInt("Ch_Member_id");
			String Challenge_content = rs.getString("Challenge_contents");
			int challenge_Dist = rs.getInt("Challenge_dist");
			String challenge_regdate = rs.getString("Challenge_regdate").substring(0, 10);
			int admin_approval = rs.getInt("admin_approval");
			
			ChallegeDto challegeDto = new ChallegeDto();
			challegeDto.setChallenge_id(challebge_id);
			challegeDto.setCh_Member_id(ch_Member_Id);
			challegeDto.setChallenge_content(Challenge_content);
			challegeDto.setChallenge_dist(challenge_Dist);
			challegeDto.setChallenge_regdate(challenge_regdate);
			challegeDto.setAdmin_approval(admin_approval);
			
			arrayList.add(challegeDto);
			
			}
			
			
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		return arrayList;
		
	}
	
	
	
	
	public boolean insert(int member_id,String Challenge_content,int Challenge_dist) {
		Connection con = dbDriver.connDB();
		String sql = "insert into challege (Ch_Member_id,Challenge_contents,Challenge_dist) values (?,?,?)";
		boolean check;
		check = true;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, member_id);
			pstmt.setString(2, Challenge_content);
			pstmt.setInt(3, Challenge_dist);

			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			check = false;
			e.printStackTrace();
		}
		return check;
		
	}
	
	public boolean update(int admin_approval, int Challenge_id) {
		Connection con = dbDriver.connDB();
		String sql = "update challege set admin_approval = ? where Challenge_id = ?";
		boolean check;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, admin_approval);
			pstmt.setInt(2, Challenge_id);
			pstmt.executeUpdate();
			check = true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			check = false;
			e.printStackTrace();
		}
		return check;
		
	}
	
	
}
