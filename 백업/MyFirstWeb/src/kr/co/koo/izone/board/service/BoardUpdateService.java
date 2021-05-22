package kr.co.koo.izone.board.service;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.koo.izone.board.model.BoardDAO;


public class BoardUpdateService implements IBoardService{
	
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		BoardDAO dao = BoardDAO.getInstance();
		String b_id = request.getParameter("bId");
		String b_title = request.getParameter("bTitle");
		String b_content = request.getParameter("bContent");
		dao.updateArticle(Integer.parseInt(b_id), b_title, b_content);
		
	}
}
