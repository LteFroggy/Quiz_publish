<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.PrintWriter"%>
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
</nav><br><br><br><br><br>

	<script type = "text/javascript">	
<%
	String result = String.valueOf(session.getAttribute("result"));
	if (result.equals("success")) {	
%>
			alert("문제가 성공적으로 등록되었습니다");
<%
	} else if (result.equals("failed")) {
%>
			alert("문제 등록에 실패했습니다");
<%
	}
	session.removeAttribute("result");
%>
	</script>
<div id="mainSlide" class="carousel slide carousel-fade" data-bs-ride="carousel" style="width:40%; margin: auto; display: flex; margin-bottom:40px; margin-top: 100px; border-radius:100px; border-width:3px; border-color:#558DF0;">
    <div class="carousel-indicators">
        <button type="button" data-bs-target="#mainSlide" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
        <button type="button" data-bs-target="#mainSlide" data-bs-slide-to="1" aria-label="Slide 2"></button>
        <button type="button" data-bs-target="#mainSlide" data-bs-slide-to="2" aria-label="Slide 3"></button>
    </div>
    <div class="carousel-inner">
        <div class="carousel-item active" id="first">
            <img src="./img/quizRandom.png" class="d-block w-100" alt="첫번째">
        </div>
        <div class="carousel-item" id="second">
            <img src="./img/quizRandom.png" class="d-block w-100" alt="두번째">
        </div>
        <div class="carousel-item" id="third">
            <img src="./img/quizRandom.png" class="d-block w-100" alt="세번째">
        </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#mainSlide" data-bs-slide="prev"">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#mainSlide" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
</div><br><br>
<div class="container-xxl d-flex" style="width:820px; margin: auto;">
	<a class="btn" href="action/getQuestion.jsp?type=0" style="width:210px; height:50px; border-radius: 5px; font-size:15pt; background-color:#558DF0; color:white; padding:10px; margin:7px"><b>국기</b></a>
	<a class="btn" href="action/getQuestion.jsp?type=1" style="width:210px; height:50px; border-radius: 5px; font-size:15pt; background-color:#558DF0; color:white; padding:10px; margin:7px"><b>수도</b></a>
	<a class="btn" href="action/getQuestion.jsp?type=2" style="width:210px; height:50px; border-radius: 5px; font-size:15pt; background-color:#558DF0; color:white; padding:10px; margin:7px"><b>상식</b></a>
	<a class="btn" href="action/getQuestion.jsp?type=3" style="width:210px; height:50px; border-radius: 5px; font-size:15pt; background-color:#558DF0; color:white; padding:10px; margin:7px"><b>한국사</b></a>
</div><br>
<div class="container-xxl d-flex" style="width:800px; margin: auto;">
	<a class="btn" href="action/getRank.jsp" style="width:400px; height:70px; border-width:3px; border-color:#558DF0; border-radius: 5px 0px 0px 5px; font-size:20pt; color:#558DF0; padding:12px"><b>랭킹</b></a>
	<a class="btn" href="board.jsp" style="width:400px; height:70px; border-radius: 0px 5px 5px 0px; font-size:20pt; color:white; background-color: #558DF0; padding:12px"><b>게시판</b></a>
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
