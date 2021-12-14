<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="user.userDTO"%>
<%@ page import="user.userDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
  request.setCharacterEncoding("UTF-8");
  String NickName = null;

  if(request.getParameter("NickName") != null) {
	  NickName = (String) request.getParameter("NickName");
  }

  boolean result = userDAO.checkNickName(NickName);
  if(result) {
    PrintWriter script = response.getWriter();
    script.println("<script>");
    script.println("alert('중복되는 닉네임 입니다.');");
    script.println("history.back();");
    script.println("</script>");
    script.close();
    return;
  } else {
    PrintWriter script = response.getWriter();
    script.println("<script>");
    script.println("alert('사용가능한 닉네임 입니다.');");
    script.println("history.back();");
    script.println("</script>");
    script.close();
    return;
  }
%>