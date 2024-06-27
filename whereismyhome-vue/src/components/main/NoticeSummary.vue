<script setup>
import router from "@/router";
import axios from "axios";
import { ref } from "vue";

const notices = ref([]);

axios.get("http://localhost:8080/myhome/notice/10").then(({ data }) => {
    notices.value = data;
});

const goDetail = (id) => {
    router.push({ name: "noticeDetail", params: { noticeId: id } });
};

const goMore = () => {
    router.push({ name: "noticeList" });
};
</script>

<template>
    <div class="notice-div">
        <div class="card recent-sales overflow-auto">
            <div class="card-body">
                <div class="d-flex align-items-center justify-content-between">
                    <div>
                        <h4 class="card-title fw-semibold fs-4">공지사항</h4>
                    </div>
                    <div>
                        <button class="btn btn-secondary btn-sm me-2" @click="goMore()">
                            더 보기
                        </button>
                    </div>
                </div>

                <table class="table table-hover table-borderless datatable">
                    <tbody>
                        <tr v-if="notices.length === 0">
                            <td>등록된 공지가 없습니다.</td>
                        </tr>
                        <tr v-for="notice in notices" :key="notice.id" @click="goDetail(notice.id)">
                            <td style="overflow: hidden">
                                <a href="#" class="link-dark">{{ notice.title }}</a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <!-- End Recent Sales -->
</template>

<style scoped>
/* .notice-div {
    margin-top: 50px;
    padding: 2rem;
} */
</style>
