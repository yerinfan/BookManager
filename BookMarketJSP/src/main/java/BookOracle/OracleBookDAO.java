package BookOracle;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Book.Book;
import Book.BookDAO;
import Book.JDBConnection;

public class OracleBookDAO implements BookDAO {

	public int deleteBook (int no) {
		int result = 0;
		
		// DB 연결 
		JDBConnection jdbc = new OracleJDBConnection();	
		
		// SQL문 만들기
		String sql = "delete book where no = ?";
	
		try {
			// preparedStatment 객체 생성 <- sql문
			jdbc.pstmt = jdbc.conn.prepareStatement(sql);
			// 파라미터 set
			jdbc.pstmt.setInt(1, no);
			// 실행 
			result = jdbc.pstmt.executeUpdate();
			System.out.println(result + "행이 삭제되었습니다.");

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 자원 객체 닫기
			jdbc.close();
		}
		
		return result;
	}
	
	public int updateBook (Book book) {
	      JDBConnection jdbc = new OracleJDBConnection();
	      
	      String sql = new StringBuilder()
	            .append("update book ")
	            .append("set price = ? ")
	            .append("where no = ? ")
	            .toString();
	      
	      int result = 0;
	      
	      try {
	         jdbc.pstmt = jdbc.conn.prepareStatement(sql);

	         jdbc.pstmt.setInt(1, book.getPrice());
	         jdbc.pstmt.setInt(2, book.getNo());

	         result = jdbc.pstmt.executeUpdate();

	         System.out.println(result + "행이 수정되었습니다.");
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         jdbc.close();
	      }
	      return result;
	   }

	public List<Book> selectBookAll() {
		// DB 연결
		JDBConnection jdbc = new OracleJDBConnection();
		
		// sql문 만들기
		String sql = new StringBuilder()
				.append("select * from book")
				.toString();
		
		List<Book> bookList = new ArrayList<>();
		try {
			// PreparedStatement 객체 생성
			jdbc.pstmt = jdbc.conn.prepareStatement(sql);

			// SQL문 실행
			jdbc.rs = jdbc.pstmt.executeQuery();

			// ResultSet 객체에서 결과값 가져와서 출력하기

			// 모든 데이터 행 가져오기
			while (jdbc.rs.next()) {
				bookList.add(new Book(jdbc.rs.getInt("no"),
						jdbc.rs.getString("bookname"),
						jdbc.rs.getString("author"),
						jdbc.rs.getString("publisher"),
						jdbc.rs.getInt("price")));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 자원 객체 닫기
			jdbc.close();
		}
		return bookList;
	}
	
	public Book selectBook(int no) {
		// DB 연결
		JDBConnection jdbc = new OracleJDBConnection();
		
		// sql문 만들기
		String sql = new StringBuilder()
				.append("select * from book where no= ? ")
				.toString();
		Book book = null;
		
		try {
			// PreparedStatement 객체 생성
			jdbc.pstmt = jdbc.conn.prepareStatement(sql);

			// SQL문 매개변수에 값 추가
			jdbc.pstmt.setInt(1, no);

			// SQL문 실행
			jdbc.rs = jdbc.pstmt.executeQuery();

			// ResultSet 객체에서 결과값 가져와서 출력하기

			if (jdbc.rs.next()) { //no, bookname, author, publisher, price
			book = new Book(jdbc.rs.getInt("no"), 
							jdbc.rs.getString("bookname"), 
						    jdbc.rs.getString("author"),
						    jdbc.rs.getString("publisher"), 
						    jdbc.rs.getInt("price"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 자원 객체 닫기
			jdbc.close();
		}
		return book;
	}

	public int insertBook(Book book) {
		// DB 연결
		JDBConnection jdbc = new OracleJDBConnection();

		// sql문 만들기
		String sql = new StringBuilder()
				.append("insert into book (no, bookname, author, publisher, price)")
				.append("values (book_seq.nextval, ? , ? , ? , ? )")
				.toString();
		int result = 0;
		try {
			// PreparedStatement 객체 생성
			jdbc.pstmt = jdbc.conn.prepareStatement(sql);

			// SQL문 매개변수에 값 추가
			jdbc.pstmt.setString(1, book.getBookname());
			jdbc.pstmt.setString(2, book.getAuthor());
			jdbc.pstmt.setString(3, book.getPublisher());
			jdbc.pstmt.setInt(4, book.getPrice());
			// SQL문 실행
			result = jdbc.pstmt.executeUpdate();
			if (result > 0) {
				System.out.println(result + "행이 추가되었습니다.");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 자원 객체 닫기
			jdbc.close();
		}

		return result;
	}
}
