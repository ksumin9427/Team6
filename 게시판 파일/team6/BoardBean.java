package team6;

import java.sql.Timestamp;

public class BoardBean {
	private int bs_no;
	private String bs_name;
	private String bs_title;
	private String bs_content;
	private String bs_pwd;
	private Timestamp bs_date;
	private int bs_hit;
	private int bs_ref;
	private int bs_step;
	private int bs_level;
	
	public static int pageSize = 15; //한 페이지에 몇 개의 게시글의 보여주기 위한 것
	public static int pageCount = 1; //[총번호개수] [9]까지
	public static int pageNum = 1;// 페이지번호 
	
	
	public static String pageNumber(int limit) {  
		String str="";
		int temp = (pageNum - 1) % limit; 
		int startPage= pageNum - temp; 
		
		if((startPage - limit > 0)) {
			str="<a href='hsbo0401R.jsp?pageNum="+(startPage-1)+"'>[이전]</a>&nbsp;&nbsp";
		}
		for(int i = startPage;i<(startPage+limit);i++) {
			if(i == pageNum) {
				str+="["+i+"]&nbsp;&nbsp;";
			} else {
				str+="<a href='hsbo0401R.jsp?pageNum="+i+"'>["+i+"]</a>&nbsp;&nbsp;";
			}
			
			if(i >= pageCount) {
				break;
			}
		}
		if((startPage + limit) <= pageCount) {
			str+="<a href='hsbo0401R.jsp?pageNum="+(startPage+limit)+"'>[다음]</a>";
		}
		
		return str;
		
	}
	
	public int getBs_hit() {
		return bs_hit;
	}

	public void setBs_hit(int bs_hit) {
		this.bs_hit = bs_hit;
	}

	public String getBs_pwd() {
		return bs_pwd;
	}


	public void setBs_pwd(String bs_pwd) {
		this.bs_pwd = bs_pwd;
	}


	public int getBs_no() {
		return bs_no;
	}


	public void setBs_no(int bs_no) {
		this.bs_no = bs_no;
	}


	public String getBs_name() {
		return bs_name;
	}


	public void setBs_name(String bs_name) {
		this.bs_name = bs_name;
	}


	public String getBs_title() {
		return bs_title;
	}


	public void setBs_title(String bs_title) {
		this.bs_title = bs_title;
	}


	public String getBs_content() {
		return bs_content;
	}


	public void setBs_content(String bs_content) {
		this.bs_content = bs_content;
	}


	public Timestamp getBs_date() {
		return bs_date;
	}


	public void setBs_date(Timestamp bs_date) {
		this.bs_date = bs_date;
	}





	public int getBs_ref() {
		return bs_ref;
	}


	public void setBs_ref(int bs_ref) {
		this.bs_ref = bs_ref;
	}


	public int getBs_step() {
		return bs_step;
	}


	public void setBs_step(int bs_step) {
		this.bs_step = bs_step;
	}


	public int getBs_level() {
		return bs_level;
	}


	public void setBs_level(int bs_level) {
		this.bs_level = bs_level;
	}
	
}