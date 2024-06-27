<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>    
    
<!DOCTYPE html>
<html>
<!--  헤더 start -->	
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!--  헤더 end -->	

<script type="text/javascript" src="resource/js/login.js"></script>
<script>
    window.onload = function() {
        checkLogin();
    }

</script>
<body>
  <!-- 상단 navbar start -->
  <%@ include file="/WEB-INF/views/common/topNav.jsp" %>
  <!-- 상단 navbar end -->
  
  <main>
	  <div class="container">
		<div class="row justify-content-center">
	      	<div class="col-lg-8 col-md-10 col-sm-12">
	          <h2 class="my-3 py-3 shadow-sm bg-light text-center">
	            <mark class="sky">요청 실패</mark>
	          </h2>
	       	</div>
			<div class="card text-center bg-light">
	            <div class="card-body">
	              <p class="card-text">
	                요청에 실패하였습니다. <br>
	                잠시 후 시도해주세요. <br>
	                ${error}
	                <!-- <span class="fw-lighter" style="font-size: 0.8rem;">(원인: <%= request.getAttribute("error") %>)</span> -->
	              </p>
	              
	              <button type="button" id="btn-home" class="btn btn-outline-danger mt-2">
	                홈
	              </button>
	            </div>
	       </div>
		</div>
	  </div>
  </main>
  
  <!-- 하단 footer start -->
  <%@ include file="/WEB-INF/views/common/footer.jsp" %>
  <!-- 하단 footer end -->
</body>

<script>
  document.querySelector("#btn-home").addEventListener("click", function () {
      location.href = "${root}/";
  });
</script>

</html>