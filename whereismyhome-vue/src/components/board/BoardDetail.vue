<script setup>
import axios from "axios";
import { useRoute, useRouter } from "vue-router";
import { onMounted, ref } from "vue";
import Swal from "sweetalert2";
import { useMemberStore } from "@/stores/member";
import { storeToRefs } from "pinia";
import CommentList from "@/components/comment/CommentList.vue";

const memberStore = useMemberStore();
const { userInfo, isLogin } = storeToRefs(memberStore);

const router = useRouter();
const route = useRoute();
const board = ref({});
const comments = ref([]);

axios.get(`http://localhost:8080/myhome/board/${route.params.boardId}`).then(({ data }) => {
    console.log(data);
    board.value = data;
});

function deleteArticle(id) {
    Swal.fire({
        title: "해당 게시글을 삭제하시겠습니까?",
        showCancelButton: true,
        confirmButtonText: "삭제",
        cancelButtonText: "취소",
        icon: "info",
    }).then((result) => {
        if (result.isConfirmed) {
            axios
                .delete(`http://localhost:8080/myhome/board/${id}`)
                .then((response) => {
                    console.log(response);
                    Swal.fire({
                        title: "글 삭제 완료!",
                        text: "게시글 삭제에 성공하였습니다.",
                        icon: "success",
                    });
                    router.push({ name: "boardList" });
                })
                .catch((error) => {
                    console.log(error);
                });
        }
    });
}

const goList = () => {
    router.push({ name: "boardList" });
};

const fetchComments = async () => {
    await axios
        .get(`http://localhost:8080/myhome/comment/${route.params.boardId}`)
        .then(({ data }) => {
            comments.value = data;
            console.log(comments.value);
        })
        .catch((error) => {
            console.log(error);
        });
};

onMounted(async () => {
    await fetchComments();
});
</script>

<template>
    <div class="container col-xl-8 board-detail-div justify-content-center">
        <div class="card profile">
            <div class="profile-overview">
                <div class="card-header">
                    <h2 class="fw-semibold text-dark">{{ board.title }}</h2>
                    <div style="line-height: 1.2" class="d-flex justify-content-between">
                        <div>
                            <small>{{ board.userId }}</small>
                            <br />
                            <small>{{ board.time }}</small>
                            <br />
                            <small>조회수 {{ board.viewCnt }}</small>
                        </div>
                        <div v-show="isLogin && userInfo.userId == board.userId">
                            <RouterLink
                                :to="{ name: 'boardUpdate', params: { boardId: board.id } }"
                                class="link-primary me-3 fs-4"
                            >
                                <i class="bi bi-pencil-square"></i>
                            </RouterLink>
                            <a
                                href="#"
                                class="link-danger me-2 fs-4"
                                @click="deleteArticle(board.id)"
                            >
                                <i class="bi bi-trash-fill"></i>
                            </a>
                        </div>
                    </div>
                </div>

                <div class="card-body pt-3">
                    <div class="row">
                        <div
                            class="col-lg-9 col-md-8 board-content-div"
                            v-html="board.content"
                        ></div>
                    </div>
                </div>
            </div>
        </div>
        <CommentList :comments="comments" :board-id="board.id" @fetchComments="fetchComments" />
        <button class="col-12 btn btn-secondary" @click="goList">목록으로...</button>
    </div>
</template>

<style>
.board-detail-div {
    padding: 2rem;
    margin-top: 50px;
}
.label {
    font-weight: 600;
    color: rgba(1, 41, 112, 0.6);
}
.board-content-div img {
    max-width: 90%;
}
</style>
