<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "board.*"%>
<%@ page import="java.io.PrintWriter"%>
<%
//public static void main(String[] args])
	request.setCharacterEncoding("UTF-8");

	BoardDTO forInsert = new BoardDTO();
	
	forInsert.header = request.getParameter("header");
	forInsert.content = request.getParameter("contents");
	forInsert.nickName = String.valueOf(session.getAttribute("NickName"));
	
	BoardDAO.makePost(forInsert);
	
	PrintWriter script = response.getWriter();
    script.println("<script type = 'text/javascript'>");
    script.println("alert('게시물이 등록되었습니다.');");
	script.println("location.href = '../board.jsp';");
    script.println("</script>");
	script.close();
			
%>