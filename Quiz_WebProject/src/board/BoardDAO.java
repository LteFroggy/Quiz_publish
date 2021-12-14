package board;
import properties.DBConnect;
import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;

public class BoardDAO {
	public static void makePost(BoardDTO instance) {
		try {
			Connection conn = DBConnect.makeConn();
			Statement stmt = conn.createStatement();
			String SQL = "SELECT MAX(PostNum) FROM POSTLIST";
			//새로운 PostNum의 값을 지정하기 위해 최대값 가져오기
			ResultSet rs = stmt.executeQuery(SQL);
			
			//가져와진 값이 없으면? 첫 번째 글이므로 게시물 숫자를 1로.
			if (rs.next()) {
				instance.postNum = rs.getInt(1) + 1;
			} else
				instance.postNum = 1;
			
			//글이 써진 날짜는 오늘 날짜로.
 			instance.postedDate = String.valueOf(LocalDate.now());
			
			
			SQL = "INSERT INTO POSTLIST VALUES(?, ?, ?, ?, ?)";
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, instance.nickName);
			pstmt.setInt(2, instance.postNum);
			pstmt.setString(3, instance.header);
			pstmt.setString(4, instance.content);
			pstmt.setString(5, instance.postedDate);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("makeBoard에서 DB 연결에 실패하였습니다");
		}
	}
	
	public static ArrayList<BoardDTO> getPostList() {
		ArrayList<BoardDTO> postList = new ArrayList<BoardDTO>();
		try {
			Connection conn = DBConnect.makeConn();
			Statement stmt = conn.createStatement();
			String SQL = "SELECT * FROM POSTLIST";
			ResultSet rs = stmt.executeQuery(SQL);
			
			while (rs.next()) {
				BoardDTO instance = new BoardDTO();
				instance.nickName = rs.getString(1);
				instance.postNum = rs.getInt(2);
				instance.header = rs.getString(3);
				instance.content = rs.getString(4);
				instance.postedDate = rs.getString(5);
				
				//가져온 정보 모두 ArrayList에 넣음
				postList.add(instance);
			}
			
		
		} catch (SQLException e) {
			
		}
		
		//ArrayList에 반환.
		return postList;
	}
	
	public static int deletePost(String postNum) {
		try {
			Connection conn = DBConnect.makeConn();
			String SQL = "DELETE FROM POSTLIST WHERE PostNum = ?";
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, postNum);
			
			if (pstmt.executeUpdate() != 0) 
				return 0;
			else
				return -1;
			
			
		} catch (SQLException e) {
			return -2;
		}
		
		
		
	}
}
