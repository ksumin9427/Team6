package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import member.MemberDBBean;

public class MemberDBBean {
	private static MemberDBBean instance = new MemberDBBean(); //객체생성 
	public static MemberDBBean getInstance() {
		return instance; 
	}
	
	public Connection getConnection() throws Exception{ //커넥션
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	public int userCheck(String id, String pwd) throws Exception {
		Connection con = null;	
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select s_pwd from student where s_no=?";
		String db_pwd;
		int re = -1;
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				db_pwd = rs.getString(1);
				if (db_pwd.equals(pwd)) {
					re = 1;
				}else {
					re = 0;
				}
			}else {
				sql = "select p_pwd from professor where p_no=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					db_pwd = rs.getString(1);
					if (db_pwd.equals(pwd)) {
						re = 2;
					}else {
						re = 0;
					}
				}else {
					sql = "select m_pwd from manager where m_no=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, id);
					rs = pstmt.executeQuery();
					if (rs.next()) {
						db_pwd = rs.getString(1);
						if (db_pwd.equals(pwd)) {
							re = 3;
						}else {
							re = 0;
						}
					}else {
						re = -1;
					}
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (con != null) con.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		return re;
	}
	public STUDENT_VO getStudent(String id) {
		Connection con = null;	
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		STUDENT_VO student = new STUDENT_VO();
		return student;
	}

}
