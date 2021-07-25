<%@page import="database.BoardcDao"%>
<%@page import="database.BoardcDto"%>
<%@page import="database.Add_fileDao"%>
<%@page import="database.BoardDto"%>
<%@page import="database.BoardDao"%>
<%@page import="database.MarketBoardDao"%>
<%@page import= "database.MemberDao" %>
<%@page import= "database.MemberDto" %>
<%@page import="database.CommentDao"%>
<%@page import="database.CommentDto"%>

<%@page import="java.util.stream.Collectors"%>
<%@page import="java.util.*"%>
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

	<script type="text/javascript">
	function guest_rep_onclick_codelete(action, id, m_id) {
		var s = id;
		var a = action;
		var m = m_id;
		var result = confirm("정말 삭제하시겠습니까 ?");
		if (result) {
			var url = 'BoardC_product_update_delete.jsp?action=' + encodeURI(a)
					+ '&id=' + encodeURI(s) + '&m_id=' + encodeURI(m);
			window.location.href = url;
		}
	}
	function guest_rep_onclick_coedit(action, id,m_id) {
		var s = id;
		var a = action;
		var m = m_id;
		window.open("BoardC_product_updateform.jsp?action=" + encodeURI(a)
				+ "&id=" + encodeURI(s)+ '&m_id=' + encodeURI(m), "댓글수정",
				"width=400, height=300, left=100, top=50");
		//window.location.href = url; 
	}
	</script>
	
	
	
	<%
	String pageNum = request.getParameter("pageNum");
	String pageState = request.getParameter("pageBlock");
	int currentPage = 1;
	if(pageNum != null)
		currentPage = Integer.parseInt(pageNum);
	int pageDisplayNum = 5;

	int startNum = currentPage;
	
	if(pageState == null){}
	else if(pageState.equals("Next"))	startNum += 1;
	else if(pageState.equals("Previous"))	startNum = (startNum<=1)? 1:startNum-1;
	%>




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
		<div id="carouselExampleControls"
			class="col-lg-10 carousel slide text-center w-100"
			data-ride="Carousel">

			<div class="carousel-inner">
				<div class="carousel-item active ">
					<img src="./image/배너%20수정본/배너1.png" alt="First slide" class="w-100">
				</div>
				<div class="carousel-item">
					<img src="./image/배너%20수정본/배너2.png" alt="Second slide"
						class="w-100">
				</div>
				<div class="carousel-item">
					<img src="./image/배너%20수정본/배너3.jpg" alt="Third slide" class="w-100">
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleControls"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleControls"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
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
                <li><a href="#" class="navbar-link text-dark">팝니다</a></li>
                <li>|</li>
                <li><a href="#" class="navbar-link text-dark">삽니다</a></li>
            </ul>
        </div>
        <div class="col-lg-1">
        </div>
     </div>   

		<!-- 공백구역 -->
        <div class="row">
            <div class="col-lg-1">
            </div>
            <div class="col-lg-1">
            </div>
            <div class="col-lg-8">
                <br>
            </div>
            <div class="col-lg-1">
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
                <br>
            </div>
            <div class="col-lg-1">
            </div>
            <div class="col-lg-1">
            </div>
        </div>

        <!-- 거래,질문 구역 header -->
        <div class="row">
            <div class="col-lg-1">
            </div>
            <div class="col-lg-1">
            </div>
            <div class="col-lg-8">
                <h3><b>상세 내용</b></h3>
            </div>
            <div class="col-lg-1">
            </div>
            <div class="col-lg-1">
            </div>
        </div>
        <%
			int market_id = Integer.parseInt(request.getParameter("Market_id"));
			BoardcDao boardcDao = new BoardcDao();
			BoardcDto boardcDto = boardcDao.getDto(market_id);
			Add_fileDao add_fileDao = new Add_fileDao();
			MemberDao memberDao = new MemberDao();
			MemberDto memberDto = memberDao.getUserInfo(boardcDto.getMember_Id());
			
			if(userid != null)
			if(group == 5 || userid.equals(boardcDto.getMember_Id())) {
			
		%>
       
        <div class="row">
            <div class="col-lg-1">
            </div>
            <div class="col-lg-1">
            
            </div>
            <div class="col-lg-8">
            	<%
            		if(group != 5){
            	%>
            	<a href="BoardC_delete_action.jsp?market_id=<%= market_id%>" class="btn btn-primary card text-white bg-dark" style="float: right;">삭제</a>
                <a href="BoardC_update.jsp?market_id=<%= market_id %>" class="btn btn-primary card text-white bg-dark" style="float: right;">수정</a>
                <%
				} else {
                %>
                <a href="BoardC_delete_action.jsp?market_id=<%= market_id%>" class="btn btn-primary card text-white bg-dark" style="float: right;">삭제</a>
				<%
				}
				%>
            </div>
            <div class="col-lg-1">
            </div>
            <div class="col-lg-1">
            </div>
        </div>
        <%
        }
        %>
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

	<!--카드 텍스트-->
    <div class="row">
        <div class="col-lg-1">
        </div>
        <div class="col-lg-1">
        </div>
        
        <div class="col-lg-8">
            <div class="card">
                <div class="card-body">
                    <div class="row no-gutters">
                        <div class="col-4 w-80%">
                            <img src="./upload/<%=add_fileDao.getDto(boardcDto.getBoard_Id()).getFile_name()%>"
                                alt="이미지" class="card-img" />
                        </div>
                        <div class="col-8">
                            <div class="card-body text-center">
                                <h5 class="card-title"><%=boardcDto.getBoard_Title() %></h5>
                                <p class="card-text"><%=boardcDto.getMarket_Name() %> </p>
                                <p class="card-text">가격: <%=boardcDto.getMarket_Price() %>원</p>
                                <p class="card-text">판매자: <%=boardcDto.getMember_Id() %></p>
                                <p class="card-text">번호: 0<%= memberDto.getMember_phone() %></p>
                                <p class="card-text">지역: <%=boardcDto.getMarket_Addr() %></p>
                                <p class="card-text"><%=boardcDto.getBoard_Content() %></p>
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

	<%!
	BoardDto boardDto;
	MemberDto memberDto;
	MemberDao m_dao = new MemberDao();

	CommentDao commentDao = new CommentDao();
	List<CommentDto> arrayList2 = new ArrayList<>();
	CommentDto CommentDto;
	%>
	


					<!-- 글 시작 -->
								<!-- 댓글 시작 -->
								<%
							arrayList2 = commentDao.getList(boardcDto.getBoard_Id());
							for(int a = 0; a < arrayList2.size(); a++){ 
								if(arrayList2.size() < a) break;
									CommentDto = arrayList2.get(a);%>

							<div class="row">
								<div class="col-lg-1"></div>
								<div class="col-lg-1"></div>
								<div class="col-lg-8">
									<ul class="list-group">
										<li id="guest_rep_id" class="list-group-item">
											<div class="guest_rep_class">
												<strong><%=CommentDto.getComment_name()%></strong> <small><%=CommentDto.getComment_regdate() %></small>
												<span class="control"> 
												<%
								String c_id = (String)session.getAttribute("userID");
								int c_uid = 0;
								if(c_id != null){
									c_uid = m_dao.getMemberUid(c_id);
								}
								if (CommentDto.getMember_uid() == c_uid){ %> 
								<a href="#"	onclick="guest_rep_onclick_coedit('edit','<%=CommentDto.getComment_id()%>','<%=boardcDto.getMarket_Id() %>')"
													class="btn btn-default btn-xs"> <span>수정</span></a> 
													<a
													href="#"
													onclick="guest_rep_onclick_codelete('delete','<%=CommentDto.getComment_id()%>','<%=boardcDto.getMarket_Id() %>')"
													class="btn btn-default btn-xs"><span>삭제</span></a>
													 <%} %>
												</span>
												<p><%=CommentDto.getComment_content() %></p>
											</div>
										</li>
									</ul>
								</div>
								<div class="col-lg-1"></div>
								<div class="col-lg-1"></div>
							</div>
							<br>
							
						<% } %><!-- 댓글 끝 -->

	<div class="row">
		<br>
	</div>
	<% 
	String id = (String)session.getAttribute("userID");
	if(id != null){
	%>
	<div class="row">
		<div class="col-lg-1"></div>
		<div class="col-lg-1"></div>
		<div class="col-lg-8">
			<form action="BoardC_product_process.jsp" method="post">
			<input type= "hidden" name = "id" value= "<%=boardcDto.getBoard_Id() %>">
			<input type= "hidden" name = "m_id" value= "<%=boardcDto.getMarket_Id() %>">
				<textarea name="BoardC_product_Contents" class="form-control"
					style="resize: none;" placeholder="내용을 입력하세요"></textarea>
				<p class="text-center"></p>
				<input type="submit" value="등록" class="btn btn-default submit" />
			</form>
		</div>
		<div class="col-lg-1"></div>
		<div class="col-lg-1"></div>
	</div>
<% } %>

	<div class="row">
		<div class="col-lg-1"></div>
		<div class="col-lg-1"></div>
		<div class="col-lg-8"></div>
		<div class="col-lg-1"></div>
		<div class="col-lg-1"></div>
	</div>

	 <div class="row">
            <div class="col-lg-1"></div>
            <div class="col-lg-1"></div>
            <div class="col-lg-8">
                <nav style="text-align: center;">
                    <ul class="pagination">
                        <li >
                            <a href="./BoardB_M.jsp?pageBlock=Previous&pageNum=<%=currentPage%>" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <%for(int i = 0; i < pageDisplayNum ; i++){ %>
                        <% if((startNum + i) == currentPage){%>
                        <li class="page-item active"><a href="./BoardC_product.jsp?pageNum=<%=startNum + i%>"><%=startNum + i%></a></li>
						<%}
                        else{%>
                        <li class= "page-item"><a href="./BoardC_product.jsp?pageNum=<%=startNum + i%>"><%=startNum + i%></a></li>	
                        <% } 
                        } %>

                        <li>
                            <a href="./BoardC_product.jsp?pageBlock=Next" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                            
                        </li>
                    </ul>
                </nav>
            </div>
            <div class="col-lg-1"></div>
            <div class="col-lg-1"></div>
        </div>

	<div class="row">
		<div class="col-lg-1"></div>
		<div class="col-lg-10">
			<hr>
		</div>
		<div class="col-lg-1"></div>
	</div>




    <%@include file="./footer.jsp" %>
</body>

</html>