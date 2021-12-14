<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="user.userDTO"%>
<%@ page import="user.userDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
  request.setCharacterEncoding("UTF-8");
  String LoginID = null;

  if(request.getParameter("LoginID") != null) {
	  LoginID = (String) request.getParameter("LoginID");
  }

  boolean result = userDAO.checkID(LoginID);
  if(result) {
    PrintWriter script = response.getWriter();
    script.println("<script type = 'text/javascript'>");
    script.println("alert('중복되는 아이디 입니다.');");
    script.println("history.back();");
    script.println("</script>");
    script.close();
    return;
  } else {
    PrintWriter script = response.getWriter();
    script.println("<script type = 'text/javascript'>");
    script.println("alert('사용가능한 아이디 입니다.');");
    script.println("history.back();");
    script.println("</script>");
    script.close();
    return;
  }
%>