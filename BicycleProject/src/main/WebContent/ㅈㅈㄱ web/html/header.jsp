  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>동행하는 사람들...</title>
  </head>

  <body>
      <!-- 헤더 -->
      <div class="container-fluid">
          <div class="jumbotron" style="padding-top: 0px;
        padding-bottom: 0px;">

              <div class="row justify-content-between">
                  <div class="col-lg-4">
                      <img alt="ㅁㄴㅇ" src="./image/headerlogo/로고이미지.gif">
                  </div>
                  <!-- 로고 텍스트 이미지 직사각형 수정 요망 넓이 크게 -->
                  <div class="col-lg-4 text-center">
                      <a href="./main.jsp"><img src="./image/headerlogo/로고텍스트.gif" alt="ㅁㄴㅇ"></a>
                  </div>
                  <div class="col-lg-2">
                  </div>
                  <div class="col-lg-2 align-self-center">
                      <a href="login.jsp" class="btn btn-uni btn-sm mr-3">&nbsp;로그인&nbsp;</a>
                      <a href="signup.jsp" class="btn btn-uni btn-sm">회원가입</a>
                  </div>
              </div>
          </div>

          <div class="row">

              <div class="col-lg-1">
              </div>

              <!-- 주카테고리 -->

              <div class="col-lg-4">
                  <ul class="nav nav-pills justify-content-around display-5">
                      <li><a href="boardA.jsp" class="navbar-link text-dark">지식정보</a></li>
                      <li>|</li>
                      <li><a href="#" class="navbar-link text-dark">소통</a></li>
                      <li>|</li>
                      <li><a href="#" class="navbar-link text-dark">중고거래</a></li>
                      <li>|</li>
                      <li><a href="#" class="navbar-link text-dark">챌린지</a></li>
                  </ul>
              </div>

          </div>

          <!-- hr -->
          <div class="row">
              <div class="col-lg-1">
              </div>
              <div class="col-lg-10">
                  <hr>
              </div>
              <div class="col-lg-1">
              </div>
          </div>
      </div>
  </body>