<!-- eslint-disable vue/no-deprecated-v-bind-sync -->
<script setup>
import { ref, computed } from "vue";
import { VueDaumPostcode } from "vue-daum-postcode";
import { useRouter } from "vue-router";
import { Modal } from "usemodal-vue3";
import "bootstrap-vue/dist/bootstrap-vue.css";
import Axios from "axios";
import Swal from "sweetalert2";

const router = useRouter();
const isVisible = ref(false);
const activeModal = () => {
    isVisible.value = true;
};
const id = ref("");
const password = ref("");
const checkPassword = ref("");
const email = ref("");
const name = ref("");
const address = ref("");
const phoneNumber = ref("");
const registMember = async () => {
    const user = {
        userId: id.value,
        userPw: password.value,
        userEmail: email.value,
        userName: name.value,
        userMobile: phoneNumber.value,
        userAddress: address.value,
        // joinDate: "",
        // role: "",
        // token: "",
    };
    console.log(user);
    if (
        !possibleId.value &&
        !possiblePassword.value &&
        !possibleCheckPassword.value &&
        !possibleEmail.value &&
        !possibleName.value &&
        !possiblePhoneNumber.value
    ) {
        await Axios.post("http://localhost:8080/myhome/member/regist", user).then(({ data }) => {
            console.log(data);
            Swal.fire({
                title: "회원가입 완료!",
                text: "회원가입에 성공하였습니다.",
                icon: "success",
            });
            router.push({ name: "home" });
        });
    } else {
        Swal.fire({
            title: "모든 정보를 입력해주세요!",
            text: "기입하지 않은 필수 항목이 있습니다.",
            icon: "warning",
        });
    }
};

const possibleId = computed(() => {
    const idExp = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,16}$/;
    return !(idExp.test(id.value) || id.value === "");
});
const possiblePassword = computed(() => {
    const passwordExp = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;
    return !(passwordExp.test(password.value) || password.value === "");
});
const possibleCheckPassword = computed(() => {
    return password.value !== checkPassword.value;
});
const possibleEmail = computed(() => {
    // eslint-disable-next-line no-useless-escape
    const emailExp = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
    return !(emailExp.test(email.value) || email.value === "");
});
const possibleName = computed(() => {
    const nameExp = /^[가-힣]{2,20}$/;
    return !(nameExp.test(name.value) || name.value === "");
});
const possiblePhoneNumber = computed(() => {
    const phoneNumberExp = /^01(0|1|[6-9])[0-9]{3,4}[0-9]{4}$/;
    return !(phoneNumberExp.test(phoneNumber.value) || phoneNumber.value === "");
});

const addressSearched = (data) => {
    address.value = data.roadAddress ? data.roadAddress : data.jibunAddress;
    isVisible.value = false;
};
</script>

