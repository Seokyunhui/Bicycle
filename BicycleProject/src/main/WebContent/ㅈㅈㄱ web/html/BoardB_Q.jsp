<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="./resorces/css/bootstrap4.0.0.css">
    <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.3/css/fontawesome.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <script src="https://use.fontawesome.com/0b8394fc8a.js"></script>
    <style>
        .prpl {
            padding-left: 20px;
            padding-right: 20px;
        }

        .footer {
            background-color: cornsilk;
        }
    </style>
<title>Insert title here</title>
</head>
<body>
  <!--header-->
    <div class="container-fluid">
        <div class="jumbotron" style="padding-top: 0px;
        padding-bottom: 0px;">

            <div class="row justify-content-between">
                <div class="col-lg-4">
                    <img src="./resorces/imgaes/logo.gif" alt="">
                </div>
                <!-- 로고 텍스트 이미지 직사각형 수정 요망 넓이 크게 -->
                <div class="col-lg-4 text-center">
                    <img src="./resorces/imgaes/logotext.gif" alt="">
                </div>
                <div class="col-lg-1">

                </div>
                <div class="col-lg-2 align-self-center">
                    <a href="#" class="btn btn-uni btn-sm mr-3">&nbsp;로그인&nbsp;</a>
                    <a href="#" class="btn btn-uni btn-sm">회원가입</a>
                </div>
            </div>
        </div>
        <div class="row">

            <div class="col-lg-1">
            </div>

            <!-- 주카테고리 -->

            <div class="col-lg-4">
                <ul class="nav nav-pills justify-content-around display-5">
                    <li><a href="#" class="navbar-link text-dark">지식정보</a></li>
                    <li>|</li>
                    <li><a href="#" class="navbar-link text-dark">소통</a></li>
                    <li>|</li>
                    <li><a href="#" class="navbar-link text-dark">중고거래</a></li>
                    <li>|</li>
                    <li><a href="#" class="navbar-link text-dark">챌린지</a></li>
                </ul>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-1">
            </div>
            <div class="col-lg-10">
                <hr>
            </div>
            <div class="col-lg-1">
            </div>
        </div>


        <div class="row">
            <div class="col-lg-1"></div>
            <div class="col-lg-1"></div>
            <div class="col-lg-1"></div>
            <div class="col-lg-1"></div>
            <div class="col-lg-1"></div>
            <div class="col-lg-1"></div>
            <div class="col-lg-1"></div>
            <div class="col-lg-1"></div>
            <div class="col-lg-1"></div>
            <div class="col-lg-1">
                <!--검색-->
                <form action="">
                    <div class="input-group">
                        <input type="search" placeholder="search" aria-describedby="button-addon5" class="form-control">
                        <div class="input-group-append">
                            <button id="button-addon5" type="submit" class="btn btn-info"><i class="fa fa-search"
                                    aria-hidden="true"></i></button>
                        </div>
                    </div>
                </form>
            </div>
            <!--글등록-->
            <div class="col-lg-1">
                <div class="col-lg-5"></div>
                <div class="col-lg-5">
                    <a href="btn btn-info"><input type="button" class="btn btn-info" value="글등록"></a>
                </div>
            </div>
            <div class="col-lg-1">
            </div>
        </div>
        <div class="row"><br></div>
    </div>
    <!-- Table -->
    <div class="row">
        <div class="col-lg-1">
        </div>
        <div class="col-lg-10">
            <div class="panel panel-default">
                <!-- Default panel contents -->
                <table class="table table-hover">
                    <div class="panel-heading">게시판</div>
                    <thead>
                        <tr style="height: 60%">
                            <th style="width :10%">번호</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>날짜</th>
                            <th>조회수</th>
                            <th>댓글수</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>안녕하세요</td>
                            <td>admin</td>
                            <td>2021-07-08</td>
                            <td>3</td>
                            <td>2</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="col-lg-1"></div>
    </div>


    <!--목록버튼-->
    <div class="row">
        <div class="col-lg-1"></div>
        <div class="col-lg-1"></div>
        <div class="col-lg-1"></div>
        <div class="col-lg-1"></div>
        <div class="col-lg-1"></div>
        <div class="col-lg-2">
            <ul class="pagination">
                <li class="page-item"><a class="page-link" href="#">
                        < </a>
                </li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">4</a></li>
                <li class="page-item"><a class="page-link" href="#">5</a></li>
                <li class="page-item"><a class="page-link" href="#">></a></li>
            </ul>
        </div>
        <div class="col-lg-1"></div>
        <div class="col-lg-1"></div>
        <div class="col-lg-1"></div>
        <div class="col-lg-1"></div>
        <div class="col-lg-1"></div>

    </div>




    <!-- footer -->
    <div class="jumbotron mt-5 mb-0">
        <div class="container text-center ">
            <h3 class="text-secondary">유니 넷조</h3>
            <p>
                ㅈㅈㄱ Homepage is powered by <span class="text-primary">Uni4 Group project</span> / Designed by <span
                    class="text-primary">Uni4 Group project</span>
            </p>
        </div>
    </div>
</body>
</html>