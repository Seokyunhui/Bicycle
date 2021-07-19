<%@page import="database.Add_fileDao"%>
<%@page import="database.BoardDto"%>
<%@page import="database.MarketBoardDao"%>
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
    
<title>중고거래 상품 상세 페이지</title>


</head>
<body>
	<%@include file="./header.jsp" %>
	
	
	<!-- 배너 이미지 -->
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


        <!-- 공백 -->
        <div class="row">
            <div class="col-lg-1">
            </div>
            <div class="col-lg-10">
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

        <!-- 삽니다,팝니다 카테고리 -->

        <div class="row">
            <div class="col-lg-1">
            </div>
            <div class="col-lg-8 "></div>
            <div class="col-lg-2">
                <ul class="nav nav-pills justify-content-around display-8">
                    <li><a href="#" class="navbar-link text-dark">삽니다</a></li>
                    <li>|</li>
                    <li><a href="#" class="navbar-link text-dark">팝니다</a></li>
                </ul>
            </div>
            <div class="col-lg-1">
            </div>

            <!-- 공백 -->
            <div class="row">
                <div class="col-lg-1">
                </div>
                <div class="col-lg-10">
                </div>
                <div class="col-lg-1">
                </div>
            </div>

        </div>
        <!--공백-->
        <div class="row">
            <div class="col-lg-1">
            </div>
            <div class="col-lg-10">
                <br><br>
            </div>
            <div class="col-lg-1">
            </div>
        </div>

        <!--카드 텍스트-->
        <div class="row">
            <div class="col-lg-1">
            </div>
            <div class="col-lg-1">
            </div>
			<%
			int market_id = Integer.parseInt((String) request.getParameter("Market_id"));
			MarketBoardDao marketBoardDao = new MarketBoardDao();
			BoardDto boardDto = marketBoardDao.getDto(market_id);
			Add_fileDao add_fileDao = new Add_fileDao();
			add_fileDao.getDto(boardDto.getBoard_id()).getFile_dir();
			%>
            <div class="col-lg-8">
                <div class="card">
                    <div class="card-body">
                    <div class="row no-gutters">
                        <div class="col-4 w-80%">
                            <img src="d:/Bicycle/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/BicycleProject/upload/스크린샷(1)4.png" alt="이미지" class="card-img" />
                        </div>
                        <div class="col-8">
                            <div class="card-body text-center">
                                <h5 class="card-title"><%=boardDto.getBoard_title() %></h5>
                                <p class="card-text"><%=boardDto.getMarketName() %> </p>
                                <p class="card-text">가격: <%=boardDto.getMarketPrice() %>원</p>
                                <p class="card-text">판매자: <%=boardDto.getBoard_writer() %></p>
                                <p class="card-text">번호: 010-0000-0000</p>
                                <p class="card-text">지역: <%=boardDto.getMarketAddr() %></p>
                                <p class="card-text"><%=boardDto.getBoard_content() %></p>
                            </div>
                        </div>
                    </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-1">
            </div>
            <div class="col-lg-1">
            </div>
        </div>

        <!--상단 글 헤더-->
        <div class="row">
            <div class="col-lg-1">
            </div>
            <div class="col-lg-10">
                <br>
            </div>
            <div class="col-lg-1">
            </div>
        </div>

        <div class="row">
            <div class="col-lg-1">
            </div>
            <div class="col-lg-1">
            </div>
            <div class="col-lg-8">
                <div class="guestList">
                    <ol class="list-group">
                        <li id="guest_rep_id" class="list-group-item">
                            <div class="guest_rep_class">
                                <strong>스펀지밥</strong> <small>(작성 날짜 및 시간)</small> <span class="control"> <a href="#"
                                        onclick="guest_rep_onclick_edit"
                                        class="btn btn-default btn-xs">&nbsp;<span>수정</span></a>
                                    <a href="#" onclick="guest_rep_onclick_delete"
                                        class="btn btn-default btn-xs">&nbsp;<span>삭제</span></a> <a href="#"
                                        onclick="guest_rep_onclick_reply"
                                        class="btn btn-default btn-xs">&nbsp;<span>리플</span></a>
                                </span>
                                <div class="row">
                                    <div class="col-lg-1">
                                        <img src="./image/스펀지밥.png" alt="..." class="img-thumbnail" width="80"
                                            height="50">
                                    </div>
                                    <div class="col-lg-8">
                                        <p>스펀지에요~</p>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-1"></div>
                                    <div class="col-lg-10">
                                        <ul class="list-group">
                                            <li id="guest_rep_id]" class="list-group-item">
                                                <div class="guest_rep_class">
                                                    <strong>뚱이</strong> <small>(리플 단 날짜 및 시간)</small> <span
                                                        class="control"> <a href="#" onclick="guest_rep_onclick_edit"
                                                            class="btn btn-default btn-xs">&nbsp;<span>수정</span></a> <a
                                                            href="#" onclick="guest_rep_onclick_delete"
                                                            class="btn btn-default btn-xs">&nbsp;<span>삭제</span></a>
                                                    </span>
                                                    <p>스펀지밥~~ 놀자아~</p>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="col-lg-1"></div>
                                </div>
                            </div> <br>
                            <br>

                            <div class="guest_rep_class">
                                <strong>뚱이</strong> <small> (작성 날짜 및 시간)</small> <span class="control"> <a href="#"
                                        onclick="guest_rep_onclick_edit"
                                        class="btn btn-default btn-xs">&nbsp;<span>수정</span></a>
                                    <a href="#" onclick="guest_rep_onclick_delete"
                                        class="btn btn-default btn-xs">&nbsp;<span>삭제</span></a> <a href="#"
                                        onclick="guest_rep_onclick_reply"
                                        class="btn btn-default btn-xs">&nbsp;<span>리플</span></a>
                                </span>
                                <div class="row">
                                    <div class="col-lg-1">
                                        <img src="./image/뚱이에요.png" alt="..." class="img-thumbnail" width="80"
                                            height="50">
                                    </div>
                                    <div class="col-lg-8">
                                        <p>사랑해요~ 뚱이예요!</p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-1"></div>
                                    <div class="col-lg-10">
                                        <ul class="list-group">
                                            <li id="guest_rep_id" class="list-group-item">
                                                <div class="guest_rep_class">
                                                    <strong>스펀지밥</strong> <small>(리플 단 날짜 및 시간)</small> <span
                                                        class="control"> <a href="#" onclick="guest_rep_onclick_edit"
                                                            class="btn btn-default btn-xs">&nbsp;<span>수정</span></a> <a
                                                            href="#" onclick="guest_rep_onclick_delete"
                                                            class="btn btn-default btn-xs">&nbsp;<span>삭제</span></a>
                                                    </span>
                                                    <p>뚱아~~~~~~ 놀자아~~</p>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="col-lg-1"></div>
                                </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-lg-1"></div>
                                <div class="col-lg-10">
                                    <textarea class="form-control" style="resize: none;"
                                        placeholder="내용을 입력하세요"></textarea>

                                    <div style="float: right;">
                                        <input type="submit" value="등록" onclick="guest_onclick_submit">
                                    </div>
                                </div>
                                <div class="col-lg-1"></div>
                            </div>
                        </li>
                    </ol>
                </div>
            </div>
            <div class="col-lg-1"></div>
            <div class="col-lg-1"></div>
        </div>

        <div class="row">
            <br>
        </div>
        <!-- 공백 -->
        <div class="row">
            <div class="col-lg-1">
            </div>
            <div class="col-lg-10">
            </div>
            <div class="col-lg-1">
            </div>
        </div>
        <div class="row">
            <div class="col-lg-1">
            </div>
            <div class="col-lg-1">
            </div>
            <div class="col-lg-8">
                <textarea class="form-control" style="resize: none;" placeholder="내용을 입력하세요"></textarea>
                <br>
                <div class="col-lg-1" style="float: right;">
                    <input type="submit" value="등록" onclick="guest_onclick_submit" class="btn btn-default submit" />
                </div>
            </div>
            <div class="col-lg-1"></div>
        </div>
        <!-- 공백 -->
        <div class="row">
            <div class="col-lg-1">
            </div>
            <div class="col-lg-10">
                <br>
            </div>
            <div class="col-lg-1">
            </div>
        </div>

        <!-- 공백 -->
        <div class="row">
            <div class="col-lg-1"></div>
            <div class="col-lg-10"></div>
            <div class="col-lg-1"></div>
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