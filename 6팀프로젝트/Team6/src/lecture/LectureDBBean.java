package lecture;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp.PStmtKey;

public class LectureDBBean {
	// ���� �ð��� ��� �� ���� �����߽��ϴ�.
	private static LectureDBBean instance = new LectureDBBean();

	public static LectureDBBean getinstance() {
		return instance;
	}

	public Connection getConnection() throws Exception {
		Context context = new InitialContext();
		DataSource ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	// ��������� ������ ���̽� �����ϴ� �ڵ��Դϴ�.

	// ��� ����Ʈ�� Ȱ���ؼ� ������ ���̽��� ���� �Ǿ� �ִ� �������̺��� �ҷ����� �ڵ��Դϴ�.
	public ArrayList<LectureBean> listlecture(int majorno) throws Exception {
		// ������ȣ�� �޾Ƽ� �� ������ �´� ���� ���
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		LectureBean llb = null;
		ArrayList<LectureBean> list = new ArrayList<LectureBean>();
		String sql = "select l_no,l_name,l_level,l_sem,l_unit,l_max,l_day,l_start,l_time,l_com,major_no,professor_p_no from lecture where major_no=?";
		// lecture�� �ִ� major_no�� ���� ���� �ҷ�����
		try {
			con = getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, majorno);
			rs = ps.executeQuery();

			while (rs.next()) {
				llb = new LectureBean();
				llb.setL_no(rs.getInt(1));
				llb.setL_name(rs.getString(2));
				llb.setL_level(rs.getInt(3));
				llb.setL_sem(rs.getInt(4));
				llb.setL_unit(rs.getInt(5));
				llb.setL_max(rs.getInt(6));
				llb.setL_day(rs.getString(7));
				llb.setL_start(rs.getInt(8));
				llb.setL_time(rs.getInt(9));
				llb.setL_com(rs.getString(10));
				llb.setMajor_no(rs.getInt(11));
				llb.setProfessor_p_no(rs.getInt(12));
				list.add(llb); // ��̸���Ʈ�� ��� �ڵ��Դϴ�.
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return list;
	}

	// ��û��ư�� Ŭ���� �����ͺ��̽��� �ִ��ڵ�
	public int insertlecture(int s_no, int l_no) {
		Connection con = null;
		PreparedStatement ps = null;
		String sql = "";
		int re = -1;
		try {
			con = getConnection();
			sql = "insert into lecture_a(s_no,l_no) values(?,?)";
			ps = con.prepareStatement(sql);
			ps.setInt(1, s_no);
			ps.setInt(2, l_no);
			ps.executeUpdate();
			re = 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return re;
	}

	// �л� ��ȣ�� �޾� �� �л��� �����ϰ� �ִ� �� �ҷ����� �ڵ�
	public ArrayList<LectureBean> viewlecture(int s_no) throws Exception {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		LectureBean llb = null;
		ArrayList<LectureBean> list = new ArrayList<LectureBean>();
		String sql = "select l.l_no,l_name,l_level,l_sem,l_unit,l_max,l_day,l_start,l_time,l_com,major_no,professor_p_no from lecture l,lecture_a a where l.l_no = a.l_no and a.s_no=? order by l.l_no";
		try {
			con = getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, s_no);
			rs = ps.executeQuery();

			while (rs.next()) {
				llb = new LectureBean();
				llb.setL_no(rs.getInt(1));
				llb.setL_name(rs.getString(2));
				llb.setL_level(rs.getInt(3));
				llb.setL_sem(rs.getInt(4));
				llb.setL_unit(rs.getInt(5));
				llb.setL_max(rs.getInt(6));
				llb.setL_day(rs.getString(7));
				llb.setL_start(rs.getInt(8));
				llb.setL_time(rs.getInt(9));
				llb.setL_com(rs.getString(10));
				llb.setMajor_no(rs.getInt(11));
				llb.setProfessor_p_no(rs.getInt(12));
				list.add(llb); // ��̸���Ʈ�� ��� �ڵ��Դϴ�.
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return list;
	}

	// �ߺ� ���ǰ� �ִ��� Ȯ���ϴ� �ڵ�
	public int confirmlecture(int l_no) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "";
		int re = -1;
		try {
			con = getConnection();
			sql = "select l_no from lecture_a where l_no=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, l_no);
			rs = ps.executeQuery();
			if (rs.next()) {
				re = 1;
			} else {
				re = -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
			re = -1;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			return re;
		}
	}

	// �����ϴ� �ڵ�
	public int deletelecture(int s_no, int l_no) {
		Connection con = null;
		PreparedStatement ps = null;
		String sql = "";
		int re = -1;
		try {
			con = getConnection();
			sql = "delete lecture_a where s_no=? and l_no=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, s_no);
			ps.setInt(2, l_no);
			ps.executeUpdate();
			re = 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return re;
	}

	// ��������ϴ� �ڵ�
	public LectureBean semlecture(int s_no) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "";
		LectureBean llb = null;
		try {
			con = getConnection();
			sql = "select sum(l_unit) from lecture where l_no in (select l_no from lecture_a where s_no=?)";
			ps = con.prepareStatement(sql);
			ps.setInt(1, s_no);
			rs = ps.executeQuery();
			if (rs.next()) {
				llb = new LectureBean();
				llb.setL_sem(rs.getInt(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return llb;
	}

	// �����ο��� �߰��Ǹ� �����ο� ���̳ʽ��ϱ�
	public int maxlecture(int l_no) {
		Connection con = null;
		PreparedStatement ps = null;
		String sql = "";
		int re = -1;
		try {
			con = getConnection();
			sql = "UPDATE lecture SET l_max = l_max-1 where l_no=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, l_no);
			ps.executeUpdate();
			re = 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return re;
	}

	// �������������� �ٽ� �ο����� ���������� �ڵ�
	public int maxlecture2(int l_no) {
		Connection con = null;
		PreparedStatement ps = null;
		String sql = "";
		int re = -1;
		try {
			con = getConnection();
			sql = "UPDATE lecture SET l_max = l_max+1 where l_no=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, l_no);
			ps.executeUpdate();
			re = 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return re;
	}
	//�����ð�ǥ Ȯ���ϴ¹�
	public ArrayList<LectureBean> listSce(int s_no) throws Exception {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		LectureBean llb = null;
		ArrayList<LectureBean> list = new ArrayList<LectureBean>();
		String sql = "select l_day,l.l_start,l_name from lecture l,lecture_a a where l.l_no = a.l_no and s_no=? order by l_start";
		try {
			con = getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, s_no);
			rs = ps.executeQuery();

			while (rs.next()) {
				llb = new LectureBean();
				llb.setL_day(rs.getString(1));
				llb.setL_start(rs.getInt(2));
				llb.setL_name(rs.getString(3));
				list.add(llb); // ��̸���Ʈ�� ��� �ڵ��Դϴ�.
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return list;
	}
	//Ű����� �˻�
	public ArrayList<LectureBean> listKeywords(String selectke,String lecturename) throws Exception {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		LectureBean llb = null;
		ArrayList<LectureBean> list = new ArrayList<LectureBean>();
		String sql="";
		try {
			con = getConnection();
			switch (selectke) {
			case "01":
				sql="select l_no,l_name,l_level,l_sem,l_unit,l_max,l_day,l_start,l_time,l_com,major_no,professor_p_no from lecture where l_name like ?";
				break;
			case "02":
				sql="select l_no,l_name,l_level,l_sem,l_unit,l_max,l_day,l_start,l_time,l_com,major_no,professor_p_no from lecture where l_name like ?";
				break;
			case "03":
				sql="select l_no,l_name,l_level,l_sem,l_unit,l_max,l_day,l_start,l_time,l_com,major_no,professor_p_no from lecture where l_no like ?";
				break;
			case "04":
				sql="select l_no,l_name,l_level,l_sem,l_unit,l_max,l_day,l_start,l_time,l_com,major_no,professor_p_no from lecture where l_day like ?";
				break;
			default:
				break;
			}
			ps = con.prepareStatement(sql);
			ps.setString(1, "%"+lecturename+"%");
			rs = ps.executeQuery();

			while (rs.next()) {
				llb = new LectureBean();
				llb.setL_no(rs.getInt(1));
				llb.setL_name(rs.getString(2));
				llb.setL_level(rs.getInt(3));
				llb.setL_sem(rs.getInt(4));
				llb.setL_unit(rs.getInt(5));
				llb.setL_max(rs.getInt(6));
				llb.setL_day(rs.getString(7));
				llb.setL_start(rs.getInt(8));
				llb.setL_time(rs.getInt(9));
				llb.setL_com(rs.getString(10));
				llb.setMajor_no(rs.getInt(11));
				llb.setProfessor_p_no(rs.getInt(12));
				list.add(llb); // ��̸���Ʈ�� ��� �ڵ��Դϴ�.
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return list;
	}
	
}
