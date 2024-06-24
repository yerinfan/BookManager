package Book;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public abstract class JDBConnection {
 	public Connection conn;
	public PreparedStatement pstmt;
	public ResultSet rs;

	public void getConnection(String jdbcDriverClassName, String url, String userId, String passwd) {	
		try {
			// JDBC 드라이버 loading
			Class.forName(jdbcDriverClassName);
			// Connection 객체 생성
			conn = DriverManager.getConnection(url, userId, passwd);
			System.out.println("오라클 DB 연결 성공");

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}

	public void close() {
		try {
			if (conn != null) conn.close();
			if (pstmt != null) pstmt.close();
			if (rs != null) rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
