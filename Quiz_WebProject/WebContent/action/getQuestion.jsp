<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "question.*" %>
<%@ page import = 'java.util.ArrayList' %>

<%   
   
//public static void main(String[] args)
   request.setCharacterEncoding("UTF-8");

   String userName = String.valueOf(session.getAttribute("UserName"));
   
   if (userName.equals("null")) {
      response.sendRedirect("../login.jsp");
      return;
   }
   
   //문제 갯수 지정
   final int COUNT = 10;

   //qtype은 Link에서 getQuestion.jsp?type=n 형식으로 전달하자
   int qtype = Integer.parseInt(request.getParameter("type"));
   int type = qtype;
   
   //중복되는 문제 번호가 존재하는지 체크하기 위함
   ArrayList<Integer> check = new ArrayList<Integer>();
   
   //문제 정보 전송용
   ArrayList<QuestionDTO> questionList = new ArrayList<QuestionDTO>();
   
   for (int i = 0; i < COUNT; i++) {
      
      //4면 랜덤이니 문제 종류 랜덤하게 섞어줘야함
      if (qtype == 4)
         type = (int)(Math.random() * 3);
      
      int questionNumber = 0;
      
      //0이면 국기, 1이면 수도, 2면 상식, 3이면 역사, 4면 랜덤
      switch (type) {
      //국기는 문제가 37번까지 있음.
      case 0 : 
         //중복되는 문제번호 아닐때까지 계속 뽑음
         do {
            questionNumber = (int)((Math.random()) * (QuestionDAO.getMaxNumber(type) - 1) + 1);
         } while(check.contains(questionNumber));
         QuestionDTO instance = new QuestionDTO();
         questionList.add(QuestionDAO.getFlagQuestion(questionNumber));
         break;
         
      case 1 :
      case 2 : 
      case 3 :
         //중복되는 문제번호 아닐때까지 계속 뽑음
         do {
            questionNumber = (int)((Math.random()) * (QuestionDAO.getMaxNumber(type) - 1) + 1);
         } while(check.contains(questionNumber));
         questionList.add(QuestionDAO.getQuestion(questionNumber, type));
         break;
         
      default :
         System.out.println("문제 삽입 오류입니다");
      }
      check.add(questionNumber);
   }
   
   //questionList라는 ArrayList<QuestionDTO>형식으로 session에 저장.
   session.setAttribute("questionList", questionList);
   
   switch(qtype) {
   case 0 : session.setAttribute("type", "국기"); break;
   case 1 : session.setAttribute("type", "수도"); break;
   case 2 : session.setAttribute("type", "상식"); break;
   case 3 : session.setAttribute("type", "역사"); break;
   case 4 : session.setAttribute("type", "랜덤"); break;
   }
   
   session.setAttribute("qnum", "0");
   session.setAttribute("score", "0");
   
   //문제풀이 페이지로 이동
   response.sendRedirect("../solveQuiz.jsp");
%>