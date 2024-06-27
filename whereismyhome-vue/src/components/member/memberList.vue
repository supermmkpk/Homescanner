<!-- eslint-disable no-unused-vars -->
<script setup>
import { ref, onMounted } from "vue";
import Axios from "axios";
import { useRouter, onBeforeRouteLeave, onBeforeRouteUpdate } from "vue-router";
const members = ref([]);
const router = useRouter();
onMounted(() => {
    getMemberList();
});
const getMemberList = () => {
    const url = "http://localhost:8080/myhome/member/list";
    Axios.get(url)
        .then(({ data }) => {
            members.value = data;
        })
        .catch();
};
onBeforeRouteLeave((to, from) => {
    console.log("gggg");
});
onBeforeRouteUpdate((to, from) => {
    console.log("hhhhh");
});
const goDetail = (userId) => {
    router.push({ name: "memberDetail", query: { userId: userId } });
};
</script>

<template>
    <div class="member-list-div">
        <div class="col-12">
            <div class="card recent-sales overflow-auto">
                <div class="card-body">
                    <div class="d-flex align-items-center justify-content-between">
                        <div>
                            <h4 class="card-title fw-semibold fs-4">등록 회원 목록</h4>
                        </div>
                    </div>

                    <div class="col-xl-10 offset-xl-1">
                        <table class="table table-hover text-center">
                            <tr>
                                <th>유저 아이디</th>
                                <th>유저 이메일</th>
                                <th>유저 이름</th>
                                <th>유저 폰 번호</th>
                                <th>유저 집 주소</th>
                            </tr>
                            <tbody>
                                <tr v-if="members.length === 0">
                                    <td colspan="5">등록된 회원이 없습니다.</td>
                                </tr>
                                <tr v-for="member in members" :key="member.userId">
                                    <td>{{ member.userId }}</td>
                                    <td>{{ member.userEmail }}</td>
                                    <td>{{ member.userName }}</td>
                                    <td>{{ member.userMobile }}</td>
                                    <td>{{ member.userAddress }}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<style scoped>
.member-list-div {
    margin-top: 50px;
    padding: 2rem;
}
</style>
