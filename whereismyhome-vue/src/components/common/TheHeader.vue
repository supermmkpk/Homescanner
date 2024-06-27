<script setup>
import { computed, ref, onMounted, onUpdated, onBeforeMount } from "vue";
import { RouterLink, useRouter } from "vue-router";
import { useMemberStore } from "@/stores/member";
import { storeToRefs } from "pinia";
import SearchInfo from "@/components/common/searchInfo.vue";
import { useCookie } from "vue-cookie-next";
import axios from "axios";

const cookie = useCookie();
const router = useRouter();
const memberStore = useMemberStore();
const { userLogout } = memberStore;
const { isLogin, isKakaoLogin, userInfo } = storeToRefs(memberStore);

const kakaoUserInfo = ref({
    nickname: "",
    profile_image: "",
    thumbnail_image: "",
});

const searchData = ref("");
let tempData = "";
let timerId = "";

onMounted(async () => {
    if (isKakaoLogin.value !== null) {
        await axios
            .get("https://kapi.kakao.com/v2/user/me", {
                headers: {
                    Authorization: "Bearer " + isKakaoLogin.value,
                },
            })
            .then(({ data }) => {
                console.log(data.properties);
                kakaoUserInfo.value = data.properties;
            })
            .catch((error) => {
                console.log(error);
            });
    }
});

const goLogin = () => {
    router.push({ name: "memberLogin" });
};

const goRegist = () => {
    router.push({ name: "memberRegist" });
};

const logout = () => {
    if (isKakaoLogin.value !== null) {
        cookie.removeCookie("kakao_access_token");
        router.go(0);
    } else {
        userLogout();
        router.push({ name: "home" });
    }
};

const check = () => {
    console.log(isKakaoLogin);
};

const onChange = (event) => {
    clearTimeout(timerId);
    tempData = event.target.value;
    timerId = setTimeout(goSearch, 1000);
};

const goSearch = () => {
    searchData.value = tempData;
};
const onoff = ref(false);
window.addEventListener("scroll", function () {
    onoff.value = false;
});

const onModal = () => {
    onoff.value = true;
};
const offModal = () => {
    onoff.value = false;
};

const onClick = (e) => {
    const container = document.getElementById("card");
    const container2 = document.getElementById("card2");
    //console.log(e.target.parentNode);
    //console.log(container);
    if (
        !(
            container == e.target ||
            container.contains(e.target) ||
            container2 == e.target ||
            container2.contains(e.target)
        )
    ) {
        onoff.value = false;
    }
};
window.addEventListener("click", onClick);
onMounted(() => {
    //console.log(this);
});
</script>

