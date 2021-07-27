package database;

public class ChallegeDto {
	int Challenge_id;
	int Ch_Member_id;
	String Challenge_content;
	int Challenge_dist;
	String Challenge_regdate;
	int admin_approval;
	public String getChallenge_content() {
		return Challenge_content;
	}

	public void setChallenge_content(String challenge_content) {
		Challenge_content = challenge_content;
	}

	public int getChallenge_id() {
		return Challenge_id;
	}

	public void setChallenge_id(int challenge_id) {
		Challenge_id = challenge_id;
	}

	public int getCh_Member_id() {
		return Ch_Member_id;
	}

	public void setCh_Member_id(int ch_Member_id) {
		Ch_Member_id = ch_Member_id;
	}

	public int getChallenge_dist() {
		return Challenge_dist;
	}

	public void setChallenge_dist(int challenge_dist) {
		Challenge_dist = challenge_dist;
	}

	public String getChallenge_regdate() {
		return Challenge_regdate;
	}

	public void setChallenge_regdate(String challenge_regdate) {
		Challenge_regdate = challenge_regdate;
	}

	public int getAdmin_approval() {
		return admin_approval;
	}

	public void setAdmin_approval(int admin_approval) {
		this.admin_approval = admin_approval;
	}
}
