<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.PrintWriter"%>
<%@ page import = "question.*" %>
<%@ page import = "user.*" %>
<%@ page import = "board.*" %>
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
<div class="container col-md-8">
	<h2><b>게시판</b></h2><hr class="my-4"><br><br>
	<%
		ArrayList<BoardDTO> list = BoardDAO.getPostList();
	%>

	<div class="row mb-3">
	<%
		for (int i = (list.size() - 1); i >= 0; i--) {
	%>
	<div class="col-md-4">
		<div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
			<div class="col p-4 d-flex flex-column position-static">
				<strong class="d-inline-block mb-2 text-primary"><%=list.get(i).postNum%></strong>
				<div class="d-flex justify-content-between align-items-center">
					<h3 class="mb-0"><%=list.get(i).header%></h3>
					<small class="text-muted"><%=list.get(i).nickName%></small>
    			</div>
				<div style="height:100px;">
					<p class="card-text mb-auto"><%=list.get(i).content%></p>
				</div>
				<div class="d-flex justify-content-between align-items-center">
					<%
					String nickName= list.get(i).nickName;
					if(nickName.equals(session.getAttribute("NickName"))) {
					%>
					<a href="action/deletePost.jsp?num=<%=list.get(i).postNum%>"><img src="img/trash.png" style="width:20px; height:20px;"></a>
					<%
					} else {
					%>
					<a href=""><img src="img/blank.PNG" style="width:20px; height:20px;"></a>
					<%
					}
					            %>
					<small class="text-muted"><%=list.get(i).postedDate%></small>
				</div>
			</div>
		</div>
	</div>
	<%
	}
	%>
	</div>
	<%
		if(session.getAttribute("loginID") != null) {
	%>
	<button type="button" data-bs-toggle="modal" data-bs-target="#wrtPost" class="btn mb-3" style="background-color:#558DF0; color:white;">글쓰기</button>
	<%
		} else {
	%>
	<button type="button" class="btn mb-3" style="background-color:#558DF0; color:white;" onclick="toLogin()">글쓰기</button>
	<script>
		function toLogin() {
			alert("로그인이 필요한 서비스입니다.");
			location.href = "login.jsp";
		}
	</script>
	<%
		}
	%>
	<div class="modal fade" id="wrtPost" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	    <div class="modal-dialog modal-dialog-centered">
	        <div class="modal-content">
	            <form method="post" action="action/insertPost.jsp">
	                <div class="modal-header">
	                    <h4 class="modal-title" id="exampleModalLabel">글쓰기 </h4>
	                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	                </div>
	                <div class="modal-body">
	                    <div class="mb-3 d-flex">
	                        <label for="score" class="col-form-label col-md-3">제목</label>
	                        <input type="text" class="form-control col-md-9 ms-auto" name="header" id="header" style="width:350px" required>
	                    </div>
	                    <div class="mb-3 d-flex">
	                        <label for="contents" class="col-form-label col-md-3">내용</label>
	                        <textarea class="form-control col-md-9 ms-auto" name="contents" id="contents" style="width:350px" required></textarea>
	                    </div>
	                </div>
	                <div class="modal-footer">
	                    <button type="button" class="btn" style="background-color: #d3d3d3" data-bs-dismiss="modal">닫기</button>
	                    <button type="submit" class="btn" style="background-color: #558DF0; color:white;">작성</button>
	                </div>
	            </form>
	        </div>
		</div>
    </div>
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