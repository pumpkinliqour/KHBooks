package com.kh.absence.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.absence.model.service.AbsenceService;
import com.kh.absence.model.vo.Absence;

/**
 * Servlet implementation class AbsencePagingServlet
 */
@WebServlet("/absence/page")
public class AbsencePagingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AbsencePagingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cPage;
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
			
		}catch(NumberFormatException e) {
			cPage=1;
		}
		int numPerPage;
		try {
			numPerPage=Integer.parseInt(request.getParameter("numPerPage"));
		}catch(NumberFormatException e) {
			numPerPage=8;
		}
		
		int totalBoard=new AbsenceService().selectCount(); // 디비 속성갯수
		System.out.println("저장할 총 디비 속성 갯수"+totalBoard);
		int totalPage=(int)Math.ceil((double)totalBoard/numPerPage);// 필요한 총 페이지수
		System.out.println("총 페이지 수"+totalPage);
		
		List<Absence> list=new AbsenceService().selectList(cPage,numPerPage);
		
		String pageBar="";
		int pageSize=5; //페이지 최대 수 5이면 12345<다음>
		int pageNo=((cPage-1)/pageSize)*pageSize+1;  //시작페이지
		int pageEnd=pageNo+pageSize-1; //끝페이지
		
		//보고있는페이지가 1이면 이전  
		if(pageNo ==1) {			
			pageBar+="<span>[이전]<span>";
		}else {
			 
			//2이상이면 이전 클릭시 현재 페이지 -1페이지로 이동
			pageBar+="<a href='"+request.getContextPath()
			+"/absence/page?cPage="+(pageNo-1)
			+"&numPerPage="+numPerPage+"'>[이전]</a>";
		}
		//선택페이지 만들기
				while(!(pageNo>pageEnd||pageNo>totalPage))
				{
					if(cPage==pageNo)
					{
						pageBar+="<span class='cPage'>"+pageNo+"</span>";
					}
					else
					{
						pageBar+="<a href='"+request.getContextPath()
						+"/absence/page?cPage="+(pageNo)
						+"&numPerPage="+numPerPage+"'>"+pageNo+"</a>";
					}
					pageNo++;
				}
		//[다음]
		if(pageNo>totalPage) {
			pageBar+="<span><다음></span>";
			
		}else {
			pageBar+="<a href='"+request.getContextPath()+"/absence/page?cPage="+pageNo+"&numPerPage="+numPerPage+"'>[다음]</a>";
		}
		System.out.println("페이지바:"+pageBar);
		
		request.setAttribute("cPage", cPage);
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/views/notice/absenceboardtable.jsp").forward(request, response);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}