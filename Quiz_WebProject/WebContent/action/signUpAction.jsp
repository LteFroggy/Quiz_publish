<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="user.userDTO"%>
<%@ page import="user.userDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
    request.setCharacterEncoding("UTF-8");
    String LoginID = null;
    String Password = null;
    String NickName = null;
    String Email = null;
    String UserName = null;
    String Age = null;
    String Phone = null;
    String Address = null;

    if(request.getParameter("LoginID") != null) {
    	LoginID = (String) request.getParameter("LoginID");
    }
    if(request.getParameter("Password") != null) {
    	Password = (String) request.getParameter("Password");
    }
    if(request.getParameter("NickName") != null) {
    	NickName = (String) request.getParameter("NickName");
    }
    if(request.getParameter("Email") != null) {
    	Email = (String) request.getParameter("Email");
    }
    if(request.getParameter("UserName") != null) {
    	UserName = (String) request.getParameter("UserName");
    }
    if(request.getParameter("Age") != null) {
    	Age = (String) request.getParameter("Age");
    }
    if(request.getParameter("Phone") != null) {
    	Phone = (String) request.getParameter("Phone");
    }
    if(request.getParameter("postCode") != null) {
    	Address = "(" + (String) request.getParameter("postCode") + ") " +
                (String) request.getParameter("address") + " " +
        (String) request.getParameter("detailAddress") +
                (String) request.getParameter("extraAddress");
    }
    userDAO userdao = new userDAO();
    int result;
    boolean checkID = userdao.checkID(LoginID);
    boolean checkNickName = userdao.checkNickName(NickName);

    if (checkID == false && checkNickName == false) {
        result = userdao.join(UserName, LoginID, Password, Email, Age, Phone, NickName, Address);
        if(result == 1) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('회원가입에 성공했습니다.');");
            script.println("location.href = './../index.jsp';");
            script.println("</script>");
            script.close();
            return;
        } else {
        	PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('데이터베이스 오류');");
            script.println("history.back();");
            script.println("</script>");
            script.close();
            return;
        }
    }
    else if (checkID == false) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('중복되는 닉네임 입니다.');");
        script.println("history.back();");
        script.println("</script>");
        script.close();
    }
    else {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('중복되는 ID 입니다.');");
        script.println("history.back();");
        script.println("</script>");
        script.close();
    }

%>
