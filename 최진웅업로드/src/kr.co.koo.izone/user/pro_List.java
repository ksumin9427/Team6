package kr.co.koo.izone.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class pro_List implements pro_Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		PROFESSORDBBEAN dao = PROFESSORDBBEAN.getInstance();
		List<PROFESSORBEAN> infos = dao.getProInfo();
		request.setAttribute("infos", infos);

	}

}
