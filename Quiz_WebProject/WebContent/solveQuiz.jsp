<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.PrintWriter"%>
<%@ page import = "question.*" %>
<%@ page import = "java.util.ArrayList" %>
<%
	@SuppressWarnings("unchecked")
	ArrayList<QuestionDTO> qList = (ArrayList<QuestionDTO>)session.getAttribute("questionList");
	String type = String.valueOf(session.getAttribute("type"));
	int qnum = Integer.parseInt(String.valueOf(session.getAttribute("qnum")));
	session.setAttribute("qnum", qnum+1);
	int score = 0;
	if(qnum!=0) {
		score = Integer.parseInt(request.getParameter("score"));
	}
	session.setAttribute("score", score);
	
	QuestionDTO instance = qList.get(qnum);
	
	//qList.get(i).answer 이거 하면 답 번호 나옴
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>동퀴콘</title>
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/custom.css">
    <link rel="icon" href="./img/favicon.png">
    <style>
	    .circle {
			position: fixed;
			transition-property: width, height, margin-left, margin-top;
			transition-duration: 0.5s;
			transform: translateX(-50%) translateY(-50%);
			border-radius: 50%;
			border: 50px solid #558DF0;
	    }
	    .digonal1 {
	    	position: fixed;
			background-color: #D65046;
			transform: rotate(-45deg);
		}
		.digonal2 {
	    	position: fixed;
			background-color: #D65046;
			transform: rotate(45deg);
		}
	</style>
	<script>
		function showCircle() {
			let div = document.createElement('div');
		    div.style.width = 0;
		    div.style.height = 0;
		    div.style.left = '50%';
		    div.style.top = '50%';
		    div.className = 'circle';
		    document.body.append(div);

		    setTimeout(() => {
		      div.style.width = '400px';
		      div.style.height = '400px';
		    }, 0);
		}
		function showDiagonal() {
			let div1 = document.createElement('div1');
			div1.style.width = 0;
			div1.style.height = 0;
			div1.style.left = '49%';
			div1.style.top = '25%';
			div1.className = 'digonal1';
			document.body.append(div1);
			div1.style.width = '50px';
			div1.style.height = '400px';
			
			let div2 = document.createElement('div2');
			div2.style.width = 0;
			div2.style.height = 0;
			div2.style.left = '49%';
			div2.style.top = '25%';
			div2.className = 'digonal2';
			document.body.append(div2);
			div2.style.width = '50px';
			div2.style.height = '400px';
		}
		function compare(guess)  {
    		var answer="<%=String.valueOf(qList.get(qnum).answer)%>";
    		var score=<%=Integer.parseInt(String.valueOf(session.getAttribute("score")))%>;;
    		if(guess==answer) {
    			showCircle();
    			score = score + 1;
    		} else {
    			showDiagonal();
    		}
    		document.getElementById('score').value=score;
    	}
	</script>
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
	<script type="text/javascript" src="./js/main.js?ver=123">
		alert(guess.equals(<%=qList.get(qnum).answer %>);
    </script>
<div class="py-5 text-center">
    <h2><b><%= type %></b></h2>
</div>
<div class="container col-md-4">
	<%
		if (qList.get(qnum).type) {
			
	%>
		<div class="col-12" style="height:150px; text-align:center; font-size:25px; font-weight:bold; border-radius:5px">
			<img src = "<%=qList.get(qnum).questionContent%>" style = "width: 250px; height:150px; border:3px solid black;">
		</div>
	<%
		} else {
	%>
		<div class="col-12" style="height:150px; padding:50px; background-color: #EAEAEA; text-align:center; font-size:25px; font-weight:bold; border-radius:5px">
			 <label class="form-label">Q : <%=qList.get(qnum).questionContent %></label>
		</div>		
    <%
		}
    %>
		<br><br><br><br>
	<%
		if (qnum < 9) {	
	%>
	<form method="post" action="solveQuiz.jsp">
	<%
		} else {
	%>
	<form method="post" action="resultQuiz.jsp">
	<%
		}
	%>
        <div class="row g-3">
        	<button class="w-100 btn-lg" style="background-color: white; color:#558DF0; border:3px solid #558DF0" name = "answer" value = "1" onclick="compare(this.value)"><b>1. <%=qList.get(qnum).example1 %></b></button>
            <button class="w-100 btn-lg" style="background-color: white; color:#558DF0; border:3px solid #558DF0" name = "answer" value = "2" onclick="compare(this.value)"><b>2. <%=qList.get(qnum).example2 %></b></button>
            <button class="w-100 btn-lg" style="background-color: white; color:#558DF0; border:3px solid #558DF0" name = "answer" value = "3" onclick="compare(this.value)"><b>3. <%=qList.get(qnum).example3 %></b></button>
            <button class="w-100 btn-lg" style="background-color: white; color:#558DF0; border:3px solid #558DF0" name = "answer" value = "4" onclick="compare(this.value)"><b>4. <%=qList.get(qnum).example4 %></b></button>
            <input type="hidden" id="score" name="score">
    <%
    		Thread.sleep(1500);
    %>
        </div><br><br>
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
