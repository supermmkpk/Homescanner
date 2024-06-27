<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
    
<!DOCTYPE html>
<html>
<!--  헤더 start -->	
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!-- Option 1: Include in HTML -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
<!--  헤더 end -->	
<body>
	 <!-- 상단 navbar start -->
	 <%@ include file="/WEB-INF/views/common/topNav.jsp" %>
	 <!-- 상단 navbar end -->
 	

<!-- main start -->
	<main class="col-xl-10 offset-xl-1">
	  	<h2 class="d-flex justify-content-center fw-semibold">관심 주택 목록</h2>
	    
	    <!-- 아파트 매매 정보 테이블 start -->
	    <c:choose>
	    	<c:when test="${empty list }">
	      		<h3>조회되는 항목이 없습니다.</h3>
	      	</c:when>
	      	
			<c:otherwise>
			
		    <table class="table table-hover text-center">
		      <tr>
		        <th>아파트이름</th>
		        <th>층</th>
		        <th>면적</th>
		        <th>법정동</th>
		        <th>거래금액(만원)</th>
		        <th></th>
		      </tr>
		      <tbody id="aptTable">
		     
		   	<c:forEach var="item" items="${list}" varStatus="stat">
		    	<tr style="vertical-align:middle;" onclick="location.href='${root}/homeLikes/view?likeId=${item.likeId}';">
					<td>${item.apartmentName }</td>
					<td>${item.floor }</td>
					<td>${item.exclusiveArea }</td>
					<td>${item.dong }</td>
					<td>${item.dealAmount }</td>
					<td>
						<button class="btn btn-link link-danger" id="deleteButton" onclick="event.stopPropagation();deleteItem('${item.apartmentName}');">
								<i class="bi bi-trash"></i>
						</button>
						 
					</td>
				</tr>
				<form action="${root}/homeLikes/delete" method="POST" id="deleteForm">
							<input type="hidden" name="likeId" value="${item.likeId}">
							<input type="hidden" name="userId" value="${item.userId}">
						</form>
			</c:forEach> 
				
			</tbody>
		    </table>
			</c:otherwise>
		</c:choose>
	    <!-- 아파트 매매 정보 태이블 end -->
	  </main>
 <!-- main end -->
  
 	
  
<!-- 하단 footer start -->
<div style="height:300px"></div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<!-- 하단 footer end -->
</body>

<script type="text/javascript">

	function deleteItem(name) {
		if(confirm(name + " 을(를) 삭제하시겠습니까?")) {
			document.querySelector("#deleteForm").submit();
		}
	}
	
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
	
	function submitForm(idx) {
		let id = "viewForm" + idx;
		document.getElementById(id).submit();
	}
</script>
</html>
