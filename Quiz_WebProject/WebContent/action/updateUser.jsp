<%@ page language="java" contentType="text/html; charset=UTF-8"
    	pageEncoding="UTF-8"%>
<%@ page import = "user.*" %>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
	userDTO instance = new userDTO();
	instance.LoginID = String.valueOf(session.getAttribute("LoginID"));
	instance.Password = request.getParameter("Password");
	instance.Address = "(" + (String) request.getParameter("postCode") + ") " +
            (String) request.getParameter("address") + " " +
    		(String) request.getParameter("detailAddress") +
            (String) request.getParameter("extraAddress");
	instance.Age = request.getParameter("Age");
	instance.Email = request.getParameter("Email");
	instance.Phone = request.getParameter("Phone");
	
	userDAO.setUserInfo(instance);
	
	PrintWriter script = response.getWriter();
    script.println("<script type = 'text/javascript'>");
    script.println("alert('회원정보가 수정되었습니다.');");
	script.println("location.href = '../myPage.jsp';");
    script.println("</script>");
	script.close();
%>