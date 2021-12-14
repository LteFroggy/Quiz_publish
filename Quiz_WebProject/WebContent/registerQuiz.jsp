<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
    <h2><b>퀴즈등록</b></h2>
</div>
<div class="container col-md-8 col-lg-6">
    <hr class="my-4">
    <form method="post" action="action/registerQuestion.jsp">
        <div class="row g-3">
            <div class="col-12">
                <label for="genre" class="form-label">장르</label>
                <select class="form-select" name="type" id="type" required>
                    <option disable hidden>선택</option>
                    <option value = "1">수도</option>
                    <option value = "2">상식</option>
                    <option value = "3">역사</option>
                </select>
            </div>
            <div class="col-12">
                <label for="question" class="form-label">문제</label>
                <input type="text" class="form-control" name="questionContent" id="questionContent" placeholder="문제 내용을 기입하세요" value="" required>
            </div>
            <div class="col-12">
                <label for="first" class="form-label">1번</label>
                <input type="text" class="form-control" name="example1" id="example1" placeholder="1번 보기" value="" required>
            </div>
            <div class="col-12">
                <label for="second" class="form-label">2번</label>
                <input type="text" class="form-control" name="example2" id="example2" placeholder="2번 보기" value="" required>
            </div>
            <div class="col-12">
                <label for="third" class="form-label">3번</label>
                <input type="text" class="form-control" name="example3" id=""example3"" placeholder="3번 보기" value="" required>
            </div>
            <div class="col-12">
                <label for="fourth" class="form-label">4번</label>
                <input type="text" class="form-control" name="example4" id="example4" placeholder="4번 보기" value="" required>
            </div>
            <div class="col-12">
                <label for="answer" class="form-label">정답</label>
                <select class="form-select" name="answer" id="answer" required>
                    <option disable hidden>선택</option>
                    <option value = "1">1번</option>
                    <option value = "2">2번</option>
                    <option value = "3">3번</option>
                    <option value = "4">4번</option>
                </select>
            </div>
        </div><br><br>
        <button class="w-100 btn btn-lg btn" type="submit" style="background-color: #558DF0; color:white"><b>등록하기</b></button><br>
    </form>
</div>

<footer class="bg-light mt-4 p-5 text-center" style="color: #000000;">
    2017112079 윤대현<br>2017112066 정호종<br>
    Copyright &copy; 2021 동퀴콘개발팀 All Rights Reserved.
</footer>
<script src="./js/jquery.min.js"></script>
<script src="./js/popper.js"></script>
<script src="./js/bootstrap.min.js"></script>
</body>
</html>