<template>
    <div class="container mt-5">
        <section
            class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4"
        >
            <div class="container">
                <div class="row justify-content-center">
                    <div
                        class="col-lg-5 col-md-6 d-flex flex-column align-items-center justify-content-center"
                    >
                        <div class="d-flex justify-content-center py-4">
                            <RouterLink
                                :to="{ name: 'home' }"
                                class="logo d-flex align-items-center w-auto"
                            >
                                <i class="bi bi-houses fs-2 me-1"></i>
                                <span class="d-none d-lg-block fw-bold fs-3">Homescanner</span>
                            </RouterLink>
                        </div>
                        <!-- End Logo -->

                        <div class="card mb-3">
                            <div class="card-body">
                                <div class="pt-4 pb-2">
                                    <h5 class="card-title text-center pb-0 fs-4">회원가입</h5>
                                    <p class="text-center small">
                                        Homescanner 서비스 이용을 위해 아래 정보를 입력해주세요.
                                    </p>
                                </div>
                                <form class="row g-3 needs-validation" novalidate>
                                    <div class="col-12">
                                        <label for="userId" class="form-label">아이디</label>
                                        <input
                                            type="text"
                                            name="userId"
                                            class="form-control"
                                            id="userId"
                                            required
                                            v-model="id"
                                        />
                                        <span class="form_error" v-show="possibleId"
                                            >아이디는 알파벳과 숫자로 이루어진 8자에서
                                            20자입니다.</span
                                        >
                                    </div>
                                    <div class="col-12">
                                        <label for="userPw" class="form-label">비밀번호</label>
                                        <input
                                            type="password"
                                            name="userPw"
                                            class="form-control"
                                            id="userPw"
                                            required
                                            v-model="password"
                                        />
                                        <span class="form_error" v-show="possiblePassword"
                                            >비밀번호는 알파벳, 숫자, 특수문자로 이루어진 8자에서
                                            20자입니다.</span
                                        >
                                    </div>
                                    <div class="col-12">
                                        <label for="userPwCheck" class="form-label"
                                            >비밀번호 확인</label
                                        >
                                        <input
                                            type="password"
                                            name="userPwCheck"
                                            class="form-control"
                                            id="userPwCheck"
                                            required
                                            v-model="checkPassword"
                                        />
                                        <span class="form_error" v-show="possibleCheckPassword"
                                            >비밀번호가 동일하지 않습니다.</span
                                        >
                                    </div>

                                    <div class="col-12">
                                        <label for="userEmail" class="form-label">이메일</label>
                                        <input
                                            type="email"
                                            name="userEmail"
                                            class="form-control"
                                            id="userEmail"
                                            required
                                            v-model="email"
                                        />
                                        <span class="form_error" v-show="possibleEmail"
                                            >이메일 형식이 올바르지 않습니다.</span
                                        >
                                    </div>

                                    <div class="col-12">
                                        <label for="username" class="form-label">이름</label>

                                        <input
                                            type="text"
                                            name="userName"
                                            class="form-control"
                                            id="userName"
                                            required
                                            v-model="name"
                                        />
                                        <span class="form_error" v-show="possibleName"
                                            >이름이 올바르지 않습니다.</span
                                        >
                                    </div>
                                    <div class="col-12">
                                        <label for="userAddress" class="form_label">주소</label>
                                        <input
                                            class="form-control"
                                            type="text"
                                            id="userAddress"
                                            name="userAddress"
                                            style="background-color: #fff"
                                            readonly
                                            @click="activeModal"
                                            v-model="address"
                                        />
                                        <Modal title="주소 검색" v-model:visible="isVisible">
                                            <VueDaumPostcode
                                                @complete="addressSearched"
                                                no-submit-mode="true"
                                            />
                                        </Modal>
                                        <span class="form_error" v-show="false"
                                            >주소가 올바르지 않습니다.</span
                                        >
                                    </div>

                                    <div class="col-12">
                                        <label for="userMobile" class="form-label"
                                            >휴대폰 번호</label
                                        >

                                        <input
                                            type="text"
                                            name="userMobile"
                                            class="form-control"
                                            id="userMobile"
                                            required
                                            v-model="phoneNumber"
                                        />
                                        <span class="form_error" v-show="possiblePhoneNumber"
                                            >번호가 올바르지 않습니다.</span
                                        >
                                    </div>

                                    <div class="col-12">
                                        <div class="form-check">
                                            <input
                                                class="form-check-input"
                                                name="terms"
                                                type="checkbox"
                                                value=""
                                                id="acceptTerms"
                                                required
                                            />
                                            <label class="form-check-label" for="acceptTerms"
                                                >서비스 이용약관에 동의해주세요.</label
                                            >
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <button
                                            class="btn btn-primary w-100"
                                            type="button"
                                            @click="registMember"
                                        >
                                            회원가입
                                        </button>
                                    </div>
                                    <div class="col-12">
                                        <p class="small mb-0">
                                            이미 계정이 있으신가요?
                                            <RouterLink :to="{ name: 'memberLogin' }">
                                                로그인
                                            </RouterLink>
                                        </p>
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

<style scoped>
.form_error {
    margin-top: 12px;
    font-size: 11px;
    color: rgb(255, 72, 40);
}
</style>
