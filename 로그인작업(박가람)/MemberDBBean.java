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
		STUDENT_VO student = null;
		
		try {
			con = getConnection();
			sql = "select * from student where s_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				student = new STUDENT_VO();
				student.setS_no(rs.getInt(1));
				student.setS_pwd(rs.getString(2));
				student.setS_name(rs.getString(3));
				student.setS_level(rs.getInt(4));
				student.setS_jumin(rs.getString(5));
				student.setS_tel(rs.getString(6));
				student.setS_email(rs.getString(7));
				student.setS_status(rs.getInt(8));
				student.setMAJOR_no(rs.getInt(9));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return student;
	}
	public PROF_VO getProf(String id) {
		Connection con = null;	
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		PROF_VO prof = null;
		
		try {
			con = getConnection();
			sql = "select * from professor where p_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				prof = new PROF_VO();
				prof.setP_no(rs.getInt(1));
				prof.setP_pwd(rs.getString(2));
				prof.setP_name(rs.getString(3));
				prof.setP_jumin(rs.getString(4));
				prof.setP_tel(rs.getString(5));
				prof.setP_email(rs.getString(6));
				prof.setP_room(rs.getString(7));
				prof.setMajor_no(rs.getInt(8));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return prof;
	}
	
	public int findID(int code, String name, String email) {
		Connection con = null;	
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int re = -1;
		try {
			con = getConnection();
			
			if (code == 1) {  //학생
				sql = "select s_no from student where s_name = ? and s_email = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, name);
				pstmt.setString(2, email);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					re = rs.getInt(1);
				}
			}else if(code == 2) { //교수 
				sql = "select p_no from professor where p_name = ? and p_email = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, name);
				pstmt.setString(2, email);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					re = rs.getInt(1);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return re;
	}
	
	public int findPW(int code, int id, String jumin) {
		Connection con = null;	
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int re = -1;
		
		try {
			con = getConnection();
			if (code == 1) { //학생 
				sql = "select s_pwd from student where s_no = ? and s_jumin = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, id);
				pstmt.setString(2, jumin);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					sql ="update student set s_pwd = substr(s_jumin,7) where s_no = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, id);
					pstmt.executeUpdate();
					re = 1;
				}
			}
			if(code == 2) {
				sql = "select p_pwd from professor where p_no = ? and p_jumin = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, id);
				pstmt.setString(2, jumin);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					sql ="update professor set p_pwd = substr(p_jumin,7) where p_no = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, id);
					pstmt.executeUpdate();
					re = 2;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return re;
	}
}
