package com.kh.member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class WishlistMultiDeleteServlet
 */
@WebServlet("/member/wishlistMultiDelete")
public class WishlistMultiDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WishlistMultiDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Integer> booksId = new ArrayList();
		String[] bookId = request.getParameterValues("BookId");
		Member m = (Member) request.getSession().getAttribute("logined");
		//로그인이 안되어 있으면 로그인페이지로 이동
		if(m==null) {
			response.sendRedirect(request.getContextPath()+"/views/login_myPage/login.jsp");
		}
		
		if(bookId==null) {
			request.setAttribute("msg", "삭제할 상품을 선택해주세요");
			request.setAttribute("loc", "/member/wishlist?memberNum="+m.getMemberNum());
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}
		
		for(String i:bookId) {
			booksId.add(Integer.parseInt(i));
		}
		int deleteCount = booksId.size();
		
		int rs = new MemberService().wishlistMutiDelete(booksId, m.getMemberNum(),deleteCount);
		if(rs==deleteCount && rs>0) {
			//모두 삭제
			request.setAttribute("msg", "장바구니 상품이 삭제되었습니다.");
			
		}else if(rs>0 && rs<deleteCount) {
			//일부만 삭제됨
			request.setAttribute("msg", "장바구니 상품이 일부만 삭제되는 오류가 발생 하였습니다. 관리자에게 문의하세요");
			
		}else {
			request.setAttribute("msg", "장바구니 상품이 삭제가 안되는 오류가 발생 하였습니다. 관리자에게 문의하세요");
			
		}
		request.setAttribute("loc", "/member/wishlist?memberNum="+m.getMemberNum());
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
