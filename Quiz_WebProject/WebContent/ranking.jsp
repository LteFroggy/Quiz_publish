<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "user.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>동퀴콩</title>
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/custom.css">
    <link rel="icon" href="./img/favicon.png">
</head>
<body class="text-center">
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
</nav><br><br><br><br><br><br>
<%
	@SuppressWarnings("unchecked")
	ArrayList<userDTO> userList = (ArrayList<userDTO>)(session.getAttribute("userList"));
	
%>
<div class="container col-md-4" style="text-align:center">
	<h2><img src="img/rank.png" style="width:40px;">&nbsp;<b>랭킹</b></h2><hr class="my-4"><br><br>
	<table style="margin:0 auto; width:500px;text-align:center;">
		
<% 
	try {
		for (int i = 0; i < 5; i ++) {
			String nickName = userList.get(i).NickName;
%>
		<tr>
<% 
			if (i==0) {
%>
			<td style="background-color:gold; font-size:25px; border-radius:10px; width:60px; height:60px; color:white"><b><%=i + 1  %><b></b></td>
<%
			} else if (i==1) {
%>
			<td style="background-color:silver; font-size:25px; border-radius:10px; width:60px; height:60px; color:white"><b><%=i + 1  %><b></b></td>
<%
			} else if (i==2) {
%>
			<td style="background-color:#c89072; font-size:25px; border-radius:10px; width:60px; height:60px; color:white"><b><%=i + 1  %><b></b></td>
<%
			} else {
%>
			<td style="background-color:#558DF0; font-size:25px; border-radius:10px; width:60px; height:60px; color:white"><b><%=i + 1  %><b></b></td>
<%
			}
%>
			<td style="font-size:25px; width:440px"><%=nickName %></td>
		</tr>
		<tr>
			<td style="height:30px"></td>
			<td></td>
		</tr>
<%
		}
	} catch (Exception e) {
		
	}
		
%>
	</table><br><br><br>
<%
			String cntAll, rank;
			String ID = String.valueOf(session.getAttribute("LoginID"));
			int userLoc = 0;
			String nickName = String.valueOf(session.getAttribute("NickName"));
			
			cntAll=userDAO.countUser();
			
			for (int i = 0; i < userList.size(); i++) {
				if (userList.get(i).LoginID.equals(String.valueOf(session.getAttribute("LoginID")))) {
					userLoc = i + 1;
					break;
				}
			}
			
            if(LoginID != null) {
%>
            <h3><%=nickName %>님은 <%=cntAll %>명 중 <%=userLoc %>등이에요!</h2>
<%
            }
%>

	

</div>
<br><br><br><br><br><br><br><br>
<footer class="bg-light mt-4 p-5 text-center" style="color: #000000;">
    2017112079 윤대현<br>2017112066 정호종<br>
    Copyright &copy; 2021 동퀴콘개발팀 All Rights Reserved.
</footer>
<script src="./js/jquery.min.js"></script>
<script src="./js/popper.js"></script>
<script src="./js/bootstrap.min.js"></script>
</body>
</html>

