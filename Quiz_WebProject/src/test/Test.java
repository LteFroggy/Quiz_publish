package test;
import properties.DBConnect;
import question.QuestionDTO;
import java.sql.*;

public class Test {
	public static void main(String[] args) {
		String SQL = "SELECT * FROM CAPITAL_QUESTION";
		try {
			Connection conn = DBConnect.makeConn();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(SQL);
			
			while (rs.next()) {
				QuestionDTO a = new QuestionDTO();
				a.setQuestion(rs);
				System.out.println(a.questionNumber + " : " + a.questionContent);
			}
		} catch (SQLException e) {
			System.out.println("DB오류");
		}
		
	}
}
