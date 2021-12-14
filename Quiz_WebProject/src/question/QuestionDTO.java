package question;
import java.sql.ResultSet;
import java.sql.SQLException;

public class QuestionDTO {
	//에러 생겼을 시 에러코드 넣어서 return type맞추기 위한 생성자
	public QuestionDTO(int errorCode) {
		this.questionNumber = errorCode;
	}
	
	//default 생성자
	public QuestionDTO() {
		
	}
	
	public int questionNumber = 0;
	//FlagQuestion의 경우에는 Content가 사진 링크임.
	public String questionContent = null;
	public String example1 = null;
	public String example2 = null;
	public String example3 = null;
	public String example4 = null;
	public int answer = 0;
	
	//FlagQuestion의 경우에는 type을 true로 변경해줘야함
	public boolean type = false;
	
	public void setFlagQuestion(ResultSet rs) throws SQLException{
		this.questionNumber = rs.getInt(1);
		this.questionContent = rs.getString(2);
		this.example1 = rs.getString(3);
		this.example2 = rs.getString(4);
		this.example3 = rs.getString(5);
		this.example4 = rs.getString(6);
		this.answer = rs.getInt(7);
		this.type = true;
	}
	
	public void setQuestion(ResultSet rs) throws SQLException{
		this.questionNumber = rs.getInt(1);
		this.questionContent = rs.getString(2);
		this.example1 = rs.getString(3);
		this.example2 = rs.getString(4);
		this.example3 = rs.getString(5);
		this.example4 = rs.getString(6);
		this.answer = rs.getInt(7);
	}
}
