package BookOracle;

import java.sql.SQLException;
import java.util.List;

import Book.Book;
import Book.BookDAO;
import Book.BookService;
import cart.CartItem;
import cart.CartService;
import cart.OracleCartDAO;
import cart.OracleCartService;

public class OracleBookService implements BookService {
	
	private BookDAO bookDao;
	
	public OracleBookService(BookDAO BookDao) {
		this.bookDao = BookDao;
	}
	
	public boolean add(Book book){
		int result = 0;
		try {
			result = bookDao.insertBook(book);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return (result == 1) ? true : false;
	}
	
	public Book detail(int no) {
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
		
		CartService cartService = new OracleCartService(new OracleCartDAO());
		List<CartItem> itemList = cartService.readByBookNo(no);
		
		
		int result = bookDao.deleteBook(no);
		
		return (result == 1) ? true : false;
	}

}
