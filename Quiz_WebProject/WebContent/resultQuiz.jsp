<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.PrintWriter"%>
<%@ page import = "question.*" %>
<%@ page import = "user.*" %>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>동퀴콘</title>
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/custom.css">
    <link rel="icon" href="./img/favicon.png">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light fixed-top shadow-sm" style="background-color: #558DF0;">
    <div class="container-xxl d-flex align-items-md-center" style="width:1200px">
        <a class="navbar-brand" href="index.jsp"><img src="./img/mainIcon.png" class="rounded float-start" width="120"></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link" href="action/getQuestion.jsp?type=4" style="font-size:15pt; color:white;"><b>퀴즈 시작하기</b></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="registerQuiz.jsp" style="font-size:15pt; color:white;"><b>퀴즈 만들기</b></a>
                </li>
            </ul>
            <%
                String LoginID = null;
                String UserName = null;
                if(session.getAttribute("loginID") != null) {
                    LoginID = (String) session.getAttribute("LoginID");
                    UserName = (String) session.getAttribute("UserName");
                }
                if(LoginID == null) {
            %>
            <ul class="navbar-nav">
                <a class="nav-link" aria-current="page" href="signUp.jsp" style="color:white">회원가입</a>
                <a class="btn btn-outline-primary" href="login.jsp" style="border-color: white; color: white">로그인</a>
            </ul>
            <%
            } else {
            %>
            <ul class="navbar-nav d-flex">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="color: white">
                        <%=UserName %> 님
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown" style="background-color: #558DF0;">
                        <li><a class="dropdown-item" href="myPage.jsp" style="color: white">마이페이지</a></li>
                        <li><a class="dropdown-item" href="#" style="color: white">1:1 문의</a></li>
                        <li><hr class="dropdown-divider" style="color: white"></li>
                        <li><a class="dropdown-item" href="logout.jsp" style="color: white">로그아웃</a></li>
                    </ul>
                </li>
            </ul>
            <%
                }
            %>
        </div>
    </div>
</nav>
<br><br><br><br>
<div class="py-5 text-center">
</div>
<div class="container col-md-4" style="text-align:center">
<%
	int score = Integer.parseInt(request.getParameter("score"));
	if(score>=8) {
%>
	<h2 style="color:#B3E59F"><b>&nbsp;GOOD!</b></h2>
	<img src="img/excellent.png" style="width: 300px;height:300px">
	<div class="col-12" style="height:100px; padding:30px; background-color: #B3E59F; text-align:center; font-size:25px; font-weight:bold; border-radius:5px">
			 <label class="form-label" style="color:white; font-size:30px;">당신의 점수는 10점 만점의 <%=score %>점</label>
	</div>
<%
	} else if(score>=3 && score<=7) { 
%>
	<h2 style="color:#FFE07D"><b>&nbsp;NOT BAD!</b></h2>
	<img src="img/good.png" style="width: 300px;height:300px">
	<div class="col-12" style="height:100px; padding:30px; background-color: #FFE07D; text-align:center; font-size:25px; font-weight:bold; border-radius:5px">
			 <label class="form-label" style="color:white; font-size:30px;">당신의 점수는 10점 만점의 <%=score %>점</label>
	</div>
<%
	} else {
%>
	<h2 style="color:#DA387D"><b>&nbsp;BAD!</b></h2>
	<img src="img/bad.png" style="width: 300px;height:300px">
	<div class="col-12" style="height:100px; padding:30px; background-color: #DA387D; text-align:center; font-size:25px; font-weight:bold; border-radius:5px">
			 <label class="form-label" style="color:white; font-size:30px;">당신의 점수는 10점 만점의 <%=score %>점</label>
	</div>
<%
	}
	String Score = request.getParameter("score");
	String ID = String.valueOf(session.getAttribute("LoginID"));
	int result1;
	String result2;
	
	result1 = userDAO.addScore(Score, ID);
	if(result1 == 1) {
		session.setAttribute("score", 0);
	} else {
		PrintWriter script = response.getWriter();
	    script.println("<script>");
	    script.println("alert('update 데이터베이스 오류');");
	    script.println("history.back();");
	    script.println("</script>");
	    script.close();
	}
	
	result2 = userDAO.searchScore(ID);
	if(result2 != null) {
%>
	<br><br><br><h2><%=UserName %>님의 총 점수 : <%=result2 %>점</h2>
<%
	} else {
		PrintWriter script = response.getWriter();
	    script.println("<script>");
	    script.println("alert('select 데이터베이스 오류');");
	    script.println("history.back();");
	    script.println("</script>");
	    script.close();
	}
%>
	<br><br><br><br>
	<a href="ranking.jsp" style="color:black; font-size:30px;">랭킹 확인하러 가기</a>
</div><br><br><br><br>
<footer class="bg-light mt-4 p-5 text-center" style="color: #000000;">
    2017112079 윤대현<br>2017112066 정호종<br>
    Copyright &copy; 2021 동퀴콘개발팀 All Rights Reserved.
</footer>
<script src="./js/jquery.min.js"></script>
<script src="./js/popper.js"></script>
<script src="./js/bootstrap.min.js"></script>
</body>
</html>