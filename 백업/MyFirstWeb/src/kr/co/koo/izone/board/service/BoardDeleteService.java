package kr.co.koo.izone.board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.koo.izone.board.model.BoardDAO;

public class BoardDeleteService implements IBoardService{
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		BoardDAO dao = BoardDAO.getInstance();
		String b_id = request.getParameter("bId");
		dao.deleteArticle(Integer.parseInt(b_id));	
	}
}
