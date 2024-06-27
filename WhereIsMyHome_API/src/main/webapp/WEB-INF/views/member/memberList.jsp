<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>

<!--  헤더 start -->	
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!--  헤더 end -->	
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
<script type="text/javascript" src="${root}/resource/js/login.js"></script>
<script>
	  console.log('${sessionScope.userId}');
	  if('${sessionScope.userId}' == null || '${sessionScope.userId}' != 'admin') {
	  	alert("관리자만 접근 가능한 메뉴입니다.");
	  	location.href="${root}/";
	  }
  </script>
<body>
  <!-- 상단 navbar start -->
  <%@ include file="/WEB-INF/views/common/topNav.jsp" %>
  <!-- 상단 navbar end -->
  
  
  <main class="col-xl-10 offset-xl-1 mt-6 mb-6">
  	<div class="member-edit-title-box text-center mb-3">
			<h2>회원 정보 목록</h2>
	</div>
  	
	<table class="table table-hover text-center">
		<tr>
			<th>유저 아이디</th>
			<th>유저 이메일</th>
			<th>유저 이름</th>
			<th>유저 폰 번호</th>
			<th>유저 집 주소</th>
		</tr>
		<tbody>
			<c:if test="${empty members}">
				<tr>
					<td colspan="4">등록된 글이 없습니다.</td>
				</tr>
			</c:if>
		
			<c:if test="${!empty members}">
				<c:forEach var="member" items="${members}">
					<tr onclick="location.href='${root}/member/admin/detail?userId=${member.userId}';" >
						<td>${member.userId}</td>
						<td>${member.userEmail}</td>
						<td>${member.userName}</td>
						<td>${member.userMobile}</td>
						<td>${member.userAddress}</td>
					</tr>
				</c:forEach>
			</c:if>

		</tbody>
	</table>
	
	</main>


  <!-- 로그인 모달 창 start-->
  <%@ include file="/WEB-INF/views/common/loginModal.jsp" %>
  <!-- 로그인 모달 창 end -->
  
  <!-- 하단 footer start -->
  <%@ include file="/WEB-INF/views/common/footer.jsp" %>
  <!-- 하단 footer end -->
</body>

</html>
