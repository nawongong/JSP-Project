package shopmgr;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import java.sql.ResultSet;
import java.sql.DriverManager;

public class MemberDAO {
	Connection conn = null;
	PreparedStatement pstmt;
	
	final String JDBC_DRIVER = "org.h2.Driver";
	final String JDBC_URL = "jdbc:h2:tcp://localhost/~/jwbookdb";
	
	public void open(){
		try {
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(JDBC_URL,"jwbook","1234");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void close() {
		try {
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	// 회원가입
	public void insert(String id, String pw, String name, String email, String tel) {
		open();	
		String sql = "insert into member(id,pw,name,email,tel) values (?,?,?,?,?)";
		 
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, name);
			pstmt.setString(4, email);
			pstmt.setString(5, tel);
				
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}
	// 로그인 체크
	public String loginCheck(String id, String pwd) {
		open();	
	    String loginOK = null;
	    
		try {
			pstmt = conn.prepareStatement("select * from member where id=? and pw=?");
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) { //회원 맞음
				loginOK = "OK";
			}
			else { //회원 아님
				loginOK = "NO";
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return loginOK;
	}
	
	// 아이디 중복체크
	
	public int checkId(String id) {
		open();
		String sql = "select * from member where id = ?";
		int idCheck = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,  id);
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next() || id.equals("")) {
				idCheck = 0; // 존재하는 경우
			}else {
				idCheck = 1; // 존재하지 않는 경우
			}
		}catch(SQLException e) {
			
		}finally {
			close();
		}
		
		return idCheck;
	}
}