<template>
    <!-- ======= Header ======= -->
    <header id="header" class="header fixed-top d-flex align-items-center">
        <div class="d-flex align-items-center justify-content-between">
            <RouterLink :to="{ name: 'home' }" class="logo d-flex align-items-center">
                <i class="bi bi-houses fs-2 me-3"></i>
                <span class="d-none d-lg-block fw-bold">Homescanner</span>
            </RouterLink>
            <i class="bi bi-list toggle-sidebar-btn"></i>
        </div>
        <!-- End Logo -->

        <div id="card2" class="search-bar">
            <form class="search-form d-flex align-items-center" @submit.prevent>
                <input
                    type="text"
                    name="query"
                    placeholder="원하시는 지역명, 단지명(아파트명)을 입력해 주세요"
                    title="Enter search keyword"
                    autocomplete="off"
                    @input="onChange($event)"
                    @click="onModal"
                />
            </form>
        </div>
        <!-- End Search Bar -->

        <nav class="header-nav ms-auto">
            <ul class="d-flex align-items-center">
                <li class="nav-item d-block d-lg-none">
                    <a class="nav-link nav-icon search-bar-toggle" href="#">
                        <i class="bi bi-search"></i>
                    </a>
                </li>
                <!-- End Search Icon-->

                <li class="nav-item dropdown">
                    <a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
                        <i class="bi bi-bell"></i>
                        <span class="badge bg-primary badge-number">4</span> </a
                    ><!-- End Notification Icon -->

                    <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow notifications">
                        <li class="dropdown-header">
                            2개의 알림이 있습니다
                            <a href="#"
                                ><span class="badge rounded-pill bg-primary p-2 ms-2"
                                    >모두 보기</span
                                ></a
                            >
                        </li>

                        <!-- <i class="bi bi-exclamation-circle text-warning"></i>
                            <i class="bi bi-x-circle text-danger"></i>
                            <i class="bi bi-check-circle text-success"></i> -->

                        <li>
                            <hr class="dropdown-divider" />
                        </li>
                        <li class="notification-item">
                            <i class="bi bi-info-circle text-primary"></i>
                            <div>
                                <h4>관심 주택 정보 변경!</h4>
                                <p>매매13억9000 -> 매매13억7000</p>
                                <p>10시간 전.</p>
                            </div>
                        </li>
                        <li>
                            <hr class="dropdown-divider" />
                        </li>
                        <li class="notification-item">
                            <i class="bi bi-info-circle text-primary"></i>
                            <div>
                                <h4>새로운 공지사항</h4>
                                <p>[공지] 전국 아파트 및 빌라 동·호수별 AI 추정가 출시 예정 안내</p>
                                <p>4시간 전.</p>
                            </div>
                        </li>

                        <li>
                            <hr class="dropdown-divider" />
                        </li>
                        <li class="dropdown-footer">
                            <a href="#">모든 알림 보기</a>
                        </li>
                    </ul>
                    <!-- End Notification Dropdown Items -->
                </li>
                <!-- End Notification Nav -->

                <li class="nav-item dropdown">
                    <a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
                        <i class="bi bi-chat-left-text"></i>
                        <span class="badge bg-success badge-number">3</span> </a
                    ><!-- End Messages Icon -->

                    <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow messages">
                        <li class="dropdown-header">
                            3개의 새 메시지가 있습니다.
                            <a href="#"
                                ><span class="badge rounded-pill bg-primary p-2 ms-2"
                                    >모두 보기</span
                                ></a
                            >
                        </li>
                        <li>
                            <hr class="dropdown-divider" />
                        </li>

                        <li class="message-item">
                            <a href="#">
                                <img
                                    src="@/assets/img/messages-1.jpg"
                                    alt=""
                                    class="rounded-circle"
                                />
                                <div>
                                    <h4>라이언</h4>
                                    <p>
                                        상반기 중반기까지는 바닥을 다지고 하반기부터 점차 실수요자와
                                        투자자 위주로 급매물이 소화되면서 정부 세제개편이
                                        양도세,취득세 한시적 면제같은 부동산대책이 나오면서 시장이
                                        점차 활성화되지 않을까 극히 주관적인 생각을 해봅니다.
                                    </p>
                                    <p>4시간 전.</p>
                                </div>
                            </a>
                        </li>
                        <li>
                            <hr class="dropdown-divider" />
                        </li>

                        <li class="message-item">
                            <a href="#">
                                <img
                                    src="@/assets/img/messages-2.jpg"
                                    alt=""
                                    class="rounded-circle"
                                />
                                <div>
                                    <h4>어피치</h4>
                                    <p>
                                        여기 1년째 사는 사람입니다. 아침에 일어나면 눈이 뻑뻑하고,
                                        이상하게 여기서는 악몽을 꿉니다. 여기와서 몸이 안좋아져서,
                                        퇴사를 했습니다.
                                    </p>
                                    <p>6시간 전.</p>
                                </div>
                            </a>
                        </li>
                        <li>
                            <hr class="dropdown-divider" />
                        </li>

                        <li class="message-item">
                            <a href="#">
                                <img
                                    src="@/assets/img/messages-3.jpg"
                                    alt=""
                                    class="rounded-circle"
                                />
                                <div>
                                    <h4>프로도</h4>
                                    <p>
                                        분당,죽전 부동산자리 매물 다량 확보하고 있습니다. 방문해
                                        주시면 성심껏 도와드리겠습니다. 분당 미금역 1번출구에
                                        위치하고있습니다. 미금역 삼성부동산 031-717-7070,
                                        아파트,상가취급 전문요지
                                    </p>
                                    <p>6시간 전.</p>
                                </div>
                            </a>
                        </li>
                        <li>
                            <hr class="dropdown-divider" />
                        </li>

                        <li class="dropdown-footer">
                            <a href="#">모든 메시지 보기</a>
                        </li>
                    </ul>
                    <!-- End Messages Dropdown Items -->
                </li>
                <!-- End Messages Nav -->

                <!-- 로그아웃 상태 -->
                <div v-if="!isLogin && isKakaoLogin === null">
                    <div class="btn-group me-3" role="group" aria-label="Basic outlined example">
                        <button
                            type="button"
                            class="btn btn-outline-secondary btn-sm"
                            @click="goLogin"
                        >
                            로그인
                        </button>
                        <button
                            type="button"
                            class="btn btn-outline-secondary btn-sm"
                            @click="goRegist"
                        >
                            회원가입
                        </button>
                    </div>
                </div>
                <!-- 카카오 로그인 상태 -->
                <div v-else-if="isKakaoLogin !== null">
                    <li class="nav-item dropdown pe-3">
                        <a
                            class="nav-link nav-profile d-flex align-items-center pe-0"
                            href="#"
                            data-bs-toggle="dropdown"
                        >
                            <img
                                :src="kakaoUserInfo.thumbnail_image"
                                alt="Profile"
                                class="rounded-circle"
                            />
                            <span class="d-none d-md-block dropdown-toggle ps-2">
                                {{ kakaoUserInfo.nickname }}
                            </span> </a
                        ><!-- End Profile Iamge Icon -->

                        <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
                            <li class="dropdown-header">
                                <h6>{{ kakaoUserInfo.nickname }}</h6>
                                <span>카카오</span>
                            </li>
                            <li>
                                <hr class="dropdown-divider" />
                            </li>

                            <li>
                                <RouterLink
                                    :to="{ name: 'memberMyPage' }"
                                    class="dropdown-item d-flex align-items-center"
                                >
                                    <i class="bi bi-person"></i>
                                    <span>내 프로필</span>
                                </RouterLink>
                            </li>
                            <li>
                                <hr class="dropdown-divider" />
                            </li>

                            <li>
                                <button
                                    class="dropdown-item d-flex align-items-center"
                                    @click="logout"
                                >
                                    <i class="bi bi-box-arrow-right"></i>
                                    <span>로그아웃</span>
                                </button>
                            </li>
                        </ul>
                        <!-- End Profile Dropdown Items -->
                    </li>
                    <!-- End Profile Nav -->
                </div>
                <div v-else-if="isLogin">
                    <li class="nav-item dropdown pe-3">
                        <a
                            class="nav-link nav-profile d-flex align-items-center pe-0"
                            href="#"
                            data-bs-toggle="dropdown"
                        >
                            <img
                                src="@/assets/img/profile-img.jpg"
                                alt="Profile"
                                class="rounded-circle"
                            />
                            <span class="d-none d-md-block dropdown-toggle ps-2">
                                {{ userInfo.userName }}
                            </span> </a
                        ><!-- End Profile Iamge Icon -->

                        <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
                            <li class="dropdown-header">
                                <h6>{{ userInfo.userName }}</h6>
                                <span> {{ userInfo.userId }}</span>
                            </li>
                            <li>
                                <hr class="dropdown-divider" />
                            </li>

                            <li>
                                <RouterLink
                                    :to="{ name: 'memberMyPage' }"
                                    class="dropdown-item d-flex align-items-center"
                                >
                                    <i class="bi bi-person"></i>
                                    <span>내 프로필</span>
                                </RouterLink>
                            </li>
                            <li>
                                <hr class="dropdown-divider" />
                            </li>

                            <li>
                                <button
                                    class="dropdown-item d-flex align-items-center"
                                    @click="logout"
                                >
                                    <i class="bi bi-box-arrow-right"></i>
                                    <span>로그아웃</span>
                                </button>
                            </li>
                        </ul>
                        <!-- End Profile Dropdown Items -->
                    </li>
                    <!-- End Profile Nav -->
                </div>
            </ul>
        </nav>
        <!-- End Icons Navigation -->
    </header>
    <SearchInfo
        @offSearch="offModal"
        id="card"
        v-show="onoff"
        :searchData="searchData"
        style="margin-top: 60px"
    />
    <!-- End Header -->
    <!-- <div style="margin-bottom: 65px"></div> -->
