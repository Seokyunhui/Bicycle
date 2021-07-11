package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;

public class MemberDao {
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private String id;
	private String pw;
	private String name;
	private ArrayList<MemberDto> dtos = new ArrayList<MemberDto>();
	
	public MemberDao(HttpServletRequest request) {
		id = request.getParameter("userID");
		pw = request.getParameter("userPW"); 
	}

	public void loginAccept() {
		DBDriver dbDriver = new DBDriver();
		Connection conn = dbDriver.connDB();
		String strQuery =  "SELECT * FROM member WHERE Member_id = ?";
		
		try {
			pstmt = conn.prepareStatement(strQuery);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String m_id = rs.getString("Member_id");
				String m_pw = rs.getString("Member_pw");
				String m_name = rs.getString("Member_name");
				int m_group = rs.getInt("Member_group");
				MemberDto mem = new MemberDto(m_id, m_pw, m_name, m_group);
				dtos.add(mem);
				name = m_name;
				dbDriver.closeAll(rs, pstmt, conn);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	public int loginCheck(){
		loginAccept();
		if(dtos == null) {
			return -1; 	//아이디 없음
		}
		for(int i = 0; i < dtos.size(); i++) {
			if(dtos.get(i).getMember_pw().equals(pw)) {
				System.out.println(dtos.get(i).getMember_pw());
				return 1;	// 로그인 성공
			}			
		}
		return 0;	// 패스워드 오류
	}
	
	public String getUserName() {
		return name;
	}
}
