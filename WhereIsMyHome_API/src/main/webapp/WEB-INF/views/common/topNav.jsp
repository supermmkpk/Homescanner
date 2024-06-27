<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <nav class="navbar navbar-expand-md shadow-sm bg-light navbar-light fixed-top">
    <div class="container-fluid col-xl-10 offset-xl-1">
      <a class="navbar-brand main-color fs-4 fw-bold" href="${root}/">
        <i class="bi bi-houses"></i>
        구해줘 홈즈
      </a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="collapsibleNavbar">
        <div>
          <ul class="navbar-nav">
            <li class="nav-item py-1">
              <a class="nav-link fw-semibold" href="${root}/notice/getNotices">공지사항</a>
            </li>
            <c:if test="${sessionScope.userId == 'admin'}">
            	<li class="nav-item py-1">
         			<a class="nav-link fw-semibold" href="${root}/member/list">유저관리</a>
           		</li>
           	</c:if>
          </ul>
        </div>

        <div class="ms-auto">
          <c:if test="${empty sessionScope.userId}">
          <!-- 로그인 안되어 있는 상태 -->
          <ul class="navbar-nav" id='header_nav_confirm_off'>
            <li class="nav-item me-2 py-1">
              <button class="loginButton btn btn-light btn-sm" data-bs-toggle="modal" data-bs-target="#loginModalLabel">
                로그인
              </button>
            </li>
            <li class="nav-item py-1">
              <button class="btn btn-sm text-white" onclick = "location.href='${root}/member/mvregist'" style="background-color:#FF6D5A">
                회원가입
              </button>
            </li>
          </ul>
          </c:if>
          
          <!-- 로그인 시, 표출 start -->
          <c:if test="${!empty sessionScope.userId}">
          <ul class='navbar-nav' id='header_nav_confirm_on'>
          	<c:if test="${sessionScope.userId == 'admin'}">
            	<li>
              		<span class="nav-link fw-semibold">[ 관리자 ]</span>
            	</li>
           	</c:if>
            <li class="nav-item">
              <a class="nav-link fw-semibold" href="#" onclick="location.href='${root}/member/logout'">로그아웃</a>
            </li>
            <li class="nav-item dropdown">
	          <a class="nav-link fw-semibold dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
	            마이페이지
	          </a>
	          <ul class="dropdown-menu">
          		<li>
	              	<a class="dropdown-item fw-semibold" href="${root}/member/mvMyPage">계정정보</a>
	            </li>
	            <li>
              		<a class="dropdown-item fw-semibold" href="${root}/homeLikes/list?userId=${sessionScope.userId}">관심 주택</a>
            	</li>
	          </ul>
	        </li>
          </ul>
          </c:if>
          <!-- 로그인 시 표출 end -->
        </div>
      </div>  
    </div>
  </nav>
