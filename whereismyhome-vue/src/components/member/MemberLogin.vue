<script setup>
import { ref, onMounted, computed } from "vue";
import { storeToRefs } from "pinia";
import { useRouter } from "vue-router";
import { useMemberStore } from "@/stores/member";
import { useCookie } from "vue-cookie-next";
import Swal from "sweetalert2";
import HomeView from "@/views/HomeView.vue";
import { Modal } from "usemodal-vue3";
import axios from "axios";

const isVisible = ref(false);
const activeModal = () => {
    isVisible.value = true;
};
const forgotEmail = ref("");

const customCancelButton = {
    text: "취소",
    onclick: () => {
        isVisible.value = false;
    },
    loading: false,
};
const customOkButton = {
    text: "인증 메일 받기",
    onclick: async () => {
        await axios
            .post("http://localhost:8080/myhome/forgot/forgot-password", {
                email: forgotEmail.value,
            })
            .then(() => {
                Swal.fire({
                    title: "재설정 링크 전송 완료!",
                    text: "재설정 링크가 입력하신 메일로 발송되었습니다.",
                    icon: "success",
                });
                router.push({
                    name: "boardList",
                });
            })
            .catch(() => {
                Swal.fire({
                    title: "재설정 링크 전송 실패",
                    text: "메일 전송에 실패하였습니다. 잠시후 다시 시도하세요.",
                    icon: "error",
                });
            });
    },
    loading: true,
};

const router = useRouter();

const memberStore = useMemberStore();
const { isLogin, isLoginError, isAdmin } = storeToRefs(memberStore);
const { userLogin, getUserInfo } = memberStore;

const cookie = useCookie();

const status = ref(false);
const loginUser = ref({
    userId: "",
    userPw: "",
});

onMounted(() => {
    if (cookie.getCookie("rememberid")) {
        status.value = true;
        loginUser.value.userId = cookie.getCookie("rememberid");
    } else {
        status.value = false;
    }
    console.log(status.value);
    console.log(loginUser.value.userId);
});

const login = async () => {
    console.log(loginUser.value);
    await userLogin(loginUser.value);
    console.log("isAdmin=" + isAdmin.value);
    let token = sessionStorage.getItem("accessToken");
    console.log(token);
    console.log("isLogin: " + isLogin.value);
    if (isLogin.value) {
        checkRememberId();
        getUserInfo(token);
        router.replace({ name: "home" });
        Swal.fire({
            position: "top-end",
            toast: true,
            showConfirmButton: false,
            timer: 1500,
            icon: "success",
            title: "로그인 성공",
            text: "환영합니다!!",
        });
    }
};

const checkRememberId = () => {
    if (status.value == false) {
        cookie.removeCookie("rememberid");
        console.log("rememberid 삭제");
    } else {
        cookie.setCookie("rememberid", loginUser.value.userId);
    }
};

const kakaoLogin = async () => {
    axios.get("http://localhost:8080/myhome/oauthLogin/login").then((response) => {
        console.log(response.data);
        console.warn("warn : " + response);
        window.location.href = response.data;
    });
};

const possibleEmail = computed(() => {
    // eslint-disable-next-line no-useless-escape
    const emailExp = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
    return !(emailExp.test(forgotEmail.value) || forgotEmail.value === "");
});
</script>

<template>
    <div class="container">
        <section
            class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4"
        >
            <div class="container">
                <div class="row justify-content-center">
                    <div
                        class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center"
                    >
                        <div class="d-flex justify-content-center py-4">
                            <RouterLink
                                :to="{ name: 'home' }"
                                class="logo d-flex align-items-center w-auto"
                            >
                                <i class="bi bi-houses fs-2 me-1"></i>
                                <span class="d-none d-lg-block fw-semibold fs-3">Homescanner</span>
                            </RouterLink>
                        </div>
                        <!-- End Logo -->

                        <div class="card mb-3">
                            <div class="card-body">
                                <div class="pt-4 pb-2">
                                    <h5 class="card-title text-center pb-0 fs-4">로그인</h5>
                                    <p class="text-center small">아이디, 비밀번호를 입력하세요</p>
                                </div>

                                <form class="row g-3 needs-validation" novalidate>
                                    <div class="col-12">
                                        <label for="yourUsername" class="form-label">아이디</label>
                                        <div class="input-group has-validation">
                                            <input
                                                type="text"
                                                name="username"
                                                class="form-control"
                                                id="yourUsername"
                                                required
                                                v-model="loginUser.userId"
                                            />
                                            <div class="invalid-feedback">
                                                Please enter your username.
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <label for="yourPassword" class="form-label">
                                            비밀번호
                                        </label>
                                        <input
                                            type="password"
                                            name="password"
                                            class="form-control"
                                            id="yourPassword"
                                            required
                                            v-model="loginUser.userPw"
                                            @keyup.enter="login"
                                        />
                                        <div class="text-danger" v-if="isLoginError === true">
                                            <small> 아이디 또는 비밀번호 확인해 주세요</small>
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <div class="form-check">
                                            <input
                                                class="form-check-input"
                                                type="checkbox"
                                                v-model="status"
                                                :value="status"
                                            />
                                            <label class="form-check-label" for="rememberMe"
                                                >아이디 저장</label
                                            >
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <button
                                            class="btn btn-primary w-100"
                                            type="button"
                                            @click="login"
                                        >
                                            로그인
                                        </button>
                                    </div>
                                    <div class="col-12 text-center">
                                        <a
                                            type="button"
                                            @click="kakaoLogin"
                                            href="#"
                                            class="col-12"
                                        >
                                            <img src="@/assets/img/kakao_login_small.png" />
                                        </a>
                                    </div>

                                    <div
                                        class="col-12 d-flex justify-content-center align-items-center"
                                    >
                                        <div>
                                            <a href="#" @click="activeModal" class="small">
                                                비밀번호 재설정
                                            </a>
                                            <Modal
                                                title="비밀번호 재설정"
                                                v-model:visible="isVisible"
                                                :cancelButton="customCancelButton"
                                                :okButton="customOkButton"
                                            >
                                                <form class="mb-3">
                                                    <label for="emailInput" class="mt-3 mb-2">
                                                        <small
                                                            >가입한 이메일 정보 입력 후 인증
                                                            메일받기를 클릭하세요.</small
                                                        >
                                                    </label>
                                                    <input
                                                        type="email"
                                                        class="form-control"
                                                        placeholder="이메일"
                                                        v-model="forgotEmail"
                                                    />
                                                    <small
                                                        class="text-danger my-1"
                                                        v-show="possibleEmail"
                                                        >이메일 형식이 올바르지 않습니다.</small
                                                    >
                                                </form>
                                            </Modal>
                                        </div>
                                        <div class="mx-4">
                                            <small>|</small>
                                        </div>
                                        <div>
                                            <p class="small mb-0">
                                                <RouterLink :to="{ name: 'memberRegist' }">
                                                    이메일로 가입
                                                </RouterLink>
                                            </p>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</template>

<style scoped></style>
