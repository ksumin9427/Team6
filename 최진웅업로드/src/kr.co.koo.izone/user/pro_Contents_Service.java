package kr.co.koo.izone.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class pro_Contents_Service implements pro_Service {

	
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		PROFESSORDBBEAN dao = PROFESSORDBBEAN.getInstance();
		String p_no = request.getParameter("p_no");
		PROFESSORBEAN pro = dao.getPro(Integer.parseInt(p_no));
		request.setAttribute("info", pro);

	}

}
