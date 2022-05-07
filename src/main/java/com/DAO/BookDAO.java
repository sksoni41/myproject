package com.DAO;

import java.util.List;

import com.entity.BookDtls;

public interface BookDAO {
	public boolean addBooks(BookDtls b);

	public List<BookDtls> getAllBooks();

	public BookDtls getBookById(int Id);

	public boolean updateEditBooks(BookDtls b);

	public boolean deleteBooks(int id);

	public List<BookDtls> getNewBook();

	public List<BookDtls> getRecentBook();

	public List<BookDtls> getOldBook();

	public List<BookDtls> getAllRecentBook();

	public List<BookDtls> getAllNewBook();

	public List<BookDtls> getAllOldBook();
	
	public List<BookDtls> getBookByOld(String email, String cat);
	
	public boolean oldBookDelete(String email, String cat, int id);
	
	public List<BookDtls> getBookBySearch(String ch);

}
