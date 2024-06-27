<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
    
<!DOCTYPE html>
<html>
<!--  헤더 start -->	
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!--  헤더 end -->	

<body>
	 <!-- 상단 navbar start -->
	 <%@ include file="/WEB-INF/views/common/topNav.jsp" %>
	 <!-- 상단 navbar end -->
 	
 	 

<!-- main start -->
  <main class="col-xl-10 offset-xl-1">
    
    <!-- 아파트 매매 정보 테이블 start -->
    <c:choose>
    	<c:when test="${empty list }">
      		<h3>조회되는 항목이 없습니다.</h3>
      	</c:when>
      	
		<c:otherwise>
		 <!-- 검색 start -->
 		<div class="container my-3">
			<div class="d-flex justify-content-between">
			 	<!-- 검색 start -->
		    	<form class="row g-3" action="${root }/homeInfo" method="POST">
				    	<input type="hidden" name="action" value="searchList">
				    	<input type="hidden" name="pageno" value="${param.pageno}">
			  			<input type="hidden" name="gugun" value="${param.gugun}">
			  			<input type="hidden" name="year" value="${param.year}">
			  			<input type="hidden" name="month" value="${param.month}">
			  		<div class="col-auto">
						<select name="type" class="form-select" id="searchSelect">
						  <option selected value="all">전체</option>
						  <option value="name">아파트명</option>
						</select>
					</div>
					<div class="col-auto">
				  		<input type="text" class="form-control" name="searchText" placeholder="검색어를 입력하세요">
				  	</div>
				  	<div class="col-auto">
				  		<button type="submit" class="btn btn-outline-primary custom-btn-primary">	
					  		<i class="bi bi-search"></i>
						</button>
					</div>
		  		</form>
		  		<!-- 검색 end -->
		  	
		  		<!-- 정렬 start -->
		  		<form class="row g-3" action="${root }/homeInfo" method="GET">
			  			<input type="hidden" name="action" value="sort">
			  			<input type="hidden" name="pageno" value="${param.pageno}">
			  			<input type="hidden" name="gugun" value="${param.gugun}">
			  			<input type="hidden" name="year" value="${param.year}">
			  			<input type="hidden" name="month" value="${param.month}">
		  			<div class="col-auto">
						<select class="form-select" name="type">
						  <option selected>정렬</option>
						  <option value="apartmentName">아파트이름</option>
						  <option value="floor">층</option>
						  <option value="exclusiveArea">면적</option>
						  <option value="dong">법정동</option>
						  <option value="dealAmount">거래금액</option>
						</select>
					</div>
					<div class="col-auto">
						<select class="form-select" name="sortType">
						  <option selected>순서</option>
						  <option value="asc">낮은순</option>
						  <option value="desc">높은순</option>
						</select>
					</div>
					<div class="col-auto">
						<button type="submit" class="btn btn-outline-primary custom-btn-primary">
							<i class="bi bi-check-lg"></i>
						</button>
					</div>
				</form>
				<!-- 정렬 end -->
			</div>
		</div>
		<!-- 검색 end -->
		
		
		
	    <table class="table table-hover text-center">
	      <tr>
	        <th>아파트이름</th>
	        <th>층</th>
	        <th>면적</th>
	        <th>법정동</th>
	        <th>거래금액(만원)</th>
	      </tr>
	      <tbody id="aptTable">
	     
	   	<c:forEach var="item" items="${list }" varStatus="stat">
	   		<form id="viewForm${stat.index}"action="${root}/homeInfo/view" method="POST">
	   			<input type="hidden" name="dealAmount" value="${item.dealAmount }">
	   			<input type="hidden" name="buildYear" value="${item.buildYear }">
	   			<input type="hidden" name="dealYear" value="${item.dealYear }">
	   			<input type="hidden" name="dealMonth" value="${item.dealMonth }">
	   			<input type="hidden" name="dealDay" value="${item.dealDay }">
	   			<input type="hidden" name="roadName" value="${item.roadName }">
	   			<input type="hidden" name="dong" value="${item.dong }">
	   			<input type="hidden" name="apartmentName" value="${item.apartmentName }">
	   			<input type="hidden" name="exclusiveArea" value="${item.exclusiveArea }">
	   			<input type="hidden" name="jibun" value="${item.jibun }">
	   			<input type="hidden" name="floor" value="${item.floor }">
	   			<input type="hidden" name="dealerLocation" value="${item.dealerLocation }">
	   			<input type="hidden" name="registrationDate" value="${item.registrationDate }">
	   			<input type="hidden" name="address" value="${item.address }">
	   		</form>
	   		
	    	<tr onclick="submitForm(${stat.index});">
				<td>${item.apartmentName }</td>
				<td>${item.floor }</td>
				<td>${item.exclusiveArea }</td>
				<td>${item.dong }</td>
				<td>${item.dealAmount }</td>
			</tr>
		</c:forEach> 
			
		</tbody>
	    </table>
		</c:otherwise>
	</c:choose>
	
	<!-- pagination start -->
    <div class="text-center">
      <button id="prev-page" class='btn btn-primary btn-sm'>이전 페이지</button>
      <button id="next-page" class="btn btn-primary btn-sm">다음 페이지</button>
    </div>
    <!-- pagination end -->

    <!-- 아파트 매매 정보 태이블 end -->
  </main>
 <!-- main end -->
  
  
