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
		<h2>${homeLikesDto.apartmentName}</h2>
		
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
					<td>${homeLikesDto. dealYear}년 ${homeLikesDto.dealMonth}월 ${homeLikesDto.dealDay}일</td>
				</tr>
				<tr>
					<td>등기일자</td>
					<c:choose>
						<c:when test="${empty homeLikesDto.registrationDate}">
							<td> - </td>
						</c:when>
						<c:when test="${homeLikesDto.registrationDate eq ''}">
							<td> - </td>
						</c:when>
						<c:otherwise>
							<td>${homeLikesDto.registrationDate}</td>
						</c:otherwise>
					</c:choose>
				</tr>
				<tr>
					<td>거래금액</td>
					<td>${homeLikesDto.dealAmount}만원</td>
				</tr>
				<tr>
					<td>건축년도</td>
					<td>${homeLikesDto.buildYear}년</td>
				</tr>
				<tr>
					<td>층</td>
					<td>${homeLikesDto.floor}층</td>
				</tr>
				<tr>
					<td>전용면적</td>
					<td>${homeLikesDto.exclusiveArea} m<sup>2</sup></td>
				</tr>
				<tr>
					<td>도로명</td>
					<td>${homeLikesDto.roadName}</td>
				</tr>
				<tr>
					<td>주소</td>
					<td>${homeLikesDto.dealerLocation} ${homeLikesDto.dong} ${homeLikesDto.jibun}</td>
				</tr>
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

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=902e757c8e8c05dcf492815e088ffe4c&libraries=services"></script>
<script type="text/javascript" src="${root}/resource/js/map.js"></script>

<script>
window.onload = function() {
		initMap();
		viewMap("${homeLikesDto.dealerLocation} ${homeLikesDto.dong} ${homeLikesDto.jibun}", "${homeLikesDto.apartmentName}");
}
</script>

</html>