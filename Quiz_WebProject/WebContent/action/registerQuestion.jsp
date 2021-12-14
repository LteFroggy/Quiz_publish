<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "question.*"%>
<%
//public static void main(String[] args])
	request.setCharacterEncoding("UTF-8");

	int type = Integer.parseInt(request.getParameter("type"));
	QuestionDTO forInsert = new QuestionDTO();
	
	forInsert.questionNumber = QuestionDAO.getMaxNumber(type) + 1;
	System.out.println("type " + type + "에 대한 maxNumber : " + forInsert.questionNumber);
	forInsert.questionContent = request.getParameter("questionContent");
	forInsert.example1 = request.getParameter("example1");
	forInsert.example2 = request.getParameter("example2");
	forInsert.example3 = request.getParameter("example3");
	forInsert.example4 = request.getParameter("example4");
	forInsert.answer = Integer.parseInt(request.getParameter("answer"));
	

	int result = QuestionDAO.makeQuestion(forInsert, type);
	
	if (result == 1) {
		session.setAttribute("result", "success");
		response.sendRedirect("../index.jsp");
	}
	
	if (result == 0) {
		session.setAttribute("result", "maxNotFound");
		response.sendRedirect("../index.jsp");
	}
	
	else if (result == -1) {
		session.setAttribute("result", "failed");
		response.sendRedirect("../index.jsp");
	}		
%>