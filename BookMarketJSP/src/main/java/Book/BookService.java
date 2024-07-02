package Book;

import java.lang.reflect.Member;
import java.sql.SQLException;
import java.util.List;


public interface BookService {
	
	boolean add(Book book);
	Book detail(int id);
	List<Book> listAll();
	boolean edit(Book book, String price);
	boolean remove(int id);
}
