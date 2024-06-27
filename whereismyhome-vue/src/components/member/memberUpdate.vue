<script setup>
import { useRoute, useRouter } from "vue-router";
import { ref, onMounted } from "vue";
import { VueDaumPostcode } from "vue-daum-postcode";
import { Modal } from "usemodal-vue3";
import Axios from "axios";
import Swal from "sweetalert2";

const route = useRoute();
const router = useRouter();
const isVisible = ref(false);

const props = defineProps({
    userInfoNow: Object,
});

const userInfo = ref({
    userId: props.userInfoNow.userId,
    userPw: "",
    userEmail: props.userInfoNow.userEmail,
    userName: props.userInfoNow.userName,
    userMobile: props.userInfoNow.userMobile,
    userAddress: props.userInfoNow.userAddress,
});
console.log(userInfo);

const activeModal = () => {
    isVisible.value = true;
};
const addressSearched = (data) => {
    userInfo.value.userAddress = data.roadAddress ? data.roadAddress : data.jibunAddress;
    isVisible.value = false;
};
const updateMember = () => {
    const url = "http://localhost:8080/myhome/member/edit";
    Axios.put(url, {
        userId: userInfo.value.userId,
        userPw: "",
        userEmail: userInfo.value.userEmail,
        userName: userInfo.value.userName,
        userMobile: userInfo.value.userMobile,
        userAddress: userInfo.value.userAddress,
    })
        .then(async () => {
            await Swal.fire({
                title: "수정 완료!",
                text: "정보 수정에 성공하였습니다.",
                icon: "success",
            });
            router.go({ name: "memberMyPage" });
        })
        .catch();
};
</script>

<template>
    <div class="tab-pane fade profile-edit pt-3" id="profile-edit">
        <form>
            <!-- <div class="row mb-3">
                <label for="profileImage" class="col-md-4 col-lg-3 col-form-label"
                    >Profile Image</label
                >
                <div class="col-md-8 col-lg-9">
                    <img src="@/assets/img/profile-img.jpg" alt="Profile" />
                    <div class="pt-2">
                        <a href="#" class="btn btn-primary btn-sm" title="Upload new profile image"
                            ><i class="bi bi-upload"></i
                        ></a>
                        <a href="#" class="btn btn-danger btn-sm" title="Remove my profile image"
                            ><i class="bi bi-trash"></i
                        ></a>
                    </div>
                </div>
            </div> -->

            <div class="row mb-3">
                <label for="userName" class="col-md-4 col-lg-3 col-form-label">이름</label>
                <div class="col-md-8 col-lg-9">
                    <input
                        type="text"
                        class="form-control"
                        id="userName"
                        name="userName"
                        v-model="userInfo.userName"
                    />
                </div>
            </div>

            <div class="row mb-3">
                <label for="userMobile" class="col-md-4 col-lg-3 col-form-label">휴대폰 번호</label>
                <div class="col-md-8 col-lg-9">
                    <input
                        type="text"
                        class="form-control"
                        id="userMobile"
                        name="userMobile"
                        v-model="userInfo.userMobile"
                    />
                </div>
            </div>
            <div class="row mb-3">
                <label for="userEmail" class="col-md-4 col-lg-3 col-form-label">이메일</label>
                <div class="col-md-8 col-lg-9">
                    <input
                        type="text"
                        class="form-control"
                        id="userEmail"
                        name="userEmail"
                        v-model="userInfo.userEmail"
                    />
                </div>
            </div>
            <div class="row mb-3">
                <label for="userAddress" class="col-md-4 col-lg-3 col-form-label">주소</label>
                <div class="col-md-8 col-lg-9">
                    <input
                        type="text"
                        class="form-control"
                        id="userAddress"
                        name="userAddress"
                        v-model="userInfo.userAddress"
                        @click="activeModal"
                        readonly
                    />
                </div>
                <Modal title="주소 검색" v-model:visible="isVisible">
                    <VueDaumPostcode @complete="addressSearched" no-submit-mode="true" />
                </Modal>
            </div>

            <div class="text-center">
                <button type="button" class="btn btn-primary" @click="updateMember">수정</button>
            </div>
        </form>
    </div>
</template>

<style scoped></style>
