package kr.co.koo.izone.member.model;

import java.sql.*;
import java.util.*;
import javax.sql.DataSource;

import com.mysql.jdbc.Util;

import kr.co.koo.izone.util.JdbcUtil;

import javax.naming.*;

public class MemberDAO {

	public static final int LOGIN_SUCCESS = 1;
	public static final int LOGIN_FAIL_ID = -1;
	public static final int LOGIN_FAIL_PW = 0;

	private static MemberDAO dao = new MemberDAO();
	private DataSource ds;

	private MemberDAO() {
		try {
			Context ct = new InitialContext();
			ds = (DataSource) ct.lookup("java:comp/env/jdbc/mysql");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static MemberDAO getInstance() {
		if (dao == null) {
			dao = new MemberDAO();
		}
		return dao;
	}

	// 아이디 중복 확인을 하는 메서드 선언.
	public boolean confirmId(String id) {
		String sql = "select user_id from izone_member where user_id = ?";

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		boolean flag = false;

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				flag = true;
			} else {
				flag = false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return flag;
	}

	// 회원가입 수행 메서드 선언
	public boolean insertMember(MemberVO member) {
		String sql = "insert into izone_member(user_id,user_pw,user_name,user_email)values(?,?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rs = 0;
		boolean flag = false;
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getUserId());
			pstmt.setString(2, member.getUserPw());
			pstmt.setString(3, member.getUserName());
			pstmt.setString(4, member.getUserEmail());
			rs = pstmt.executeUpdate();
			if (rs == 1) {
				flag = true;
			} else {
				flag = false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}

		return flag;

	}

	// 로그인의 유효성을 검증하는 메서드 선언.
	public int userCheck(String id, String pw) {
		// 전달된 정보를 바탕으로 로그인이 유효한지를 판정할 수 있는 JDBC로직 작성

		String sql = "select user_pw from izone_member where user_id=?";

		int result = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				String dbpw = rs.getString("user_pw");
				if (dbpw.equals(pw)) { // 로그인에 성공했을때!
					result = LOGIN_SUCCESS;
				} else { // 비번이 틀렸을때!
					result = LOGIN_FAIL_PW;
				}
			} else { // 아이디가 존재하지 않는경우
				result = LOGIN_FAIL_ID;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return result;
	}

	// 로그인한 회원의 회원정보를 모두 가져오는 메서드 선언
	public MemberVO getMemberInfo(String id) {

		MemberVO user = null;

		String sql = "select * from izone_member where user_id=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				user = new MemberVO();
				user.setUserId(rs.getString("user_id"));
				user.setUserPw(rs.getString("user_pw"));
				user.setUserName(rs.getString("user_name"));
				user.setUserEmail(rs.getString("user_email"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return user;
	}

	// 비밀번호 수정을 위한 메서드 선언.
	public boolean changePassword(String id, String newPw){
		
		boolean flag = false;
		
		String sql = "update izone_member set user_pw = ? where user_id = ?";
		Connection conn=null;
		PreparedStatement pstmt =null;
		
		try {
			conn=ds.getConnection();
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, newPw);
			pstmt.setString(2, id);
			
			int i = pstmt.executeUpdate();
			
			if(i==1) {
				flag=true;
			}else {
				flag=false;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
		return flag;
	}
	
	//회원정보 수정을 위한 메서드
	public boolean updateMember(MemberVO member){
		boolean flag = false;
		
		String sql = "UPDATE izone_member SET user_name=?, user_email=? WHERE user_id=?";
		
		Connection conn = null;
		PreparedStatement pstmt =null;
		
		try {
			
			conn=ds.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,member.getUserName());
			pstmt.setString(2,member.getUserEmail());
			pstmt.setString(3,member.getUserId());
			
			int i = pstmt.executeUpdate();
			
			if(i==1) {
				flag=true;
			}else {
				flag=false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
		
		return flag;
	}
	
	public boolean deleteMember(String id) {
		
		boolean flag = false;
		
		String sql = "DELETE FROM izone_member WHERE user_id=?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			int i = pstmt.executeUpdate();
			
			if(i==1) {
				flag = true;
			}else {
				flag = false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
		return flag;
	}

}
