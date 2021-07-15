<%@ page language="java" contentType="text/html; charset=UTF-8"%>


<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
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

<title>중고거래 글등록 페이지</title>
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


        <!-- hr 줄 구역 -->
        <div class="row">
            <div class="col-lg-1">
            </div>
            <div class="col-lg-10">
                <hr>
            </div>
            <div class="col-lg-1">
            </div>
        </div>

        <!-- 공백 -->
        <div class="row">
            <div class="col-lg-1"></div>
            <div class="col-lg-1"></div>
            <div class="col-lg-8">
                <br>
            </div>
            <div class="col-lg-1"></div>
            <div class="col-lg-1"></div>
        </div>

        <!-- 공백 -->
        <div class="row">
            <div class="col-lg-1"></div>
            <div class="col-lg-1"></div>
            <div class="col-lg-8">
                <br>
            </div>
            <div class="col-lg-1"></div>
            <div class="col-lg-1"></div>
        </div>

        <!-- 게시글 등록 ! -->
        <div class="row">
            <div class="col-lg-1"></div>
            <div class="col-lg-1"></div>
            <div class="col-lg-8">
                <h3>게시글 등록</h3><br>
            </div>
            <div class="col-lg-1"></div>
            <div class="col-lg-1"></div>
        </div>


        <!-- 팝,삽니다 /지역 카테고리 -->
        <div class="row">
            <div class="col-lg-1"></div>
            <div class="col-lg-1"></div>
            <div class="col-lg-8">
                <div class="select-box select-script">
                    <select id="selectbox" title="kategorie" name="BoardC_write_kategorie">
                        <option selected disabled hidden>선택</option>
                        <option>삽니다</option>
                        <option>팝니다</option>
                    </select>
                    
                    <select id="selectbox" title="constituency" name="BoardC_write_constituency">
                        <option selected="selected">지역</option>
                        <option>김포</option>
                        <option>서울</option>
                        <option>인천</option>
                        <option>부산</option>
                        <option>제주도</option>
                    </select>
                </div>
            </div>
            <div class="col-lg-1"></div>
            <div class="col-lg-1"></div>
        </div>
        
    

        <!-- 공백 -->
        <div class="row">
            <div class="col-lg-1"></div>
            <div class="col-lg-1"></div>
            <div class="col-lg-8">
                <br>
            </div>
            <div class="col-lg-1"></div>
            <div class="col-lg-1"></div>
        </div>



        <!-- 제목 텍스트 구역 -->
        <div class="row">
            <div class="col-lg-1"></div>
            <div class="col-lg-1"></div>
            <div class="col-lg-8">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="제목" id="title" name="BoardC_write_title_header">
                </div>
            </div>
            <div class="col-lg-1"></div>
            <div class="col-lg-1"></div>
        </div>

        <!-- 가격 텍스트 구역 -->
        <div class="row">
            <div class="col-lg-1"></div>
            <div class="col-lg-1"></div>
            <div class="col-lg-8">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="가격" id="price" name="BoardC_write_price">
                </div>
            </div>
            <div class="col-lg-1"></div>
            <div class="col-lg-1"></div>
        </div>



        <!-- 파일 업로드 구역 -->
        <div class="row">
            <div class="col-lg-1"></div>
            <div class="col-lg-1"></div>
            <div class="col-lg-8">
                <div class="form-group">
                    <input type="file" class="form-control-file" id="exampleFormControlFile1" neme="file_upload">
                </div>
            </div>
            <div class="col-lg-1"></div>
            <div class="col-lg-1"></div>
        </div>

        <!-- 상세 텍스트 구역 -->
        <div class="row">
            <div class="col-lg-1"></div>
            <div class="col-lg-1"></div>
            <div class="col-lg-8">
                <div class="form-group">
                    <textarea type="text" class="form-control" rows="20" placeholder="글 양식입니다.
                    &#13;&#10;이름:&#13;&#10;&#13;&#10;가격:&#13;&#10;&#13;&#10;번호:&#13;&#10;&#13;&#10;지역:&#13;&#10;&#13;&#10;내용:&#13;&#10;&#13;&#10;*양식에 맞추어 작성 해주세요*." id="content" name="BoardC_write_content"></textarea>
                </div>
                <button type="submit" class="btn btn-primary" style="float: right;">등록</button>
            </div>
            <div class="col-lg-1"></div>
            <div class="col-lg-1"></div>
        </div>

        <!-- 공백 -->
        <div class="row">
            <div class="col-lg-1"></div>
            <div class="col-lg-1"></div>
            <div class="col-lg-8">
                <br>
            </div>
            <div class="col-lg-1"></div>
            <div class="col-lg-1"></div>
        </div>

        <!-- 공백 -->
        <div class="row">
            <div class="col-lg-1"></div>
            <div class="col-lg-1"></div>
            <div class="col-lg-8">
                <br>
            </div>
            <div class="col-lg-1"></div>
            <div class="col-lg-1"></div>
        </div>

        <!-- 공백 -->
        <div class="row">
            <div class="col-lg-1"></div>
            <div class="col-lg-1"></div>
            <div class="col-lg-8">
                <br>
            </div>
            <div class="col-lg-1"></div>
            <div class="col-lg-1"></div>
        </div>


        <!--hr-->
        <div class="row">
            <div class="col-lg-1"></div>
            <div class="col-lg-1"></div>
            <div class="col-lg-8">
                <hr>
            </div>
            <div class="col-lg-1"></div>
            <div class="col-lg-1"></div>
        </div>

	<!-- js -->
        <script>
            $('.carousel').carousel({
                interval: 10000
            })

            $(document).ready(function () {
                var select = $('.select-script select');
                select.change(function () {
                    var select_name = $(this).children('option:selected').text();
                    $(this).siblings("label").text(select_name);
                });
            });
		</script>
		
	<%@include file="./footer.jsp" %>
</body>
</html>