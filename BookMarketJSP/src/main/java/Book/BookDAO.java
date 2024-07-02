package Book;

import java.sql.SQLException;
import java.util.List;

public interface BookDAO {
	
	int insertBook(Book book) throws SQLException;
	
	Book selectBook(int no);
	
	List<Book> selectBookAll();
	
	int updateBook(Book book);
	
	int deleteBook(int no);
	
}
