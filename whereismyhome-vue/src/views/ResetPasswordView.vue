<!-- ResetPassword.vue -->
<script setup>
import axios from "axios";
import { ref, computed } from "vue";
import { useRoute, useRouter } from "vue-router";
import Swal from "sweetalert2";
import TheSidebar from "@/components/common/TheSidebar.vue";

const route = useRoute();
const router = useRouter();

const resetToken = ref("");
const newPassword = ref("");
const confirmPassword = ref("");

resetToken.value = route.query.token;

async function handleSubmit() {
    if (newPassword.value !== confirmPassword.value) {
        alert("비밀번호가 일치하지 않습니다.");
        return;
    }

    await axios
        .post("http://localhost:8080/myhome/forgot/reset-password", {
            resetToken: resetToken.value,
            newPassword: newPassword.value,
        })
        .then((response) => {
            Swal.fire({
                title: "비밀번호 재설정 성공",
                text: "비밀번호가 정상적으로 재설정되었습니다.",
                icon: "success",
            });
            router.push({ name: "memberLogin" });
        })
        .catch((error) => {
            Swal.fire({
                title: "재설정 실패",
                text: "비밀번호 재설정에 실패하였습니다. 잠시후 다시 시도해 주세요.",
                icon: "error",
            });
        });
}

const possiblePassword = computed(() => {
    const passwordExp = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;
    return !(passwordExp.test(newPassword.value) || newPassword.value === "");
});
const possibleCheckPassword = computed(() => {
    return newPassword.value !== confirmPassword.value;
});
</script>

<template>
    <div class="container reset-password-view">
        <section
            class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4"
        >
            <div class="container">
                <div class="row justify-content-center">
                    <div
                        class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center"
                    >
                        <div class="d-flex justify-content-center py-4">
                            <span class="d-none d-lg-block fw-semibold fs-2">비밀번호 재설정</span>
                        </div>
                        <!-- End Logo -->

                        <div class="card my-3">
                            <div class="card-body">
                                <form class="row g-3 needs-validation" novalidate>
                                    <input type="hidden" v-model="resetToken" />
                                    <div class="col-12 mt-5">
                                        <label for="userPw" class="form-label fw-semibold"
                                            >새 비밀번호</label
                                        >
                                        <input
                                            type="password"
                                            name="userPw"
                                            class="form-control"
                                            id="userPw"
                                            required
                                            v-model="newPassword"
                                            placeholder="8자 이상, 알파벳, 숫자, 특수문자 포함"
                                        />
                                        <small class="text-danger" v-show="possiblePassword"
                                            >비밀번호는 알파벳, 숫자, 특수문자로 이루어진 8자에서
                                            20자입니다.</small
                                        >
                                    </div>
                                    <div class="col-12 my-3">
                                        <label for="userPwCheck" class="form-label fw-semibold"
                                            >비밀번호 확인</label
                                        >
                                        <input
                                            type="password"
                                            name="userPwCheck"
                                            class="form-control"
                                            id="userPwCheck"
                                            required
                                            v-model="confirmPassword"
                                            placeholder="8자 이상, 알파벳, 숫자, 특수문자 포함"
                                        />
                                        <small class="text-danger" v-show="possibleCheckPassword"
                                            >비밀번호가 동일하지 않습니다.</small
                                        >
                                    </div>
                                    <div class="col-12 mb-2">
                                        <div class="d-grid gap-2">
                                            <button
                                                type="button"
                                                class="btn btn-primary"
                                                @click="handleSubmit"
                                            >
                                                설정 완료
                                            </button>
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
    <!-- <div>
        <h2>비밀번호 재설정</h2>
        <form @submit.prevent="handleSubmit">
            <input type="hidden" v-model="resetToken" />
            <label for="password">새 비밀번호:</label>
            <input type="password" v-model="newPassword" required />
            <label for="confirmPassword">비밀번호 확인:</label>
            <input type="password" v-model="confirmPassword" required />
            <button type="submit">비밀번호 재설정</button>
        </form>
    </div> -->
    <!-- <router-view></router-view> -->
</template>

<style scoped>
.reset-password-view {
    position: absolute;
    left: 0;
    right: 0;
    margin-left: auto;
    margin-right: auto;
}
</style>
