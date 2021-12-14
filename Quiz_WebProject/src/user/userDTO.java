package user;
import java.sql.*;

public class userDTO {
    public String LoginID;
    public String Password;
    public String NickName;
    public String Email;
    public String UserName;
    public String Age;
    public String Phone;
    public String Address;
    public String Date;
    
    public String getLoginID() {
        return LoginID;
    }

    public void setLoginID(String LoginID) {
        this.LoginID = LoginID;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public String getNickName() {
        return NickName;
    }

    public void setNickName(String NickName) {
        this.NickName = NickName;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getUserName() {
        return UserName;
    }

    public void setUserName(String UserName) {
        this.UserName = UserName;
    }

    public String getAge() {
        return Age;
    }

    public void setAge(String Age) {
        this.Age = Age;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }
    
    public void setUserDTO(ResultSet rs) throws SQLException {
    	this.UserName = rs.getString(1);
    	this.LoginID = rs.getString(2);
    	this.Password = rs.getString(3);
    	this.Email = rs.getString(4);
    	this.Age = rs.getString(5);
    	this.Phone = rs.getString(6);
    	this.NickName = rs.getString(7);
    	this.Address = rs.getString(8);
    	this.Date = rs.getString(9);
    }
}
