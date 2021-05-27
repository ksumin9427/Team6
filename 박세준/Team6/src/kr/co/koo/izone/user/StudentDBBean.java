package kr.co.koo.izone.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import kr.co.koo.izone.util.JdbcUtil;


public class StudentDBBean {
	public static final int LOGIN_SUCCESS = 1;      //로그인 성공
	public static final int LOGIN_FAIL_ID = -1;     //로그인 실패 - 학번 오류
	public static final int LOGIN_FAIL_PW = 0;      //로그인 실패 - 비밀번호 오류

	private static StudentDBBean dao = new StudentDBBean();
	private DataSource ds;
	
	private StudentDBBean() {
		try {
			Context ct = new InitialContext();
			ds = (DataSource) ct.lookup("java:comp/env/jdbc/oracle");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static StudentDBBean getInstance() {
		if (dao == null) {
			dao = new StudentDBBean();
		}
		return dao;
	}
	
	// 학생 정보 가져오는 메서드
	public StudentBean getMemberInfo(int s_no) {      

		StudentBean user = null;

		String sql = "select * from student where s_no=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, s_no);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				user = new StudentBean();
				user.setS_no(rs.getInt("s_no"));
				user.setS_level(rs.getInt("s_level"));
				user.setS_status(rs.getInt("s_status"));
				user.setMAJOR_no(rs.getInt("MAJOR_no"));
				user.setS_pwd(rs.getString("s_pwd"));
				user.setS_name(rs.getString("s_name"));
				user.setS_jumin(rs.getString("s_jumin"));
				user.setS_email(rs.getString("s_email"));
				user.setS_tel(rs.getString("s_tel"));
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
	
		
		// 로그인의 유효성을 검증하는 메서드 선언.
		public int userCheck(int s_no, String s_pwd) {
			// 전달된 정보를 바탕으로 로그인이 유효한지를 판정할 수 있는 JDBC로직 작성

			String sql = "select s_pwd from student where s_no=?";

			int result = 0;

			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, s_no);
				rs = pstmt.executeQuery();

				if (rs.next()) {
					String dbpw = rs.getString("s_pwd");
					if (dbpw.equals(s_pwd)) { // 로그인에 성공했을때!
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
		
		
	
		// 비밀번호 수정을 위한 메서드 선언.
		public boolean changePassword(String s_no, String newPwd){
			
			boolean flag = false;
			
			String sql = "update student set s_pwd = ? where s_no = ?";
			Connection conn=null;
			PreparedStatement pstmt =null;
			
			try {
				conn=ds.getConnection();
				pstmt=conn.prepareStatement(sql);
				
				pstmt.setString(1, newPwd);
				pstmt.setString(2, s_no);
				
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
	
		
	
		
		
		//학생정보를 DB에 저장하는 메서드.
		public void write(int s_no, String s_pwd, String s_name, int s_level, String s_jumin, String s_email,
				String s_tel, int s_status, int MAJOR_no) {
			
			String sql = "insert into student values (?,?,?,?,?,?,?,?,?)";
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, s_no);
				pstmt.setString(2, s_pwd);
				pstmt.setString(3, s_name);
				pstmt.setInt(4, s_level);
				pstmt.setString(5, s_jumin);
				pstmt.setString(6, s_tel);
				pstmt.setString(7, s_email);
				pstmt.setInt(8, s_status);
				pstmt.setInt(9, MAJOR_no);

				int i = pstmt.executeUpdate();
				if(i == 1) {
					System.out.println("정보 등록 성공!");
				} else {
					System.out.println("정보 등록 실패!");
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				JdbcUtil.close(conn);
				JdbcUtil.close(pstmt);
			}
			
		}
		
		
		
		//학생정보 목록을 DB로부터 받아올 메서드 선언.
		public List<StudentBean> getStuInfo(){
			
			List<StudentBean> infoList = new ArrayList<>();
			
			String sql = "select * from student order by s_no DESC";
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					StudentBean info = new StudentBean(
							rs.getInt("s_no"), 
							rs.getString("s_pwd"),
							rs.getString("s_name"), 
							rs.getInt("s_level"),
							rs.getString("s_jumin"), 	 
							rs.getString("s_email"), 	 
							rs.getString("s_tel"), 	 
							rs.getInt("s_status"),
							rs.getInt("MAJOR_no")
							);
					infoList.add(info);
				}
				
				System.out.println("학생 정보 조회 완료!");
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				JdbcUtil.close(conn);
				JdbcUtil.close(pstmt);
				JdbcUtil.close(rs);
			}
			
			return infoList;
		}
		
		
		


		//회원정보 수정을 처리하는 메서드 - 학생용
				public boolean updateSTUDENT(StudentBean stu) {
					boolean flag = false;

					Connection conn = null;
					PreparedStatement pstmt = null;

					String sql = "UPDATE student SET s_pwd=?,s_tel=?, s_email=? WHERE s_no=?";

					try {
						conn = ds.getConnection();
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, stu.getS_pwd());
						pstmt.setString(2, stu.getS_tel());
						pstmt.setString(3, stu.getS_email());
						pstmt.setInt(4, stu.getS_no());

						int i = pstmt.executeUpdate();

						if(i == 1) {
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
		
				//회원정보 수정을 처리하는 메서드 - 관리자용
				public void updateSTU(int s_no, String s_pwd, String s_name, int s_level, String s_jumin, String s_tel, String s_email,
						 int s_status, int MAJOR_no) {
					

					Connection conn = null;
					PreparedStatement pstmt = null;

					String sql = "UPDATE student SET s_pwd=?, s_name=?, s_level=?, s_jumin=?, s_tel=?, s_email=?, s_status=?, MAJOR_no=? WHERE s_no=?";

					try {
						conn = ds.getConnection();
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, s_pwd);
						pstmt.setString(2, s_name);
						pstmt.setInt(3, s_level);
						pstmt.setString(4, s_jumin);
						pstmt.setString(5, s_tel);
						pstmt.setString(6, s_email);
						pstmt.setInt(7, s_status);
						pstmt.setInt(8, MAJOR_no);
						pstmt.setInt(9, s_no);

						pstmt.executeUpdate();

						
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						JdbcUtil.close(conn);
						JdbcUtil.close(pstmt);
					}

				}
				
		// 학생의 정보를 삭제할 메서드 선언
				
		public void deleteSTU(int s_no) {
			String sql = "delete from student where s_no = ?";
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, s_no);
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				JdbcUtil.close(conn);
				JdbcUtil.close(pstmt);
			}
			
		}

				
		
		
		
}