</template>

<style scoped>
.logo {
    line-height: 1;
}

@media (min-width: 1200px) {
    .logo {
        width: 280px;
    }
}

.logo img {
    max-height: 26px;
    margin-right: 6px;
}

.logo span {
    font-size: 26px;
    font-weight: 700;
    color: var(--main-color);
    font-family: "Nunito", sans-serif;
}

.header {
    transition: all 0.5s;
    z-index: 997;
    height: 60px;
    box-shadow: 0px 2px 20px rgba(1, 41, 112, 0.1);
    background-color: #fff;
    padding-left: 20px;
    /* Toggle Sidebar Button */
    /* Search Bar */
}

.header .toggle-sidebar-btn {
    font-size: 32px;
    padding-left: 10px;
    cursor: pointer;
    color: var(--main-color);
}

.header .search-bar {
    min-width: 500px;
    padding: 0 20px;
}

@media (max-width: 1199px) {
    .header .search-bar {
        position: fixed;
        top: 50px;
        left: 0;
        right: 0;
        padding: 20px;
        box-shadow: 0px 0px 15px 0px rgba(1, 41, 112, 0.1);
        background: white;
        z-index: 9999;
        transition: 0.3s;
        visibility: hidden;
        opacity: 0;
    }

    .header .search-bar-show {
        top: 60px;
        visibility: visible;
        opacity: 1;
    }
}

