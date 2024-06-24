package BookTest;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class BookSelect {

	public static void main(String[] args) { // R
		BookSelect test = new BookSelect();
		test.selectAllBook();
		test.selectNoBook();
	}

	private void selectNoBook() {
		
		// DB 연결
		Connection conn = getDBConnection();
		if (conn != null) {
			System.out.println("오라클 연결 성공");
		} else
			return;

		// PreparedStatement 변수, ResultSet 변수 선언
		PreparedStatement pstmt = null;
		ResultSet rSet = null;

		// sql문 만들기
		String sql = new StringBuilder().append("select * from book where no= ? ").toString();

		try {
			// PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);

			// SQL문 매개변수에 값 추가
			Scanner sc = new Scanner(System.in);
			System.out.print("행 선택 : ");
			int no = sc.nextInt();
			pstmt.setInt(1, no);

			// SQL문 실행
			rSet = pstmt.executeQuery();

			// ResultSet 객체에서 결과값 가져와서 출력하기

			if (rSet.next()) { //no, bookname, author, publisher, price

				System.out.println(rSet.getInt("no") + " , " + rSet.getString("bookname") + " , " + rSet.getString("author")
						+ " , " + rSet.getString("publisher") + " , " + rSet.getInt("price"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 자원 객체 닫기
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

			if (rSet != null) {
				try {
					rSet.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

		}

	}

	public void selectAllBook() {
		// DB 연결
		Connection conn = getDBConnection();
		if (conn != null) {
			System.out.println("오라클 연결 성공");
		} else
			return;

		// PreparedStatement 변수, ResultSet 변수 선언
		PreparedStatement pstmt = null;
		ResultSet rSet = null;

		// sql문 만들기
		String sql = new StringBuilder().append("select * from book").toString();

		try {
			// PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);

			// SQL문 매개변수에 값 추가

			// SQL문 실행
			rSet = pstmt.executeQuery();

			// ResultSet 객체에서 결과값 가져와서 출력하기

			// 모든 데이터 행 가져오기
			while (rSet.next()) {
				System.out.println(rSet.getInt("no") + " , " + rSet.getString("bookname") + " , " + rSet.getString("author")
				+ " , " + rSet.getString("publisher") + " , " + rSet.getInt("price"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 자원 객체 닫기
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

			if (rSet != null) {
				try {
					rSet.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

		}

	}

	Connection getDBConnection() {
		// DB 연결을 위한 정보
		final String jdbcDriverClassName = "oracle.jdbc.OracleDriver";
		final String url = "jdbc:oracle:thin:@localhost:1521:xe"; // ip주소 : 포트번호 : 버전
		final String userid = "c##java";
		final String passwd = "1234";

		// DB 연결 객체 생성하여 반환
		Connection conn = null;

		// JDBC 드라이버 loading
		try {
			Class.forName(jdbcDriverClassName);

			// Connection 객체 생성
			conn = DriverManager.getConnection(url, userid, passwd);

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

		return conn;
	}
}
