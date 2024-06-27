<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<!--  헤더 start -->	
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!--  헤더 end -->	
<script type="text/javascript" src="resource/js/login.js"></script>

<body>
  <!-- 상단 navbar start -->
  <%@ include file="/WEB-INF/views/common/topNav.jsp" %>
  <!-- 상단 navbar end -->

	<main class="col-xl-10 offset-xl-1">
		<h2>${homeInfoDto.apartmentName}</h2>
		
		<div class="map_wrap m-2">
	      <div id="map" style="width:100%;height:100%; position:relative; overflow:hidden;"></div> 
	    </div>
	
		<table class="table ms-3">
			<thead>
				<tr>
				  <th scope="col">항목</th>
				  <th scope="col">정보</th>
				</tr>
			</thead>
			<tbody>
			   <tr>
					<td>계약일자</td>
					<td>${homeInfoDto. dealYear}년 ${homeInfoDto.dealMonth}월 ${homeInfoDto.dealDay}일</td>
				</tr>
				<tr>
					<td>등기일자</td>
					<c:choose>
						<c:when test="${empty homeInfoDto.registrationDate}">
							<td> - </td>
						</c:when>
						<c:when test="${homeInfoDto.registrationDate eq ''}">
							<td> - </td>
						</c:when>
						<c:otherwise>
							<td>${homeInfoDto.registrationDate}</td>
						</c:otherwise>
					</c:choose>
				</tr>
				<tr>
					<td>거래금액</td>
					<td>${homeInfoDto.dealAmount}만원</td>
				</tr>
				<tr>
					<td>건축년도</td>
					<td>${homeInfoDto.buildYear}년</td>
				</tr>
				<tr>
					<td>층</td>
					<td>${homeInfoDto.floor}층</td>
				</tr>
				<tr>
					<td>전용면적</td>
					<td>${homeInfoDto.exclusiveArea} m<sup>2</sup></td>
				</tr>
				<tr>
					<td>도로명</td>
					<td>${homeInfoDto.roadName}</td>
				</tr>
				<tr>
					<td>주소</td>
					<td>${homeInfoDto.dealerLocation} ${homeInfoDto.dong} ${homeInfoDto.jibun}</td>
				</tr>
			</tbody>
		</table>
		
		<c:if test="${!empty sessionScope.userId}">
			<div class="d-flex justify-content-start ms-3">
				<form action="${root}/homeLikes/add" method="POST">
					<input type="hidden" name="dealAmount" value="${homeInfoDto.dealAmount }">
					<input type="hidden" name="buildYear" value="${homeInfoDto.buildYear }">
					<input type="hidden" name="dealYear" value="${homeInfoDto.dealYear }">
					<input type="hidden" name="dealMonth" value="${homeInfoDto.dealMonth }">
					<input type="hidden" name="dealDay" value="${homeInfoDto.dealDay }">
					<input type="hidden" name="roadName" value="${homeInfoDto.roadName }">
					<input type="hidden" name="dong" value="${homeInfoDto.dong }">
					<input type="hidden" name="apartmentName" value="${homeInfoDto.apartmentName }">
					<input type="hidden" name="exclusiveArea" value="${homeInfoDto.exclusiveArea }">
					<input type="hidden" name="jibun" value="${homeInfoDto.jibun }">
					<input type="hidden" name="floor" value="${homeInfoDto.floor }">
					<input type="hidden" name="dealerLocation" value="${homeInfoDto.dealerLocation }">
					<input type="hidden" name="registrationDate" value="${homeInfoDto.registrationDate }">
					<input type="hidden" name="address" value="${homeInfoDto.address }">
					<input type="hidden" name="userId" value="${sessionScope.userId}">
					<button type="submit" class="btn btn-danger">관심 주택 등록</button>
				</form>
			</div>
		</c:if>
	</main>


<!-- 로그인 모달 창 start-->
<%@ include file="/WEB-INF/views/common/loginModal.jsp" %>
<!-- 로그인 모달 창 end -->
<!-- 하단 footer start -->
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<!-- 하단 footer end -->
</body>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=902e757c8e8c05dcf492815e088ffe4c&libraries=services"></script>
<script type="text/javascript" src="${root}/resource/js/map.js"></script>

<script>
window.onload = function() {
		initMap();
		viewMap("${homeInfoDto.dealerLocation} ${homeInfoDto.dong} ${homeInfoDto.jibun}", "${homeInfoDto.apartmentName}");
}
</script>

</html>