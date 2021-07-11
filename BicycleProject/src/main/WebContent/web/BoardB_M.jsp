<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="./css/bootstrap4.0.0.css">

</head>
<body>
 <%@include file="./header.jsp" %>
<div class="row">
		<div class="col-lg-1"></div>
		<div class="col-lg-7"></div>
		<div class="col-lg-3">
			<ul class="nav nav-pills justify-content-around display-5">
				<li><a href="#" class="navbar-link text-dark">질문게시판</a></li>
				<li>|</li>
				<li><a href="#" class="navbar-link text-dark">자유게시판</a></li>
				<li>|</li>
				<li><a href="#" class="navbar-link text-dark">모이자!</a></li>
			</ul>
		</div>
	</div>

	<div class="row">
		<br>
	</div>

	<div class="row">
		<div class="col-lg-1"></div>
		<div class="col-lg-10">
			<div class="guestList">
				<ol class="list-group">
					<li id="guest_rep_id" class="list-group-item">
						<div class="guest_rep_class">
							<strong>댕댕이</strong> <small> (작성 날짜 및 시간)</small> <span
								class="control"> <a href="#"
								onclick="guest_rep_onclick_edit" class="btn btn-default btn-xs">&nbsp;<span>수정</span></a>
								<a href="#" onclick="guest_rep_onclick_delete"
								class="btn btn-default btn-xs">&nbsp;<span>삭제</span></a> <a
								href="#" onclick="guest_rep_onclick_reply"
								class="btn btn-default btn-xs">&nbsp;<span>리플</span></a>
							</span>
							<div class="row">
								<div class="col-lg-1">
									<img src="./img/dog.jpg" alt="..." class="img-thumbnail"
										width="80" height="50">
								</div>
								<div class="col-lg-8">
									<p>나는 댕댕이다</p>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-1"></div>
								<div class="col-lg-10">
									<ul class="list-group">
										<li id="guest_rep_id]" class="list-group-item">
											<div class="guest_rep_class">
												<strong>내옹이</strong> <small>(리플 단 날짜 및 시간)</small> <span
													class="control"> <a href="#"
													onclick="guest_rep_onclick_edit"
													class="btn btn-default btn-xs">&nbsp;<span>수정</span></a> <a
													href="#" onclick="guest_rep_onclick_delete"
													class="btn btn-default btn-xs">&nbsp;<span>삭제</span></a>
												</span>
												<p>나는 내옹이다</p>
											</div>
										</li>
									</ul>
								</div>
								<div class="col-lg-1"></div>
							</div>
						</div> <br>
					<br>
						<div class="guest_rep_class">
							<strong>뚱이</strong> <small> (작성 날짜 및 시간)</small> <span
								class="control"> <a href="#"
								onclick="guest_rep_onclick_edit" class="btn btn-default btn-xs">&nbsp;<span>수정</span></a>
								<a href="#" onclick="guest_rep_onclick_delete"
								class="btn btn-default btn-xs">&nbsp;<span>삭제</span></a> <a
								href="#" onclick="guest_rep_onclick_reply"
								class="btn btn-default btn-xs">&nbsp;<span>리플</span></a>
							</span>
							<div class="row">
								<div class="col-lg-1">
									<img src="./img/뚱이.jpg" alt="..." class="img-thumbnail"
										width="80" height="50">
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
													class="control"> <a href="#"
													onclick="guest_rep_onclick_edit"
													class="btn btn-default btn-xs">&nbsp;<span>수정</span></a> <a
													href="#" onclick="guest_rep_onclick_delete"
													class="btn btn-default btn-xs">&nbsp;<span>삭제</span></a>
												</span>
												<p>뚱아~~~~~~</p>
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
								<p class="text-center"></p>
								<input type="submit" value="등록" onclick="guest_onclick_submit">
							</div>
							<div class="col-lg-1"></div>
						</div>
					</li>
				</ol>
			</div>
		</div>
		<div class="col-lg-1"></div>
	</div>

	<div class="row">
		<br>
	</div>

	<div class="row">
		<div class="col-lg-1"></div>
		<div class="col-lg-10">
			<textarea class="form-control" style="resize: none;"
				placeholder="내용을 입력하세요"></textarea>
			<p class="text-center"></p>
			<input type="submit" value="등록" onclick="guest_onclick_submit"
				class="btn btn-default submit" />
		</div>
		<div class="col-lg-1"></div>
	</div>


	<div class="row">
		<div class="col-lg-1"></div>
		<div class="col-lg-10"></div>
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