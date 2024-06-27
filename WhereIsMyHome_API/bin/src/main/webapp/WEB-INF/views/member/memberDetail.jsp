<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!--  헤더 start -->
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!--  헤더 end -->

<script src="${root}/resource/js/login.js"></script>

<body>
	<!-- 상단 navbar start -->
	<%@ include file="/WEB-INF/views/common/topNav.jsp"%>
	<!-- 상단 navbar end -->


	<main class="main col-xl-10 offset-xl-1">
		<div class="member-edit-title-box text-center mb-3">
			<h4 class="member-edit-title">사용자 정보</h4>
		</div>

		<div class="member-info-box">

			<form id="editMemberInfoForm">
				<table class="member-info-table">
					<tr>
						<th>아이디</th>
						<td>
							<p id="userId">${memberDto.userId}</p>
						</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>${memberDto.userEmail}</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>${memberDto.userName}</td>
					</tr>
					<tr>
						<th>주소</th>
						<td>${memberDto.userAddress}</td>
					</tr>
					<tr>
						<th>핸드폰번호</th>
						<td>${memberDto.userMobile}</td>
					</tr>
				</table>
			</form>
			<div class="d-grid gap-2">
				<button class="btn btn-secondary btn-lg mt-5"
					onclick="history.back()" style="padding: 1rem 1rem;">목록</button>
			</div>
		</div>
	</main>
	<!-- 하단 footer start -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	<!-- 하단 footer end -->

	<!-- 로그인 모달 창 start-->
	<%@ include file="/WEB-INF/views/common/loginModal.jsp"%>
	<!-- 로그인 모달 창 end -->

	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>
</html>