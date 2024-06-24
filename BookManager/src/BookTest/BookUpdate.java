package BookTest;

import java.lang.reflect.Member;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BookUpdate {

	public static void main(String[] args) {

	}

	public int updateBook(String password, String nickname, int no) {
		// DB 연결
		Connection conn = getDBConnection();
		if (conn != null) {
			System.out.println("오라클 연결 성공");
		} else
			return -1;

		// PreparedStatement 변수, ResultSet 변수 선언
		PreparedStatement pstmt = null;
		ResultSet rSet = null;

		String sql = new StringBuilder()
				.append("update book ")
				.append("set password=?, nickname=? ")
				.append("where no=?")
				.toString();
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, password);
			pstmt.setString(2, nickname);
			pstmt.setInt(3, no);

			result = pstmt.executeUpdate();

			System.out.println(result + "행이 수정되었습니다.");
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
		return result;
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
