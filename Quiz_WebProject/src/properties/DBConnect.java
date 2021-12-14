package properties;
import java.sql.*;

public class DBConnect {
	final static String URL = "jdbc:mysql://dongguk-quiz-contest.cqursishyorn.ap-northeast-2.rds.amazonaws.com:3306/Quiz_Contest?serverTimezone=UTC";
	final static String userName = "master";
	final static String password = "123456789";
	
	//conn만들 때 DBConnect.makeConn() 사용. Exception 발생하면 그쪽으로 던짐
	public static Connection makeConn() throws SQLException {
		Connection conn = DriverManager.getConnection(URL, userName, password);
		return conn;
	}
}