<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import = "user.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>동퀴콩</title>
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/custom.css">
    <link rel="icon" href="./image/favicon.png">
    <script type="text/javascript">
        function checkPassword(){

            var password = document.getElementById('Password').value;
            var NB = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
            var SC = ["!","@","#","$","%"];
            var check_SC = 0, check_NB = 0;

            if(password.length < 8 || password.length>20){
                window.alert('비밀번호는 8글자 이상, 20글자 이하만 이용 가능합니다.');
                document.getElementById('pw').value='';
            }
            for(var i=0;i<SC.length;i++){
                if(password.indexOf(SC[i]) != -1){
                    check_SC = 1;
                }
            }
            for(var i=0;i<NB.length;i++){
                if(password.indexOf(NB[i]) != -1){
                    check_NB = 1;
                }
            }
            if(check_SC == 0){
                window.alert('!,@,#,$,% 의 특수문자가 반드시 포함되어야 합니다.')
                document.getElementById('password').value='';
            }
            if(check_NB == 0){
                window.alert('숫자가 반드시 포함되어야 합니다.')
                document.getElementById('Password').value='';
            }
            if(document.getElementById('Password').value !='' && document.getElementById('PasswordVerify').value!=''){
                if(document.getElementById('Password').value==document.getElementById('PasswordVerify').value){
                    document.getElementById('check').innerHTML='비밀번호가 일치합니다.'
                    document.getElementById('check').style.color='blue';
                }
                else{
                    document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
                    document.getElementById('check').style.color='red';
                }
            }
        }
        function checkValue() {
            if(document.userInfo.Password.value != document.userInfo.PasswordVerify.value) {
                alert("비밀번호가 일치하지 않습니다.");
                return false;
            }
            else return true;
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
</nav>
<br><br><br><br>
<%
	String[] info = userDAO.getInfo(LoginID);
	String loginID = info[1];
	String nickName = info[6];
	String mailAddress = info[3];
	String userName = info[0];
	String userAge = info[4];
	String phoneNumber = info[5];
    
%>
<div class="py-5 text-center">
    <h2><b>회원정보 수정</b></h2>
</div>
<div class="container col-md-8 col-lg-6">
    <hr class="my-4">
    <form method="post" action="action/updateUser.jsp" name="userInfo" onsubmit="return checkValue()">
        <div class="row g-3">
        	<div class="col-12 d-flex">
        		<div class="col-5" style="margin-right: 8.5%" >
                	<label for="UserName" class="form-label">이름</label>
                	<input type="text" class="form-control" name="UserName" id="UserName" value="<%=userName %>" disabled>
            	</div>
				<div class="col-6">
				    <label for="LoginID" class="form-label">아이디</label>
				    <input type="id" class="form-control" name="LoginID" id="LoginID" placeholder="" style="margin-right: 10px" value="<%=loginID %>" disabled>
				</div>
        	</div>
            <div class="col-12">
                <label for="NickName" class="form-label">닉네임</label>
                <input type="text" class="form-control" name="NickName" id="NickName" value="<%=nickName %>" disabled>
            </div>
            <div class="col-12">
                <label for="Password" class="form-label">비밀번호<span class="text-muted">(8자~20자리의 영문자, 숫자, 특수문자 반드시 포함)</span></label>
                <input type="password" class="form-control" name="Password" id="Password" placeholder="" onchange="checkPassword()" required>
            </div>
            <div class="col-12">
                <label for="passwordVerify" class="form-label">비밀번호 재입력</label>
                <input type="password" class="form-control" name="PasswordVerify" id="PasswordVerify" placeholder="" onchange="checkPassword()" required>
                &nbsp;<span id="check"></span>
            </div>
            <div class="col-12">
                <label for="Email" class="form-label">이메일</label>
                <input type="email" class="form-control" name="Email" id="Email" value="<%=mailAddress %>" required>
            </div>
            <div class="col-12 d-flex">
                <div class="col-4">
                    <label for="Age" class="form-label">나이</label>
                    <select class="form-select" name="Age" id="Age" required>
                        <option selected disabled hidden>선택</option>
                        <option>14</option>
                        <option>15</option>
                        <option>16</option>
                        <option>17</option>
                        <option>18</option>
                        <option>19</option>
                        <option>20</option>
                        <option>21</option>
                        <option>22</option>
                        <option>23</option>
                        <option>24</option>
                        <option>25</option>
                        <option>26</option>
                        <option>27</option>
                        <option>28</option>
                        <option>29</option>
                        <option>30</option>
                    </select>
                </div>
                <div class="col-7">
                    <label for="Phone" class="form-label"style="margin-left:10%;">전화번호</label>
                    <input type="number" class="form-control" name="Phone" id="Phone" value="<%=phoneNumber %>" style="margin-left:10%; width:104.5%" required>
                </div>
            </div>
            <div class="col-12">
                <label for="postCode" class="form-label">주소</label>
                <div class="col-12 d-flex">
                    <input type="text" class="form-control" name="postCode" id="postCode" placeholder="우편번호" style="margin-right: 10px" required>
                    <button class="col-3 btn" onclick="findPostalCode()" style="background-color: #558DF0; color:white"><b>우편번호 찾기</b></button>
                </div>
            </div>
            <div class="col-12">
                <input type="text" class="form-control" name="address" id="address" placeholder="주소" required>
            </div>
            <div class="col-12 d-flex">
                <div class="col-7">
                    <input type="text" class="form-control" name="detailAddress" id="detailAddress" placeholder="상세주소" required>
                </div>
                <div class="col-4">
                    <input type="text" class="form-control" name="extraAddress" id="extraAddress" placeholder="참고항목" style="margin-left:10%; width:115%">
                </div>
            </div>
            <div id="wrap" style="display:none;border:5px solid #558DF0;width:500px;height:300px;position:relative;overflow-y:hidden">
                <button type="button" class="btn-close" id="btnFoldWrap" aria-label="Close" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldPostcode()"></button>
            </div>
            <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
            <script>
                var element_wrap = document.getElementById('wrap');

                function foldPostcode() {
                    element_wrap.style.display = 'none';
                }

                function findPostalCode() {
                    var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
                    new daum.Postcode({
                        oncomplete: function(data) {
                            var addr = '';
                            var extraAddr = '';

                            if (data.userSelectedType === 'R') {
                                addr = data.roadAddress;
                            } else {
                                addr = data.jibunAddress;
                            }

                            if(data.userSelectedType === 'R'){
                                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                                    extraAddr += data.bname;
                                }
                                if(data.buildingName !== '' && data.apartment === 'Y'){
                                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                                }
                                if(extraAddr !== ''){
                                    extraAddr = ' (' + extraAddr + ')';
                                }
                                document.getElementById("extraAddress").value = extraAddr;

                            } else {
                                document.getElementById("extraAddress").value = '';
                            }

                            document.getElementById('postCode').value = data.zonecode;
                            document.getElementById("address").value = addr;
                            document.getElementById("detailAddress").focus();

                            element_wrap.style.display = 'none';
                            document.body.scrollTop = currentScroll;
                        },
                        onresize : function(size) {
                            element_wrap.style.height = size.height+'px';
                        },
                        width : '100%',
                        height : '110%'
                    }).embed(element_wrap);
                    element_wrap.style.display = 'block';
                }
            </script>
        </div><br><br>
        <button class="w-100 btn btn-lg btn" type="submit" style="background-color: #558DF0; color:white"><b>수정</b></button><br>
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

