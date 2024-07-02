package BookOracle;

import Book.JDBConnection;

public class OracleJDBConnection extends JDBConnection{

	public OracleJDBConnection() {
		// DB 연결을 위한 정보
		final String jdbcDriverClassName = "oracle.jdbc.OracleDriver";
		final String url = "jdbc:oracle:thin:@localhost:1521:xe";
		final String userid = "c##java";
		final String passwd = "1234";

		getConnection(jdbcDriverClassName, url, userid, passwd);
	}

}
