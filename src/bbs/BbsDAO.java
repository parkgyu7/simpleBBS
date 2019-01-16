package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


//bbs1

public class BbsDAO {	
	private Connection conn;			// DB�� �����ϴ� ��ü 
	private ResultSet rs;				// DB data�� ���� �� �ִ� ��ü  (Ctrl + shift + 'o') -> auto import
	
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
	
	// �� �ð� �Է����ִ� �Լ�
	public String getDate(){
		String SQL ="SELECT NOW()";	// �� ������ �ð��� �������� MYSQL
		try{
			// �� �Լ����� ����DB�� �ٸ��Ƿ� PSTMT�� �� �Լ� ���ʿ��� ��ġ.
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				return rs.getString(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return ""; // DB ����. �ظ��ؼ� ������ �ȳ�.
	}
	
	// ���� �� (�ֽ� ��)BBS ID+1�� �ؼ� �� �Խñ� ID��� 
	public int getNext(){
		String SQL ="SELECT bbsID from BBS order by bbsID DESC";
		try{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()){
				return rs.getInt(1) + 1;		// �ֽ� ���� ID �� +1
			}
			return 1; 						// ù ��° �Խù��� ���
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // DB ����
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
			pstmt.setInt(6, 1);		// Available - �������� 
			
			return pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // DB ����
	}
	
	
	// DB���� �� ����� �迭�� ����� �ֱ�.
	public ArrayList<Bbs> getList(int pageNumber){
		String SQL ="SELECT * from BBS where bbsID < ? and bbsAvailable=1 order by bbsID DESC limit 10";
		ArrayList<Bbs> list = new ArrayList<Bbs>();
		try{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setInt(1, getNext()-(pageNumber-1)*10);	// �� ?�� ���� ����. 10�� ��� �ø�
			
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
	
	// ����¡ ó�� 
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
		return -1; // DB ����
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
		return -1; // DB ����
	}
}