<!-- 로그인 모달 창 start-->
<%@ include file="/WEB-INF/views/common/loginModal.jsp" %>
<!-- 로그인 모달 창 end -->
<!-- 하단 footer start -->
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<!-- 하단 footer end -->
</body>

<script type="text/javascript">
	let searchInput = document.getElementById("searchInput");
	if(searchInput != null) {
		searchInput.addEventListener("keydown", function(event) {
		    if (event.key === "Enter") {
		       searchTable();
		    }
		});
	}	
	//검색 조건 선택 이벤트 처리
	let searchSelect = document.querySelector("#searchSelect")
	
	if(searchSelect != null) {
		searchSelect.addEventListener("change", function () {
			let idx = this.selectedIndex;
			if(idx == 0) {
				document.querySelector("#searchInput").value = "";
				searchTable();
			} else {
				document.querySelector("#searchInput").placeholder = this.options[idx].innerText + "을 입력하세요.";
			}
		});
	}
	
	function searchTable() {
	    // 검색 입력값 가져오기
	    var input, filter, table, tr, td, i, txtValue;
	    input = document.getElementById("searchInput");
	    filter = input.value.toUpperCase();
	    table = document.getElementById("aptTable");
	    tr = table.getElementsByTagName("tr");
	
	    // 테이블의 모든 행을 순회하며 검색어와 일치하는지 확인
	    for (i = 0; i < tr.length; i++) {
	        td = tr[i].getElementsByTagName("td")[0]; // 첫 번째 열에서 검색
	        if (td) {
	            txtValue = td.textContent || td.innerText;
	            if (txtValue.toUpperCase().indexOf(filter) > -1) {
	                tr[i].style.display = "";
	            } else {
	                tr[i].style.display = "none"; // 일치하지 않으면 행을 숨김
	            }
	        }       
	    }
	}
	
	//페이지네이션 버튼 이벤트 리스너
	document.getElementById("prev-page").addEventListener("click", () => {
	  if (${param.pageno} > 1) {
	   	let pageNo = ${param.pageno} - 1;
	    location.href="${root}/homeInfo/list?pageno=" + pageNo + 
	    		"&gugun=${param.gugun}&year=${param.year}&month=${param.month}";
	  }
	});
	document.getElementById("next-page").addEventListener("click", function() {
		let pageNo = ${param.pageno} + 1;
	    location.href="${root}/homeInfo/list?pageno=" + pageNo + 
	    		"&gugun=${param.gugun}&year=${param.year}&month=${param.month}";
	});
	
	function submitForm(idx) {
		let id = "viewForm" + idx;
		document.getElementById(id).submit();
	}
</script>

</html>
