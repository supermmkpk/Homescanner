<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!--  헤더 start -->
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!--  헤더 end -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
<script type="text/javascript" src="resource/js/login.js"></script>
<body>
	<!-- 상단 navbar start -->
	<%@ include file="/WEB-INF/views/common/topNav.jsp"%>
	<!-- 상단 navbar end -->

	<main class="col-xl-10 offset-xl-1 mt-6 mb-6">
		<h2>공지사항</h2>
		<table class="table table-hover text-center">
			<tr>
				<th>글번호</th>
				<th>글제목</th>
				<th>작성자</th>
				<th>작성일자</th>
			</tr>
			<tbody>
				<c:if test="${empty notices}">
					<tr>
						<td colspan="4">등록된 글이 없습니다.</td>
					</tr>
				</c:if>

				<c:if test="${!empty notices}">
					<c:forEach var="notice" items="${notices}">
						<tr
							onclick='location.href="${root}/notice/detail?noticeId=${notice.id}";'>
							<td>${notice.id}</td>
							<td>${notice.title}</td>
							<td>${notice.regId}</td>
							<td>${notice.regTime}</td>
							<c:if test="${sessionScope.userId == 'admin'}">
								<td>
									<button type="button" id="deleteButton"
										class="btn btn-link link-danger"
										onclick="event.stopPropagation(); deleteItem('${notice.id}');">
										<i class="bi bi-trash"></i>
									</button>
									<form action="${root}/notice/delete" method="POST"
										id="deleteForm">
										<input type="hidden" name="id" value="${notice.id}">
									</form>
								</td>
							</c:if>
						</tr>
					</c:forEach>
				</c:if>

			</tbody>
		</table>

		<c:if test="${sessionScope.userId == 'admin'}">
			<div style="float: right">
				<button type="button"
					onclick="location.href='${root}/notice/mvWriteNotice'"
					style="background-color: #FF6D5A; color: white; border: none; border-radius: 4px; padding: 4px 8px;">공지사항
					생성</button>
			</div>
		</c:if>

	</main>


	<!-- 로그인 모달 창 start-->
	<%@ include file="/WEB-INF/views/common/loginModal.jsp"%>
	<!-- 로그인 모달 창 end -->

	<!-- 하단 footer start -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	<!-- 하단 footer end -->
</body>

<script>
	function deleteItem(no) {
		if (confirm(no + "번 글을 삭제하시겠습니까?")) {
			document.querySelector("#deleteForm").submit();
		}
	}
</script>
</html>
