<script setup>
import { useRouter } from "vue-router";
const router = useRouter();
// eslint-disable-next-line no-unused-vars
const memberRegist = () => {
  router.push({ name: "memberRegist" });
};

const goHome = () => {
  router.push({ name: "home" });
};

const moveDetail = () => {
  router.push({ name: "memberDetail", query: {} });
};
</script>

<template>
  <div>
    <nav
      class="navbar navbar-expand-md shadow-sm bg-light navbar-light fixed-top"
    >
      <div class="container-fluid col-xl-10 offset-xl-1">
        <a
          class="main-color fs-4 fw-bold"
          href="#"
          @click="goHome"
          style="text-decoration: none"
        >
          <i class="bi bi-houses"></i>
          구해줘 홈즈
        </a>
        <button
          class="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#collapsibleNavbar"
        >
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="collapsibleNavbar">
          <div>
            <ul class="navbar-nav">
              <li class="nav-item py-1">
                <routerLink class="nav-link fw-semibold" :to="{ name: 'board' }"
                  >게시판</routerLink
                >
              </li>
              <li class="nav-item py-1">
                <routerLink
                  class="nav-link fw-semibold"
                  :to="{ name: 'member' }"
                  >유저관리</routerLink
                >
              </li>
              <li class="nav-item py-1">
                <routerLink
                  class="nav-link fw-semibold"
                  :to="{ name: 'searchHome' }"
                  >검색</routerLink
                >
              </li>
            </ul>
          </div>

          <div class="ms-auto">
            <!-- 로그인 안되어 있는 상태 -->

            <ul class="navbar-nav" id="header_nav_confirm_off">
              <li class="nav-item me-2 py-1">
                <button class="loginButton btn btn-light btn-sm">로그인</button>
              </li>
              <li class="nav-item py-1">
                <button
                  class="btn btn-sm text-white"
                  @click="memberRegist"
                  style="background-color: #ff6d5a"
                >
                  회원가입
                </button>
              </li>
            </ul>

            <!-- 로그인 시, 표출 start -->
            <ul class="navbar-nav" id="header_nav_confirm_on">
              <!-- <c:if test="${sessionScope.userId == 'admin'}"> -->
              <li>
                <span class="nav-link fw-semibold">[ 관리자 ]</span>
              </li>
              <!-- </c:if> -->
              <li class="nav-item">
                <a
                  class="nav-link fw-semibold"
                  href="#"
                  onclick="location.href='${root}/member/logout'"
                  >로그아웃</a
                >
              </li>
              <li class="nav-item dropdown">
                <a
                  class="nav-link fw-semibold dropdown-toggle"
                  href="#"
                  role="button"
                  data-bs-toggle="dropdown"
                  aria-expanded="false"
                >
                  마이페이지
                </a>
                <ul class="dropdown-menu">
                  <li>
                    <a class="dropdown-item fw-semibold" @click="moveDetail"
                      >계정정보</a
                    >
                  </li>
                  <li>
                    <a
                      class="dropdown-item fw-semibold"
                      href="${root}/homeLikes/list?userId=${sessionScope.userId}"
                      >관심 주택</a
                    >
                  </li>
                </ul>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </nav>
  </div>
</template>

<style scoped>
.navbar-brand:hover {
  color: var(--main-color);
}
</style>
