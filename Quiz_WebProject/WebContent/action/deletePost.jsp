<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "board.*" %>   
<%@ page import="java.io.PrintWriter"%>
 
 <%
 	request.setCharacterEncoding("UTF-8");
 	
 	//값을 매개변수로 받기
 	String postNum = request.getParameter("num");
 	int result = BoardDAO.deletePost(postNum);
 	
 	//삭제 성공시 복귀, 실패시 결과 출력
 	if (result == 0) {
 		PrintWriter script = response.getWriter();
 	    script.println("<script type = 'text/javascript'>");
 	    script.println("alert('게시물이 삭제되었습니다.');");
 	    script.println("location.href = '../board.jsp';");
 	    script.println("</script>");
 	    script.close();
 	 	response.sendRedirect("../board.jsp");
 	 	
 	} else if (result == -1) {
 	 	PrintWriter script = response.getWriter();
 	    script.println("<script type = 'text/javascript'>");
 	    script.println("alert('게시물 삭제에 실패하였습니다.');");
 	    script.println("history.back();");
 	    script.println("</script>");
 	    script.close();
 	    
 	} else if (result == -2) {
 	 	PrintWriter script = response.getWriter();
 	    script.println("<script type = 'text/javascript'>");
 	    script.println("alert('DB연결에 실패하였습니다.');");
 	    script.println("history.back();");
 	    script.println("</script>");
 	    script.close();
 	}
 %>