package com.kh.info.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.kh.author.model.vo.Author;
import com.kh.book.model.vo.Book;
import com.kh.info.model.dao.InfoDao;
import com.kh.review.model.vo.Review;

public class InfoService {
	
	public Book selectInfoBook(int bookId)
	{
		Connection conn=getConnection();
		Book b=new InfoDao().selectInfoBook(conn,bookId);
		close(conn);
		return b;
	}
	
	public List<Review> selectInfoReview(int bookId)
	{
		Connection conn=getConnection();
		List<Review> list=new InfoDao().selectInfoReview(conn, bookId);
		close(conn);
		return list;
	}
}
