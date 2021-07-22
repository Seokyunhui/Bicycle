<%@page import="database.Add_fileDto"%>
<%@page import="database.Add_fileDao"%>
<%-- <%@page import="jdk.internal.net.http.ResponseBodyHandlers.FileDownloadBodyHandler"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="database.MarketBoardDao"%>
<%@page import="database.BoardDto"%>
<%@page import="database.BoardDao"%>

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
    <%


        if (session.getAttribute("userID") == null) {
        	
         %>                      
        	<script>alert('로그인이 필요합니다.'); window.history.back(); </script>
        <%
           
        }
    %>
</head>
<body>
	
	<%@include file="./header.jsp" %>

	<%
	int market_id = Integer.parseInt(request.getParameter("market_id"));
	BoardDao boardDao = new BoardDao();
	MarketBoardDao marketBoardDao = new MarketBoardDao();
	BoardDto boardDto = marketBoardDao.getDto(market_id);
	Add_fileDao add_fileDao = new Add_fileDao();
	Add_fileDto add_fileDto = add_fileDao.getDto(boardDto.getBoard_id());
	%>

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
                <h3>게시글 수정</h3><br>
            </div>
            <div class="col-lg-1"></div>
            <div class="col-lg-1"></div>
        </div>




		<form action="BoardC_update_action.jsp?market_id=<%= boardDto.getMarketId() %>" method="post" enctype="multipart/form-data">
		
        <!-- 팝,삽니다 /지역 카테고리 -->
        <div class="row">
            <div class="col-lg-1"></div>
            <div class="col-lg-1"></div>
            <div class="col-lg-8 form-group">
                <div class="select-box select-script">
                    <select id="selectbox"  name="board_category_sm" required >
                        <option selected><%=boardDto.getCategory_small() %></option>
                        <option value="삽니다">삽니다</option>
                        <option value="팝니다">팝니다</option>
                    </select>
                    
                    <select id="selectbox" name="market_board_addr" required >
                        <option selected="selected"><%=boardDto.getMarketAddr() %></option>
                        <option value="서울">서울</option>
                        <option value="경기도">경기도</option>
                        <option value="강원도">강원도</option>
                        <option value="경상도">경상도</option>
                        <option value="충청도">충청도</option>
                        <option value="전라도">전라도</option>
                    </select>
                    
                    <select id="selectbox" name="market_name" required >
                        <option selected="selected">종류</option>
                        <option value="자전거">자전거</option>
                        <option value="자전거헬멧">자전거헬멧</option>
                        <option value="자전거거치대">자전거거치대</option>
                        <option value="자전거가방">자전거가방</option>
                        <option value="자전거라이트">자전거라이트</option>
                        <option value="자전거펌프">자전거펌프</option>
                        <option value="자전거짐받이">자전거짐받이</option>
                        <option value="자전거벨">자전거벨</option>
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
                    <input type="text" class="form-control" placeholder="제목" name="board_title" value="<%= boardDto.getBoard_title() %>" required >
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
                    <input type="text" class="form-control" placeholder="가격" name="market_price" value="<%= boardDto.getMarketPrice() %>" required >
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
                	<label for="filename"><%=add_fileDto.getFile_name() %></label>
                    <input type="file" class="form-control-file" name="uploadFile" id="filename">                 
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
                    <textarea class="form-control" rows="20" placeholder="내용을 작성해주세요." maxlength="2048" style="height: 350px;" name="Board_content" required ><%= boardDto.getBoard_content()%></textarea>
                </div>
                <button type="submit" class="btn btn-primary" style="float: right;">글 수정</button>
            </div>
            <div class="col-lg-1"></div>
            <div class="col-lg-1"></div>
        </div>
		</form>
	
	
	
	
	
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
            
            <div class="col-lg-10">
                <hr>
            </div>
            
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