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

public class PROFESSORDBBEAN {
	
	private static PROFESSORDBBEAN dao = new PROFESSORDBBEAN();
	private DataSource ds;
	
	private PROFESSORDBBEAN() {
		try {
			Context ct = new InitialContext();
			ds = (DataSource) ct.lookup("java:comp/env/jdbc/mysql");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static PROFESSORDBBEAN getInstance() {
		if (dao == null) {
			dao = new PROFESSORDBBEAN();
		}
		return dao;
	}
	
	//교직원 정보를 DB에 저장하는 메서드.
			public void write(int p_no, String p_pwd, String p_name, String p_birth, String p_tel, String p_email, String p_room, int MAJOR_no) {
				
				String sql = "insert into PROFESSOR values (?,?,?,?,?,?,?,?)";
				Connection conn = null;
				PreparedStatement pstmt = null;
				
				try {
					conn = ds.getConnection();
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, p_no);
					pstmt.setString(2, p_pwd);
					pstmt.setString(3, p_name);
					pstmt.setString(4, p_birth);
					pstmt.setString(5, p_tel);
					pstmt.setString(6, p_email);
					pstmt.setString(7, p_room);
					pstmt.setInt(8, MAJOR_no);
					

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
	
	//한명의 교직원정보를 가져오는 메서드 선언
	public PROFESSORBEAN getPro(int p_no) {
		PROFESSORBEAN vo = null;
		String sql = "select * from PROFESSOR where p_no=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, p_no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo = new PROFESSORBEAN();
				vo.setP_no(rs.getInt("p_no"));
				vo.setP_pwd(rs.getString("p_pwd"));
				vo.setP_name(rs.getString("p_name"));
				vo.setP_birth(rs.getString("p_birth"));
				vo.setP_tel(rs.getString("p_tel"));
				vo.setP_email(rs.getString("p_email"));
				vo.setP_room(rs.getString("p_room"));
				vo.setMAJOR_no(rs.getInt("MAJOR_no"));
			}
			
						
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		
		
		
		
		return vo;
	}
			
	//교직원정보 목록을 DB로부터 받아올 메서드 선언.
	public List<PROFESSORBEAN> getProInfo(){
		List<PROFESSORBEAN> infoList = new ArrayList<>();
		String sql = "select * from PROFESSOR order by p_no DESC";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				PROFESSORBEAN info = new PROFESSORBEAN(
						rs.getInt("p_no"),
						rs.getString("p_pwd"),
						rs.getString("p_name"),
						rs.getString("p_birth"),
						rs.getString("p_tel"),
						rs.getString("p_email"),
						rs.getString("p_room"),
						rs.getInt("MAJOR_no")
						);
				infoList.add(info);
			}
			System.out.println("교직원 정보 조회 완료!");
			
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		
		return infoList;
	}
	
	//교직원 정보 수정 메서드 선언
	public void updatePro(int p_no, String p_pwd, String p_name, String p_birth, String p_tel, String p_email, String p_room, int MAJOR_no) {
		String sql = "update PROFESSOR set p_pwd=?, p_name=?, p_birth=?, p_tel=?, p_email=?, p_room=?, MAJOR_no=? where p_no=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p_pwd);
			pstmt.setString(2, p_name);
			pstmt.setString(3, p_birth);
			pstmt.setString(4, p_tel);
			pstmt.setString(5, p_email);
			pstmt.setString(6, p_room);
			pstmt.setInt(7, MAJOR_no);
			pstmt.setInt(8, p_no);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
		
	}
	
	
	// 교직원 정보 삭제 메서드 선언.
	public void deletePro(int p_no) {
		String sql = "delete from PROFESSOR where p_no=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, p_no);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
}
