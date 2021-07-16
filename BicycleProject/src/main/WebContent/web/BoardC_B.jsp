<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/bootstrap4.0.0.css">
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
    
<title>삽니다</title>
</head>

<body>
	<%@include file="./header.jsp" %>
	
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


        <!-- 주카테고리 -->

        <div class="row ">
            <div class="col-lg-1">
            </div>
            <div class="col-lg-8 ">
            </div>
            <div class="col-lg-2">

                <ul class="nav nav-pills justify-content-around display-5">

                    <li><a href="BoardC_S.jsp" class="navbar-link text-dark">팝니다</a></li>
                    <li>|</li>
                    <li><a href="BoardC_B.jsp" class="navbar-link text-dark">삽니다</a></li>
                </ul>
            </div>
            <div class="col-lg-1">
            </div>
        </div>

        <!-- 공백구역 -->
        <div class="row">
            <div class="col-lg-1">
            </div>
            <div class="col-lg-10">
                <br>
            </div>
            <div class="col-lg-1">
            </div>
        </div>
        <!-- 공백구역 -->
        <div class="row">
            <div class="col-lg-1">
            </div>
            <div class="col-lg-10">
                <br>
            </div>
            <div class="col-lg-1">
            </div>
        </div>

        <!-- 거래,질문 구역 header -->
        <div class="row">
            <div class="col-lg-1">
            </div>
            <div class="col-lg-6 mb-4">
                <h3><b>중고거래 삽니다 게시판</b></h3>
            </div>
            <div class="col-lg-4 mb-4">

            </div>
            <div class="col-lg-1">
            </div>
        </div>
        
        <!-- 글 작성 버튼 -->
        <div class="row">
            <div class="col-lg-1">
            </div>
            
            <div class="col-lg-10">
                <a href="BoardC_write.jsp" class="btn btn-primary card text-white bg-dark" style="float: right;">작성</a>
            </div>
            
            <div class="col-lg-1">
            </div>
        </div>
        
        <!-- 공백구역 -->
        <div class="row">
            <div class="col-lg-1">
            </div>
            <div class="col-lg-10">
                <br>
            </div>
            <div class="col-lg-1">
            </div>
        </div>

        <!-- 중고거래 썸네일 -->
        <div class="row">
            <div class="col-lg-1">
            </div>
            <div class="col-lg-2 col-md-4">
                <div class="card text-center w-100" style="width: 15rem;">
                    <img class="card-img-top" src="./image/중고 자전거 1.jpg" alt="Card image cap">
                    <div class="card-body">
                        <p class="card-text">[삽니다]</p>
                        <p class="card-text">2021-7-25(글생성날짜)</p>
                        <h5 class="card-title ">(글제목)삼천리 자전거 삽니다</h5>
                        <p class="card-text">320000원</p>
                        <a href="BoardC_product.jsp" class="btn btn-primary card text-white bg-dark">상세내용</a>
                    </div>
                </div>
                <br>
                <div class="card text-center w-100" style="width: 15rem;">
                    <img class="card-img-top" src="./image/중고 자전거 2.jpg" alt="Card image cap">
                    <div class="card-body">
                        <p class="card-text">[삽니다]</p>
                        <p class="card-text">2021-7-25(글생성날짜)</p>
                        <h5 class="card-title ">(글제목)삼천리 자전거 삽니다</h5>
                        <p class="card-text">320000원</p>
                        <a href="BoardC_product.jsp" class="btn btn-primary card text-white bg-dark">상세내용</a>
                    </div>
                </div>
            </div>

            <div class="col-lg-2 col-md-4">

                <div class="card text-center w-100" style="width: 15rem;">
                    <img class="card-img-top" src="./image/중고 자전거 4.jpg" alt="Card image cap">
                    <div class="card-body">
                        <p class="card-text">[삽니다]</p>
                        <p class="card-text">2021-7-25(글생성날짜)</p>
                        <h5 class="card-title ">(글제목)삼천리 자전거 삽니다</h5>
                        <p class="card-text">320000원</p>
                        <a href="BoardC_product.jsp" class="btn btn-primary card text-white bg-dark">상세내용</a>
                    </div>
                </div>
                <br>
                <div class="card text-center w-100" style="width: 15rem;">
                    <img class="card-img-top" src="./image/중고 자전거 5.jpg" alt="Card image cap">
                    <div class="card-body">
                        <p class="card-text">[삽니다]</p>
                        <p class="card-text">2021-7-25(글생성날짜)</p>
                        <h5 class="card-title ">(글제목)삼천리 자전거 삽니다</h5>
                        <p class="card-text">320000원</p>
                        <a href="BoardC_product.jsp" class="btn btn-primary card text-white bg-dark">상세내용</a>
                    </div>
                </div>
            </div>

            <div class="col-lg-2 col-md-4">
                <div class="card text-center w-100" style="width: 15rem;">
                    <img class="card-img-top" src="./image/중고 자전거 6.jpg" alt="Card image cap">
                    <div class="card-body">
                        <p class="card-text">[삽니다]</p>
                        <p class="card-text">2021-7-25(글생성날짜)</p>
                        <h5 class="card-title ">(글제목)삼천리 자전거 삽니다</h5>
                        <p class="card-text">320000원</p>
                        <a href="BoardC_product.jsp" class="btn btn-primary card text-white bg-dark">상세내용</a>
                    </div>
                </div>
                <br>
                <div class="card text-center w-100" style="width: 15rem;">
                    <img class="card-img-top" src="./image/중고 자전거 2.jpg" alt="Card image cap">
                    <div class="card-body">
                        <p class="card-text">[삽니다]</p>
                        <p class="card-text">2021-7-25(글생성날짜)</p>
                        <h5 class="card-title ">(글제목)삼천리 자전거 삽니다</h5>
                        <p class="card-text">320000원</p>
                        <a href="BoardC_product.jsp" class="btn btn-primary card text-white bg-dark">상세내용</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-2 col-md-4">
                <div class="card text-center w-100" style="width: 15rem;">
                    <img class="card-img-top" src="./image/중고 자전거 6.jpg" alt="Card image cap">
                    <div class="card-body">
                        <p class="card-text">[삽니다]</p>
                        <p class="card-text">2021-7-25(글생성날짜)</p>
                        <h5 class="card-title ">(글제목)삼천리 자전거 삽니다</h5>
                        <p class="card-text">320000원</p>
                        <a href="BoardC_product.jsp" class="btn btn-primary card text-white bg-dark">상세내용</a>
                    </div>
                </div>
                <br>
                <div class="card text-center w-100" style="width: 15rem;">
                    <img class="card-img-top" src="./image/중고 자전거 2.jpg" alt="Card image cap">
                    <div class="card-body">
                        <p class="card-text">[삽니다]</p>
                        <p class="card-text">2021-7-25(글생성날짜)</p>
                        <h5 class="card-title ">(글제목)삼천리 자전거 삽니다</h5>
                        <p class="card-text">320000원</p>
                        <a href="BoardC_product.jsp" class="btn btn-primary card text-white bg-dark">상세내용</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-2 col-md-4">
                <div class="card text-center w-100" style="width: 15rem;">
                    <img class="card-img-top" src="./image/중고 자전거 6.jpg" alt="Card image cap">
                    <div class="card-body">
                        <p class="card-text">[삽니다]</p>
                        <p class="card-text">2021-7-25(글생성날짜)</p>
                        <h5 class="card-title ">(글제목)삼천리 자전거 삽니다</h5>
                        <p class="card-text">320000원</p>
                        <a href="BoardC_product.jsp" class="btn btn-primary card text-white bg-dark">상세내용</a>
                    </div>
                </div>
                <br>
                <div class="card text-center w-100" style="width: 15rem;">
                    <img class="card-img-top" src="./image/중고 자전거 2.jpg" alt="Card image cap">
                    <div class="card-body">
                        <p class="card-text">[삽니다]</p>
                        <p class="card-text">2021-7-25(글생성날짜)</p>
                        <h5 class="card-title ">(글제목)삼천리 자전거 삽니다</h5>
                        <p class="card-text">320000원</p>
                        <a href="BoardC_product.jsp" class="btn btn-primary card text-white bg-dark">상세내용</a>
                    </div>
                </div>
            </div>

            <div class="col-lg-2">

            </div>
            <div class="col-lg-1">
            </div>
        </div>

        <!--공백-->
        <div class="row">
            <div class="col-lg-1">
            </div>
            <div class="col-lg-10">
            </div>
            <div class="col-lg-1">
            </div>
        </div>
        <!--공백-->
        <div class="row">
            <div class="col-lg-1">
            </div>
            <div class="col-lg-10">
                <br> 
            </div>
            <div class="col-lg-1">
            </div>
        </div>

        <!--네이션구역-->
        <div class="row">
            <div class="col-lg-1">
            </div>
            <div class="col-lg-10">
                <nav style="text-align: center;">
                    <ul class="pagination">
                        <li>
                            <a href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <li><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li>
                            <a href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </nav>

            </div>
            <div class="col-lg-1">
            </div>
        </div>
        <!--hr-->
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