.header .search-form {
    width: 100%;
}

.header .search-form input {
    border: 0;
    font-size: 14px;
    color: #012970;
    border: 1px solid rgba(1, 41, 112, 0.2);
    padding: 7px 38px 7px 8px;
    border-radius: 3px;
    transition: 0.3s;
    width: 100%;
}

.header .search-form input:focus,
.header .search-form input:hover {
    outline: none;
    box-shadow: 0 0 10px 0 rgba(1, 41, 112, 0.15);
    border: 1px solid var(--main-color);
}

.header .search-form button {
    border: 0;
    padding: 0;
    margin-left: -30px;
    background: none;
}

.header .search-form button i {
    color: var(--main-color);
}

/*--------------------------------------------------------------
# Header Nav
--------------------------------------------------------------*/
.header-nav ul {
    list-style: none;
}

.header-nav > ul {
    margin: 0;
    padding: 0;
}

.header-nav .nav-icon {
    font-size: 22px;
    color: #012970;
    margin-right: 25px;
    position: relative;
}

.header-nav .nav-profile {
    color: #012970;
}

.header-nav .nav-profile img {
    max-height: 36px;
}

.header-nav .nav-profile span {
    font-size: 14px;
    font-weight: 600;
}

.header-nav .badge-number {
    position: absolute;
    inset: -2px -5px auto auto;
    font-weight: normal;
    font-size: 12px;
    padding: 3px 6px;
}

.header-nav .notifications {
    inset: 8px -15px auto auto !important;
}

.header-nav .notifications .notification-item {
    display: flex;
    align-items: center;
    padding: 15px 10px;
    transition: 0.3s;
}

.header-nav .notifications .notification-item i {
    margin: 0 20px 0 10px;
    font-size: 24px;
}

.header-nav .notifications .notification-item h4 {
    font-size: 16px;
    font-weight: 600;
    margin-bottom: 5px;
}

.header-nav .notifications .notification-item p {
    font-size: 13px;
    margin-bottom: 3px;
    color: #919191;
}

.header-nav .notifications .notification-item:hover {
    background-color: #f6f9ff;
}

.header-nav .messages {
    inset: 8px -15px auto auto !important;
}

.header-nav .messages .message-item {
    padding: 15px 10px;
    transition: 0.3s;
}

.header-nav .messages .message-item a {
    display: flex;
}

.header-nav .messages .message-item img {
    margin: 0 20px 0 10px;
    max-height: 40px;
}

.header-nav .messages .message-item h4 {
    font-size: 16px;
    font-weight: 600;
    margin-bottom: 5px;
    color: #444444;
}

.header-nav .messages .message-item p {
    font-size: 13px;
    margin-bottom: 3px;
    color: #919191;
}

.header-nav .messages .message-item:hover {
    background-color: #f6f9ff;
}

.header-nav .profile {
    min-width: 240px;
    padding-bottom: 0;
    top: 8px !important;
}

.header-nav .profile .dropdown-header h6 {
    font-size: 18px;
    margin-bottom: 0;
    font-weight: 600;
    color: #444444;
}

.header-nav .profile .dropdown-header span {
    font-size: 14px;
}

.header-nav .profile .dropdown-item {
    font-size: 14px;
    padding: 10px 15px;
    transition: 0.3s;
}

.header-nav .profile .dropdown-item i {
    margin-right: 10px;
    font-size: 18px;
    line-height: 0;
}

.header-nav .profile .dropdown-item:hover {
    background-color: #f6f9ff;
}
</style>
