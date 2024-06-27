<script setup>
import axios from "axios";
import { useRoute, useRouter } from "vue-router";
import { ref } from "vue";
import { useMemberStore } from "@/stores/member";
import { storeToRefs } from "pinia";
import Swal from "sweetalert2";

const memberStore = useMemberStore();
const { userInfo, isLogin } = storeToRefs(memberStore);

const router = useRouter();
const route = useRoute();
const notice = ref({});

axios
    .get(`http://localhost:8080/myhome/notice/detail/${route.params.noticeId}`)
    .then(({ data }) => {
        console.log(data);
        notice.value = data;
    });

function deleteNotice(id) {
    Swal.fire({
        icon: "info",
        title: "해당 공지사항을 삭제하시겠습니까?",
        showCancelButton: true,
        confirmButtonText: "삭제",
        cancelButtonText: "취소",
    }).then((result) => {
        if (result.isConfirmed) {
            axios
                .delete(`http://localhost:8080/myhome/notice/delete/${id}`)
                .then((response) => {
                    console.log(response);
                    Swal.fire({
                        title: "공지사항 삭제 완료!",
                        text: "공지사항 삭제에 성공하였습니다.",
                        icon: "success",
                    });
                    router.push({ name: "noticeList" });
                })
                .catch((error) => {
                    console.log(error);
                });
        }
    });
}
</script>

<template>
    <div class="container col-xl-8 notice-detail-div justify-content-center">
        <div class="card profile">
            <div class="profile-overview">
                <div class="card-header">
                    <h2 class="fw-semibold text-dark">{{ notice.title }}</h2>
                    <div style="line-height: 1.2" class="d-flex justify-content-between">
                        <div>
                            <small>{{ notice.regId }}</small>
                            <br />
                            <small>{{ notice.regTime }}</small>
                        </div>
                        <div v-show="isLogin && userInfo.role == 'admin'">
                            <RouterLink
                                :to="{ name: 'noticeUpdateAdmin', query: { id: notice.id } }"
                                class="link-primary me-3 fs-4"
                            >
                                <i class="bi bi-pencil-square"></i>
                            </RouterLink>
                            <a
                                href="#"
                                :to="{ name: 'noticeUpdateAdmin' }"
                                class="link-danger me-2 fs-4"
                                @click="deleteNotice(notice.id)"
                            >
                                <i class="bi bi-trash-fill"></i>
                            </a>
                        </div>
                    </div>
                </div>

                <div class="card-body pt-3">
                    <div class="row">
                        <div class="col-lg-9 col-md-8" v-html="notice.contents"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<style scoped>
.notice-detail-div {
    padding: 2rem;
    margin-top: 50px;
}
.label {
    font-weight: 600;
    color: rgba(1, 41, 112, 0.6);
}
</style>
