<script setup>
import axios from "axios";
import { ref, onMounted } from "vue";
import { useRouter } from "vue-router";

const props = defineProps({
    display: String,
});

const router = useRouter();
const newsList = ref([]);
const isLoading = ref(false);

onMounted(async () => {
    isLoading.value = true;
    axios.get(`http://localhost:8080/myhome/news/${props.display}`).then(({ data }) => {
        newsList.value = data.items;
        isLoading.value = false;
    });
});

//날짜 형식 변환
function convertDate(date) {
    let converted = new Date(date);
    let convertedString =
        converted.getFullYear().toString() +
        "-" +
        converted.getMonth().toString() +
        "-" +
        converted.getDate().toString() +
        " " +
        converted.getHours().toString() +
        ":" +
        converted.getMinutes().toString();
    return convertedString;
}

function goMore() {
    router.push({ name: "news" });
}
</script>

<template>
    <div class="news-div">
        <div class="card recent-sales overflow-hidden">
            <div class="card-body">
                <div class="d-flex align-items-center justify-content-between">
                    <div class="d-flex align-items-center justify-content-start">
                        <div>
                            <h4 class="card-title fw-semibold fs-4">부동산 뉴스</h4>
                        </div>
                        <div>
                            <small class="text-secondary ms-3 text-small"
                                >{{ props.display }} 개</small
                            >
                        </div>
                    </div>
                    <div>
                        <button class="btn btn-secondary btn-sm me-2" @click="goMore()">
                            더 보기
                        </button>
                    </div>
                </div>
                <div>
                    <table class="table table-hover datatable">
                        <colgroup>
                            <col width="90%" />
                            <col width="10%" />
                        </colgroup>
                        <tbody>
                            <!-- Center aligned spinner -->
                            <div class="d-flex justify-content-center" v-if="isLoading == true">
                                <div class="spinner-border" role="status">
                                    <span class="visually-hidden">Loading...</span>
                                </div>
                            </div>
                            <!-- End Center aligned spinner -->
                            <tr v-else-if="newsList.length === 0">
                                <td>조회되는 뉴스가 없습니다.</td>
                            </tr>
                            <tr v-for="news in newsList" :key="news.title">
                                <td>
                                    <a
                                        :href="news.originallink"
                                        target="_blank"
                                        class="link-dark table-link"
                                        v-html="news.title"
                                    >
                                    </a>
                                </td>
                                <td>
                                    <span class="badge bg-secondary">
                                        {{ convertDate(news.pubDate) }}
                                    </span>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <!-- End Recent Sales -->
</template>

<style scoped>
/* .news-div {
    margin-top: 50px;
    padding: 2rem;
} */

.table-link {
    text-overflow: ellipsis;
    white-space: pre-line;
    overflow: hidden;
}
</style>
