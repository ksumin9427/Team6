
package team6;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import myUtil.*;

public class BoardDBBean {
	private static BoardDBBean instance=new BoardDBBean();
	public static BoardDBBean getInstance() {
		return instance;
	}
	
	public Connection getConnection() throws Exception{
		Context ctx=new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	public int insertBoard(BoardBean board) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		int number;
		
		int no = board.getBs_no();
		int ref = board.getBs_ref();
		int step = board.getBs_step();
		int level = board.getBs_level();
		
		try {
			con = getConnection();
			sql="SELECT MAX(Bs_no) FROM BOARD_S";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				number=rs.getInt(1)+1;
				System.out.println(" ===> "+number);
			}else {
				number=1;
			}
			
			
			if (no != 0) { //no가 0이 아니면 답글, 0이면 글쓰기
				sql="update board_s set bs_step = bs_step + 1 where bs_ref=? and bs_step > ?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, ref);
				pstmt.setInt(2, step);
				pstmt.executeUpdate();
				
				step=step+1;
				level=level+1;
			} else {//답글이 아닐 때, 글쓰기 일때 , 
				ref =number;
				step = 0;
				level = 0; 
			}
			
			sql="insert into board_s(bs_no, bs_name, bs_title, bs_content,bs_pwd, bs_date"
					+ ", bs_ref, bs_step, bs_level) "
					+ "values(?,?,?,?,?,?,?,?,?)";
			System.out.println("@@@###sql ===> "+sql);
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, number);
			pstmt.setString(2, HanConv.toKor(board.getBs_name()));
			
			pstmt.setString(3, HanConv.toKor(board.getBs_title()));
			pstmt.setString(4, HanConv.toKor(board.getBs_content()));
			pstmt.setString(5, HanConv.toKor(board.getBs_pwd()));
			pstmt.setTimestamp(6, board.getBs_date());
			
			pstmt.setInt(7, ref);
			pstmt.setInt(8, step);
			pstmt.setInt(9, level);
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return 1;
	}
	
	public ArrayList<BoardBean> listBoard(String pageNumber){
		Connection con=null;
		Statement stmt=null;
		ResultSet rs=null;
		ResultSet pageSet=null;
		int dbCount=0;
		int absoultePage=1;
		
		
		ArrayList<BoardBean> boardList = new ArrayList<BoardBean>();
		
		try {
			con = getConnection();
			
			//stmt=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE); //페이징 처리 할 떄는 2개 짜리 사용
			
			stmt = con.createStatement();
			pageSet=stmt.executeQuery("select count(bs_no) from board_s "); //글번호의 개수
		
			if (pageSet.next()) {
				dbCount=pageSet.getInt(1);
				pageSet.close();
				stmt.close();
			}
			if (dbCount % BoardBean.pageSize == 0) {// 나머지로 계산!
				 BoardBean.pageCount=(dbCount / BoardBean.pageSize) ; // 몫으로 계산! 80건 8페이지
			} else {
				BoardBean.pageCount=(dbCount / BoardBean.pageSize) +1; //81건 9페이지
				
			}
			
			
			if (pageNumber != null) { //해당페이지의 가장 위에 오는 글번호를 절대페이지, 앱솔루트페이지
				BoardBean.pageNum= Integer.parseInt(pageNumber);
				 absoultePage = ( (BoardBean.pageNum-1) * BoardBean.pageSize ) + 1;
			}
			
			
			//stmt = con.createStatement();
			stmt=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE); //페이징 처리 할 떄는 2개 짜리 사용
			//스크롤하면서 변한 정보를.. , 커서 위치에서 정보를 업데이트
			String sql="select * from board_s order by bs_ref desc, bs_step asc";
			rs = stmt.executeQuery(sql);
			
			if (rs.next()) {
				rs.absolute(absoultePage);
				int count=0;
				while (count < BoardBean.pageSize) {
					BoardBean board=new BoardBean();
					board.setBs_no(rs.getInt(1));
					board.setBs_name(rs.getString(2));
					
					board.setBs_title(rs.getString(3));
					board.setBs_content(rs.getString(4));
					board.setBs_pwd(rs.getString(5));
					board.setBs_date(rs.getTimestamp(6));
					board.setBs_hit(rs.getInt(7));
					
					board.setBs_ref(rs.getInt(8));
					board.setBs_step(rs.getInt(9));
					board.setBs_level(rs.getInt(10));
					
					boardList.add(board);
					
					if (rs.isLast()) {
						break;
					} else {
						rs.next();
					}
					count++;
					
				}
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (rs != null) rs.close();
				if (stmt != null) stmt.close();
				if (con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return boardList;
	}
	
	public BoardBean getBoard(int bsno, boolean hitadd) {
		Connection con=null;
		PreparedStatement pstmtUp=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		BoardBean board=null;
		
		try {
			con = getConnection();
			
			if (hitadd==true) {
				sql="update board_s set bs_hit=bs_hit+1 where bs_no=?";
				pstmtUp = con.prepareStatement(sql);
				pstmtUp.setInt(1, bsno);
				pstmtUp.executeUpdate();
				pstmtUp.close();
			}
			
			sql="select * from board_s where bs_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bsno);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				board=new BoardBean();
				board.setBs_no(rs.getInt(1));
				board.setBs_name(rs.getString(2));
				board.setBs_title(rs.getString(3));
				board.setBs_content(rs.getString(4));
				board.setBs_pwd(rs.getString(5));
				board.setBs_date(rs.getTimestamp(6));
				board.setBs_hit(rs.getInt(7));
				board.setBs_ref(rs.getInt(8));
				board.setBs_step(rs.getInt(9));
				board.setBs_level(rs.getInt(10));
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
		return board;
	}
	
	public int deleteBoard(int bs_no, String bs_pwd) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		int re=-1;
		String pwd="";
		
		try {
			con = getConnection();
			sql="select bs_pwd from board_s where bs_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bs_no);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				pwd = rs.getString(1);
				
				if (!pwd.equals(bs_pwd)) {
					re=0;
				}else {
					sql="delete board_s where bs_no=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, bs_no);
					pstmt.executeUpdate();
					
					re=1;
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
	
	public int editBoard(BoardBean board) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		int re=-1;
		String pwd="";
		
		try {
			con = getConnection();
			sql="select bs_pwd from board_s where bs_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board.getBs_no());
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				pwd = rs.getString(1);
				
				if (!pwd.equals(board.getBs_pwd())) {
					re=0;
				}else {
					sql="update board_s set bs_name=?, bs_title=?, bs_content=? where bs_no=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, HanConv.toKor(board.getBs_name()));
			
					pstmt.setString(2, HanConv.toKor(board.getBs_title()));
					pstmt.setString(3, HanConv.toKor(board.getBs_content()));
					pstmt.setInt(4, board.getBs_no());
					pstmt.executeUpdate();
					re=1;
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




















