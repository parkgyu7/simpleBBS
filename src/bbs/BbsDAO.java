package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


//bbs1

public class BbsDAO {	
	private Connection conn;			// DB에 접근하는 객체 
	private ResultSet rs;				// DB data를 담을 수 있는 객체  (Ctrl + shift + 'o') -> auto import
	
	public BbsDAO(){
		try {
			String dbURL = "jdbc:mysql://localhost:3306/BBS";
			String dbID = "root";
			String dbPassword = "root";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 현 시간 입력해주는 함수
	public String getDate(){
		String SQL ="SELECT NOW()";	// 현 서버의 시간을 가져오는 MYSQL
		try{
			// 각 함수마다 접근DB가 다르므로 PSTMT를 각 함수 안쪽에다 배치.
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				return rs.getString(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return ""; // DB 오류. 왠만해선 오류가 안남.
	}
	
	// 이전 글 (최신 글)BBS ID+1을 해서 현 게시글 ID등록 
	public int getNext(){
		String SQL ="SELECT bbsID from BBS order by bbsID DESC";
		try{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()){
				return rs.getInt(1) + 1;		// 최신 글의 ID 값 +1
			}
			return 1; 						// 첫 번째 게시물인 경우
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // DB 오류
	}
	
	public int write(String bbsTitle, String userID, String bbsContent){
		String SQL ="INSERT INTO BBS VALUES (?,?,?,?,?,?)";
		try{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setInt(1, getNext());
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3,userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, bbsContent);
			pstmt.setInt(6, 1);		// Available - 삭제여부 
			
			return pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // DB 오류
	}
	
	
	// DB에서 글 목록을 배열로 만들어 주기.
	public ArrayList<Bbs> getList(int pageNumber){
		String SQL ="SELECT * from BBS where bbsID < ? and bbsAvailable=1 order by bbsID DESC limit 10";
		ArrayList<Bbs> list = new ArrayList<Bbs>();
		try{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setInt(1, getNext()-(pageNumber-1)*10);	// 위 ?에 들어가는 숫자. 10씩 끊어서 올림
			
			rs = pstmt.executeQuery();
			while(rs.next()){
				Bbs bbs = new Bbs();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				
				list.add(bbs);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	// 페이징 처리 
	public boolean nextPage(int pageNumber){
		String SQL ="SELECT * from BBS where bbsID < ? and bbsAvailable=1";
		try{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
	
			pstmt.setInt(1, getNext()-(pageNumber-1)*10);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				return true;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return false;	
	}
	
	public Bbs getBbs(int bbsID){
		String SQL ="SELECT * from BBS where bbsID = ?";
		try{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);
			rs = pstmt.executeQuery();
			if(rs.next()){
				Bbs bbs = new Bbs();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				
				return bbs;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;			
	}
	
	public int update(int bbsID, String bbsTitle, String bbsContent){
		String SQL ="UPDATE BBS SET bbsTitle =?, bbsContent=? where bbsID=?";
		try{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, bbsTitle); 
			pstmt.setString(2, bbsContent);
			pstmt.setInt(3, bbsID); 
			
			return pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // DB 오류
	}
	
	public int delete(int bbsID){
		String SQL ="UPDATE BBS SET bbsAvailable = 0 where bbsID=?";
		try{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID); 
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // DB 오류
	}
}