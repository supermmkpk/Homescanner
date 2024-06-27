<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!--  헤더 start -->
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!--  헤더 end -->


<script>
	window.onload = function() {
		initControl();
	}

	function initControl() {

	}

	function isEmpty(value) {
		if (value === '' || value === null || value === undefined)
			return true;
		return false;
	}
</script>
<script type="text/javascript" src="${root}/resource/js/login.js"></script>
<body>
	<!-- 상단 navbar start -->
	<%@ include file="/WEB-INF/views/common/topNav.jsp"%>
	<!-- 상단 navbar end -->


	<main class="main">
		<section class="noticeForm">
			<h4>공지사항</h4>

			<div class="container" style="text-align: left">
				<div class="mb-3">
					<label for="title" class="form-label">글 제목</label> 
					<input
						type="text" class="form-control" id="title" name="title"
						value="${notice.title}" disabled>
				</div>
				<div class="mb-3">
					<label for="content" class="form-label">글 내용</label>
					<div
						style="border: 1px solid #dfe3e7; border-radius: 4px; padding: 8px; min-height: 160px; overflow: auto;">${notice.contents}</div>
					</div>

					<div class="d-grid mt-5">
						<c:if test="${sessionScope.userId == 'admin'}">
							<button type="button" class="btn btn-lg"
								style="background-color: #FF6D5A; color: white; border: none;"
								onclick="location.href='${root}/notice/modifyNotice?id=${notice.id}';">수정하기</button>
						</c:if>
						<button class="btn btn-secondary btn-lg mt-2"
							onclick="location.href='${root}/notice/getNotices';">목록</button>
					</div>

			</div>

		</section>

	</main>

	<!-- 하단 footer start -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	<!-- 하단 footer end -->

	<!-- 로그인 모달 창 start-->
	<%@ include file="/WEB-INF/views/common/loginModal.jsp"%>
	<!-- 로그인 모달 창 end -->

	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>
</html>