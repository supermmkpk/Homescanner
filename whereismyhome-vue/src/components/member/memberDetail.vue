<script setup>
import { useRoute, useRouter } from "vue-router";
import { ref, onMounted } from "vue";
import Axios from "axios";

const route = useRoute();
const router = useRouter();
// const userInfo = ref({
//     userId: "",
//     userEmail: "",
//     userName: "",
//     userAddress: "",
//     userMobile: "",
//     joinDate: "",
//     role: "",
// });

// onMounted(() => {
//     getMemberDetail();
// });
// const getMemberDetail = () => {
//     console.log(userId.value);
//     const url = `http://localhost:8080/member/${userId.value}`;

//     Axios.get(url)
//         .then(({ data }) => {
//             userInfo.value = data;
//         })
//         .catch();
// };
// const deleteItem = () => {
//     const url = `http://localhost:8080/member/delete/${route.query.userId}`;
//     Axios.delete(url)
//         .then(() => {
//             router.push({ name: "memberList" });
//         })
//         .catch();
// };
// const updateItem = () => {
//     router.push({
//         name: "memberUpdate",
//         query: {
//             userId: userInfo.value.userId,
//             userEmail: userInfo.value.userEmail,
//             userName: userInfo.value.userName,
//             userAddress: userInfo.value.userAddress,
//             userMobile: userInfo.value.userMobile,
//         },
//     });
// };
defineProps({
    userInfo: Object,
});
</script>

<template>
    <div class="tab-content pt-2">
        <div class="tab-pane fade show active profile-overview" id="profile-overview">
            <h5 class="card-title fw-bold">프로필 상세</h5>

            <div class="row">
                <div class="col-lg-3 col-md-4 label">이름</div>
                <div class="col-lg-9 col-md-8">{{ userInfo.userName }}</div>
            </div>

            <div class="row">
                <div class="col-lg-3 col-md-4 label">휴대폰 번호</div>
                <div class="col-lg-9 col-md-8">
                    {{ userInfo.userMobile }}
                </div>
            </div>

            <div class="row">
                <div class="col-lg-3 col-md-4 label">이메일</div>
                <div class="col-lg-9 col-md-8">
                    {{ userInfo.userEmail }}
                </div>
            </div>

            <div class="row">
                <div class="col-lg-3 col-md-4 label">주소</div>
                <div class="col-lg-9 col-md-8">
                    {{ userInfo.userAddress }}
                </div>
            </div>

            <div class="row">
                <div class="col-lg-3 col-md-4 label">가입일시</div>
                <div class="col-lg-9 col-md-8">
                    {{ userInfo.joinDate }}
                </div>
            </div>

            <div class="row">
                <div class="col-lg-3 col-md-4 label">회원구분</div>
                <div class="col-lg-9 col-md-8">
                    <span v-if="userInfo.role === 'user'">일반회원</span>
                    <span v-else-if="userInfo.role === 'admin'">관리자</span>
                </div>
            </div>
        </div>
    </div>
</template>

<style scoped></style>
