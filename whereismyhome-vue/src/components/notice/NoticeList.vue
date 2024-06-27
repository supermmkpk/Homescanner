<script setup>
import axios from "axios";
import { useRouter } from "vue-router";
import { useMemberStore } from "@/stores/member";
import { storeToRefs } from "pinia";
import { ref } from "vue";

const router = useRouter();
const memberStore = useMemberStore();
const { isAdmin } = storeToRefs(memberStore);

const notices = ref([]);

axios.get("http://localhost:8080/myhome/notice").then(({ data }) => {
    notices.value = data;
});

const goDetail = (id) => {
    router.push({ name: "noticeDetail", params: { noticeId: id } });
};
const createNotice = () => {
    router.push({ name: "noticeCreateAdmin" });
};
</script>

<template>
    <div class="notice-list-div">
        <div class="col-12">
            <div class="card recent-sales overflow-auto">
                <div class="card-body">
                    <div class="d-flex align-items-center justify-content-between">
                        <div>
                            <h4 class="card-title fw-semibold fs-4">공지사항 조회</h4>
                        </div>
                        <div v-if="isAdmin == true">
                            <button class="btn btn-secondary btn-sm me-2" @click="createNotice()">
                                공지사항 작성
                            </button>
                        </div>
                    </div>
                    <table class="table table-hover datatable">
                        <colgroup>
                            <col width="90%" />
                            <col width="10%" />
                        </colgroup>
                        <tbody>
                            <tr v-if="notices.length === 0">
                                <td colspan="2">등록된 글이 없습니다.</td>
                            </tr>
                            <tr
                                v-for="notice in notices"
                                :key="notice.id"
                                @click="goDetail(notice.id)"
                            >
                                <td style="text-overflow: ellipsis">
                                    <a href="#" class="link-dark">{{ notice.title }}</a>
                                </td>
                                <td>
                                    <span class="badge bg-secondary">{{ notice.regTime }}</span>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</template>

<style scoped>
.notice-list-div {
    margin-top: 50px;
    padding: 2rem;
}
</style>
