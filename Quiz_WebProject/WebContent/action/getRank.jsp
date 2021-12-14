<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.*"%>
<%@ page import = "java.util.ArrayList" %>

<%
//public static void main(Stringp[] args) 
	ArrayList<userDTO> userList = userDAO.getRanking();
	
	session.setAttribute("userList", userList);
	
	response.sendRedirect("../ranking.jsp");
%>