package user;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import properties.DBConnect;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

public class userDAO {
    public static int login(String LoginID, String Password) {
        String SQL = "SELECT pwd FROM USERINFO WHERE LoginID = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null; 
        try {
            conn = DBConnect.makeConn();
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, LoginID);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                if(rs.getString(1).equals(Password)) {
                    return 1;
                } 
                else {
                    return 0;
                }
            }
            return -1;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {if(conn != null) conn.close();} catch (Exception e) {e.printStackTrace();}
            try {if(pstmt != null) pstmt.close();} catch (Exception e) {e.printStackTrace();}
            try {if(rs != null) rs.close();} catch (Exception e) {e.printStackTrace();}
        }
        return -2;
    }

    public static String[] getInfo(String LoginID) {
        String SQL = "SELECT UserName, LoginID, pwd, Email, Age, Phone, NickName, Address, SignedDay FROM USERINFO WHERE LoginID = ?";
        String[] info = new String[9];
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = DBConnect.makeConn();
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, LoginID);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                info[0] = rs.getString(1);
                info[1] = rs.getString(2);
                info[2] = rs.getString(3);
                info[3] = rs.getString(4);
                info[4] = rs.getString(5);
                info[5] = rs.getString(6);
                info[6] = rs.getString(7);
                info[7] = rs.getString(8);
                info[8] = rs.getString(9);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return info;
    }
    
    public static void setUserInfo(userDTO instance) {
    	try {
    		Connection conn = DBConnect.makeConn();
    		String SQL = "UPDATE USERINFO SET pwd = ?, Email = ?, Age = ?, Phone = ?, Address = ? WHERE LoginID = ?";
    		PreparedStatement pstmt = conn.prepareStatement(SQL); 
    		
    		pstmt.setString(1, instance.Password);
    		pstmt.setString(2, instance.Email);
    		pstmt.setString(3, instance.Age);
    		pstmt.setString(4, instance.Phone);
    		pstmt.setString(5, instance.Address);
    		pstmt.setString(6, instance.LoginID);
    		System.out.println(instance.Address);
    		
    		pstmt.executeUpdate();
    	} catch(SQLException e) {
    		System.out.println("DB연결 오류");
    	}
    	
    }

    public static int join(String UserName, String LoginID, String Password, String Email, String Age, String Phone, String NickName, String Address) {
       LocalDate time = LocalDate.now();
       DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyMMdd");
       String Date = time.format(formatter);
       String SQL = "INSERT INTO USERINFO(UserName, LoginID, pwd, Email, Age, Phone, NickName, Address, SignedDay) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            Connection conn = DBConnect.makeConn();
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, UserName);
            pstmt.setString(2, LoginID);
            pstmt.setString(3, Password);
            pstmt.setString(4, Email);
            pstmt.setString(5, Age);
            pstmt.setString(6, Phone);
            pstmt.setString(7, NickName);
            pstmt.setString(8, Address);
            pstmt.setString(9, Date);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

    public static boolean checkID(String LoginID) {
        String SQL = "SELECT LoginID FROM USERINFO WHERE LoginID = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = DBConnect.makeConn();
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, LoginID);
            rs = pstmt.executeQuery();
            if(rs.next()) return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static boolean checkNickName(String NickName) {
        String SQL = "SELECT NickName FROM USERINFO WHERE NickName = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = DBConnect.makeConn();
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, NickName);
            rs = pstmt.executeQuery();
            if(rs.next()) return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static String getNickName(String UserID) {
        String SQL = "SELECT NickName FROM USERINFO WHERE UserID = ?";
        Connection conn = null;
        String Nickname = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = DBConnect.makeConn();
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, UserID);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                Nickname = rs.getString(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Nickname;
    }
    
    public static ArrayList<userDTO> getRanking() {
       ArrayList<userDTO> userList = new ArrayList<userDTO>();
       String SQL = "SELECT * FROM USERINFO ORDER BY Score DESC, SignedDay ASC";
       
       try {
          Connection conn = DBConnect.makeConn();
          Statement stmt = conn.createStatement();
          ResultSet rs = stmt.executeQuery(SQL);
          
          while (rs.next()) {
             userDTO instance = new userDTO();
             instance.setUserDTO(rs);
             userList.add(instance);
          }
          
          return userList;
       } catch (SQLException e) {
          System.out.println("getRanking 메소드에서 오류");
          e.printStackTrace();
          return null;
       }
    }
    
    public static int addScore(String Score, String LoginID) {
		String SQL = "UPDATE USERINFO SET Score = Score + ? WHERE LoginID = ?";

        try {
            Connection conn = DBConnect.makeConn();
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, Score);
            pstmt.setString(2, LoginID);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
	}
    
    public static String searchScore(String LoginID) {
        String SQL = "SELECT Score FROM USERINFO WHERE LoginID = ?";
        Connection conn = null;
        String Score = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = DBConnect.makeConn();
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, LoginID);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                Score = rs.getString(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Score;
    }
    
    public static String countUser() {
        String SQL = "SELECT COUNT(*) FROM USERINFO";
        Connection conn = null;
        String count = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = DBConnect.makeConn();
            pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();
            if(rs.next()) {
            	count = rs.getString(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }
}