package managerTest;

import java.util.List;

import Book.Book;
import Book.BookService;
import BookOracle.OracleBookDAO;

public class BookManagerTest {

	public static void main(String[] args) {
		BookService service = new BookService(new OracleBookDAO());
		List<Book> bookList = service.listAll();
		Book book = null;
		
		// 도서 등록 C
//		Book book = new Book("SQL 자격검정 실전문제", "한국데이터산업진흥원", "국가공인SQL", 18000);
//		if (service.add(book)) {
//			System.out.println("도서를 추가하였습니다.");
//		} else {
//			System.out.println("추가에 실패하였습니다.");
//		}
//		 됨
		
		// 도서 수정 U
		book = new Book(4, null, null, null, 22000);
		service.edit(book, "1234");
		
		// 도서 전체 목록 보기 R all
		for(Book b : bookList) {
			System.out.println(b.toString());	
		}
		
		// 해당 도서 보기 R
		book = service.read(4);
		if (book != null) {
			System.out.println(book.toString());
		}
		
		// 도서 삭제하기 D
		service.remove(1);
	}
}
