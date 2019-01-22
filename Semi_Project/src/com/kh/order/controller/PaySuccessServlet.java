package com.kh.order.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.book.model.vo.Book;
import com.kh.member.model.vo.Member;
import com.kh.order.model.service.OrderService;

/**
 * Servlet implementation class PaySuccessServlet
 */
@WebServlet("/order/paySuccess")
public class PaySuccessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaySuccessServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//결제 성공해서 장바구니에서 데이터 지우고, 오더리스트에 구매한 책들 넣어줌
		//세션에 넣어둔 정보를 꺼내온다.
		List<Book> payBookList = (List<Book>) request.getSession().getAttribute("payBookList");
		Member m = (Member)request.getSession().getAttribute("logined");
		
		//orderList에 추가하기
		int rs =  new OrderService().insertOrderlist(m.getMemberNum(),payBookList);
		if(rs>0) {
			System.out.println("구매목록에 추가 완료");
		}else {
			System.out.println("구매목록 추가 실패");
		}
		
		//장바구니에서 구매된 책들 제거
		int rs2 = new OrderService().deleteWishlist(m.getMemberNum(),payBookList);
		if(rs2>0) {
			System.out.println("구매된 책, 장바구니에서 삭제 성공");
		}else {
			System.out.println("구매된 책, 장바구니에서 삭제 실패");
		}
		
		request.getRequestDispatcher("/views/buy_won/paySuccess.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}