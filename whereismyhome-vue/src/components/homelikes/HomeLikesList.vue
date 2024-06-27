<script setup>
import { useRoute, useRouter } from "vue-router";
import { ref, onMounted } from "vue";
import Swal from "sweetalert2";
import axios from "axios";

const route = useRoute();
const router = useRouter();

const props = defineProps({
    userInfo: Object,
});

const likeList = ref([]);

onMounted(async () => {
    await listLikes();
});

async function listLikes() {
    console.log("listLikes 호출");
    axios
        .get(`http://localhost:8080/myhome/homeLikes/list/${props.userInfo.userId}`)
        .then(({ data }) => {
            likeList.value = data;
            console.log(likeList);
        })
        .catch((error) => {
            Swal.fire({
                title: "좋아요 조회 실패...",
                text: "좋아요 목록 불러오기에 실패하였습니다. 잠시후 다시 시도해 주세요.",
                icon: "error",
            });
        });
}

function goDetail(id) {
    router.push({
        name: "homeDetail",
        query: {
            aptCode: id,
        },
    });
}
</script>

<template>
    <div class="tab-content pt-2">
        <div class="tab-pane fade show active profile-overview" id="profile-overview">
            <h5 class="card-title fw-bold">찜 목록</h5>

            <table class="table table-hover datatable">
                <tbody>
                    <tr v-if="likeList.length === 0">
                        <td>찜한 아파트가 없습니다.</td>
                    </tr>
                    <tr v-for="like in likeList" :key="like.likeId" @click="goDetail(like.aptCode)">
                        <td style="text-overflow: ellipsis">
                            <a href="#" class="link-dark">{{ like.apartmentName }}</a>
                        </td>
                        <!-- <td>
                            <span class="badge bg-secondary">{{ notice.regTime }}</span>
                        </td> -->
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</template>

<style scoped></style>
