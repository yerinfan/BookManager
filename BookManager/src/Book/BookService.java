package Book;

import java.lang.reflect.Member;
import java.sql.SQLException;
import java.util.List;


public class BookService {
	
	private BookDAO bookDao;
	
	public BookService(BookDAO BookDao) {
		this.bookDao = BookDao;
	}
	
	public boolean add(Book book) throws SQLException {
		int result = bookDao.insertBook(book);
		
		return (result == 1) ? true : false;
	}
	
	public Book read(int no) {
		Book book = bookDao.selectBook(no);
		return book;
	}
	
	public List<Book> listAll() {
		List<Book> bookList = bookDao.selectBookAll();
		return bookList;
	}
	
	public boolean edit(Book book, String price) {
		
		if (book == null) return false;
		if (price == null) return false;
		
		int result = bookDao.updateBook(book);		
		
		return (result == 1) ? true : false;
		
		
	}
	
	public boolean remove(int no) {
		if (bookDao.selectBook(no) == null) {
			return false;
		}
		
		int result = bookDao.deleteBook(no);
		
		return (result == 1) ? true : false;
	}
}
