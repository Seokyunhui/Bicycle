package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;

public class MemberDao {
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private String id;
	private String pw;
	private String name;
	private ArrayList<MemberDto> dtos = new ArrayList<MemberDto>();
	
	
	public MemberDao() {} 
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
			}
			dbDriver.closeAll(rs, pstmt, conn);
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
				return 1;	// 로그인 성공
			}			
		}
		return 0;	// 패스워드 오류
	}
	
	public String getUserName() {
		return name;
	}
	
	public String getUserGroup(String id) {
		DBDriver dbDriver = new DBDriver();
		Connection conn = dbDriver.connDB();
		String strQuery =  "SELECT Member_group FROM member WHERE Member_id = ?";
		String group = null;
		try {
			pstmt = conn.prepareStatement(strQuery);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			rs.next();
			group = rs.getString("Member_group");
			dbDriver.closeAll(rs, pstmt, conn);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return group;
	}
	public int Mem_register(MemberDto mem) {
		Select_Member();
		if(dtos == null)
			return -1;
		for(int i = 0; i < dtos.size(); i++) {
			if(dtos.get(i).getMember_id().equals(mem.getMember_id())) {
				return 1; // 아이디 중복
			}
		}
		Insert_Member(mem);
		return 0; // 아이디 중복 X // 회원 등록 O
	}
	public void Select_Member() {
		DBDriver dbDriver = new DBDriver();
		Connection conn =dbDriver.connDB();
		String strQuery = "SELECT * FROM member";
		try {
			pstmt = conn.prepareStatement(strQuery);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String m_id = rs.getString("Member_id");
				MemberDto mem = new MemberDto(m_id);
				dtos.add(mem);
			}			
			dbDriver.closeAll(rs, pstmt, conn);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	public void Insert_Member(MemberDto mem) {
		DBDriver dbDriver = new DBDriver();
		Connection conn =dbDriver.connDB();
		String strQuery = "INSERT INTO Member (Member_id, Member_pw, Member_name, Member_phone,Member_mail_id,Member_mail_addr) values (?,?,?,?,?,?)";

		try {
			pstmt = conn.prepareStatement(strQuery);
			pstmt.setString(1, mem.getMember_id());
			pstmt.setString(2, mem.getMember_pw());
			pstmt.setString(3, mem.getMember_name());
			pstmt.setInt(4, mem.getMember_phone());
			String[] mail = mem.getMember_mail().split("@");
			pstmt.setString(5, mail[0]);
			pstmt.setString(6, mail[1]);
			
			pstmt.executeUpdate();
			
			dbDriver.closeAll(pstmt, conn);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
