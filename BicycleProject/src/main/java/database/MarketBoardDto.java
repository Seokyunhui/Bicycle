package database;

public class MarketBoardDto {
	int marketId;		//중고거래 테이블 PK
	int m_Board_Id;		//게시판 테이블 FK
	int marketPrice;	//중고거래 가격
	String marketAddr;	//중고거래 주소
	String marketName;	//중고거래 종류
	
	public int getMarketId() {
		return marketId;
	}
	public void setMarketId(int marketId) {
		this.marketId = marketId;
	}
	public int getM_Board_Id() {
		return m_Board_Id;
	}
	public void setM_Board_Id(int m_Board_Id) {
		this.m_Board_Id = m_Board_Id;
	}
	public int getMarketPrice() {
		return marketPrice;
	}
	public void setMarketPrice(int marketPrice) {
		this.marketPrice = marketPrice;
	}
	public String getMarketAddr() {
		return marketAddr;
	}
	public void setMarketAddr(String marketAddr) {
		this.marketAddr = marketAddr;
	}
	public String getMarketName() {
		return marketName;
	}
	public void setMarketName(String marketName) {
		this.marketName = marketName;
	}
	
	
}
