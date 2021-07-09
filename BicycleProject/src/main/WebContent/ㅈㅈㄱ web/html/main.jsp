<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>동행하는 사람들...</title>
    <style>
        .prpl {
            padding-left: 20px;
            padding-right: 20px;
        }

        .footer {
            background-color: cornsilk;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous">
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous">
    </script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous">
    </script>
    <link rel="stylesheet" href="./css/bootstrap4.0.0.css">
</head>
<body>

 <%@include file="./header.jsp" %>

    <!-- 공지사항 -->
    <div class="row">
        <div class="col-lg-1">
        </div>
        <div class="col-lg-10">
            <h3>공지사항</h3>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Atque itaque sapiente alias eius quas,
                officiis cum impedit blanditiis commodi, suscipit facere tempore sunt. Esse, totam saepe illo
                delectus aut enim!  내일 10시 집합!</p>
        </div>
        <div class="col-lg-1">
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


    <div class="row">
        <div class="col-lg-1">
        </div>

        <!-- 인기글 목록 -->
        <div class="col-lg-5">
            <div class="panel panel-info">
                <!-- Default panel contents -->
                <div class="panel-heading">인기글</div>

                <!-- Table -->
                <table class="table table-hover table-striped table-condensed ">
                    <tr>
                        <th>1등</th>
                    </tr>
                    <tr>
                        <th>2등</th>
                    </tr>
                    <tr>
                        <th>3등</th>
                    </tr>
                    <tr>
                        <th>4등</th>
                    </tr>
                    <tr>
                        <th>5등</th>
                    </tr>
                </table>
            </div>
        </div>

        <!-- 챌린지 그래프 -->
        <div class="col-lg-5">
            <div class="panel panel-info">
                <!-- Default panel contents -->
                <div class="panel-heading">챌린지</div>

                <!-- Table -->
                <table class="table table-hover table-striped table-condensed ">
                    <tr>
                        <th>1등</th>
                    </tr>
                    <tr>
                        <th>2등</th>
                    </tr>
                    <tr>
                        <th>3등</th>
                    </tr>
                    <tr>
                        <th>4등</th>
                    </tr>
                    <tr>
                        <th>5등</th>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <div class="col-lg-1">
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


    <!-- 배너 타이틀 -->
    <div class="row">
        <div class="col-lg-1">
        </div>
        <div id="carouselExampleControls" class="col-lg-10 carousel slide text-center w-100" data-ride="Carousel">

            <div class="carousel-inner">
                <div class="carousel-item active ">
                    <img src="./image/배너%20수정본/배너%20복사본.png" alt="First slide" class="w-100">
                </div>
                <div class="carousel-item">
                    <img src="./image/배너%20수정본/배너%20복사본.png" alt="Second slide" class="w-100">
                </div>
                <div class="carousel-item">
                    <img src="./image/배너%20수정본/배너%20복사본.png" alt="Third slide" class="w-100">
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span> </a>
            <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span> </a>
        </div>


        <div class="col-lg-1">
        </div>
    </div>



    <!-- 배너 -->
    <div class="row">
        <div class="col-lg-1">
        </div>
        <div class="col-lg-3">
        </div>
        <div class="col-lg-4">

        </div>
        <div class="col-lg-3">
        </div>
        <div class="col-lg-1">
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

    <!-- 거래,질문 구역 header -->
    <div class="row">
        <div class="col-lg-1">
        </div>
        <div class="col-lg-6 mb-4">
            <h3>거래 게시판</h3>
        </div>
        <div class="col-lg-4 mb-4">
            <h3>질문 게시판</h3>
        </div>
        <div class="col-lg-1">
        </div>
    </div>

    <!-- 중고거래 썸네일 -->
    <div class="row">
        <div class="col-lg-1">
        </div>
        <div class="col-lg-2">
            <div class="card" style="width: 15rem;">
                <img class="card-img-top" src="./image/테스트 이미지 4칸.png" alt="Card image cap">
                <div class="card-body">
                    <p class="card-text">2021-7-25(글생성날짜)</p>
                    <h5 class="card-title">팝니다.(머리말)</h5>
                    <p class="card-text">삼천리 자전거 팝니다(글제목)</p>
                    <p class="card-text text-danger">거래중(미구현 예상)</p>
                    <p class="card-text">320000원</p>
                    <a href="#" class="btn btn-primary card text-white bg-dark">둘러보기</a>
                </div>
            </div>
            <br>
            <div class="card" style="width: 15rem;">
                <img class="card-img-top" src="./image/테스트 이미지 4칸.png"" alt="Card image cap">
                <div class="card-body">
                    <h5 class="card-title">안사요</h5>
                    <p class="card-text">드럽게 비싸네</p>
                    
                    <a href="#" class="btn btn-primary card text-white bg-dark">둘러보기</a>
                </div>
            </div>
        </div>

        <div class="col-lg-2">

            <div class="card" style="width: 15rem;">
                <img class="card-img-top" src="./image/테스트 이미지 4칸.png" alt="Card image cap">
                <div class="card-body">
                    <h5 class="card-title">빡빡이</h5>
                    <p class="card-text">맨질맨질</p>
                    <a href="#" class="btn btn-primary card text-white bg-dark">둘러보기</a>
                </div>
            </div>
            <br>
            <div class="card" style="width: 15rem;">
                <img class="card-img-top" src="./image/테스트 이미지 4칸.png"" alt="Card image cap">
                <div class="card-body">
                    <h5 class="card-title">오렌지</h5>
                    <p class="card-text">주황껍질</p>
                    <a href="#" class="btn btn-primary card text-white bg-dark">둘러보기</a>
                </div>
            </div>
        </div>

        <div class="col-lg-2">
            <div class="card" style="width: 15rem;">
                <img class="card-img-top" src="./image/테스트 이미지 4칸.png" alt="Card image cap">
                <div class="card-body">
                    <h5 class="card-title">바나나</h5>
                    <p class="card-text">노란껍질</p>
                    <a href="#" class="btn btn-primary card text-white bg-dark">둘러보기</a>
                </div>
            </div>
            <br>
            <div class="card" style="width: 15rem;">
                <img class="card-img-top" src="./image/테스트 이미지 4칸.png" alt="Card image cap">
                <div class="card-body">
                    <h5 class="card-title">참외</h5>
                    <p class="card-text">노란껍질 하양줄무늬</p>
                    <a href="#" class="btn btn-primary card text-white bg-dark">둘러보기</a>
                </div>
            </div>
        </div>

        <div class="col-lg-3">
            <br>
            <p style="color:blue">ㅁ자래ㅔ머ㅐㅔㅈㄹ마내ㅔ라매ㅔㅈ라ㅐㅔㅁ잘매ㅔㄴ</p>
            <p>동햄루과 백두만ㅇㅁ너아ㅣ므재랴므쟈ㅐㅔ름냐ㅐㄹ므르먀ㅡㄴ랴먀ㅐ럼나름쟈ㅐㅔ름ㄴㅇ래ㅑㅑㄹ먄럄ㄴ러ㅐㅑㅓㅁ낼머ㅑㅐㄴ랴ㅐㅁㄴㄹ</p>
            <br>
            <p style="color:blue">질문2</p>
            <p>굴렁굴렁</p>
            <br>
            <p style="color:blue">질문3</p>
            <p>홀리몰리</p>
            <br>
            <p style="color:blue">질문4</p>
            <p>홀짝홀짝</p>
            <br>
        </div>
        <div class="col-lg-1">
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





 <%@include file="./footer.jsp" %>
</body>
</html>
