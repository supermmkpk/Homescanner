<!-- eslint-disable no-unused-vars -->
<script setup>
import { useRouter, onBeforeRouteLeave, onBeforeRouteUpdate } from "vue-router";
import { ref, onMounted } from "vue";
import Axios from "axios";
import { useMemberStore } from "@/stores/member";
import { storeToRefs } from "pinia";

const memberStore = useMemberStore();
const { isLogin } = storeToRefs(memberStore);

const list = ref([]);
const url = "http://localhost:8080/myhome/board";
const router = useRouter();
onMounted(() => {
    getBoardList();
});
const getBoardList = () => {
    Axios.get(url)
        .then(({ data }) => {
            console.log(data);
            list.value = data;
        })
        .catch((err) => {
            console.log(err);
        });
};
const createBoard = () => {
    router.push({
        name: "boardCreate",
    });
};
onBeforeRouteLeave((to, from) => {
    console.log("gggg");
});
onBeforeRouteUpdate((to, from) => {
    console.log("hhhhh");
});

const goDetail = (id) => {
    router.push({ name: "boardDetail", params: { boardId: id } });
};

const deleteItem = (id) => {
    if (confirm(id + "번 글을 삭제하시겠습니까?")) {
        Axios.delete(`http://localhost:8080/myhome/board/${id}`);
        router.go({ name: "board" });
    }
};
</script>

<template>
    <div class="board-list-div">
        <div class="col-12">
            <div class="card recent-sales overflow-auto">
                <div class="card-body">
                    <div class="d-flex align-items-center justify-content-between">
                        <div>
                            <h4 class="card-title fw-semibold fs-4">커뮤니티 게시판</h4>
                        </div>
                        <div v-show="isLogin">
                            <button class="btn btn-secondary btn-sm me-2" @click="createBoard()">
                                글 쓰기
                            </button>
                        </div>
                    </div>
                    <table class="table table-hover datatable">
                        <colgroup>
                            <col width="80%" />
                            <col width="20%" />
                        </colgroup>
                        <tbody>
                            <tr v-if="list.length === 0">
                                <td colspan="2">등록된 글이 없습니다.</td>
                            </tr>

                            <tr v-for="board in list" :key="board.id" @click="goDetail(board.id)">
                                <td style="text-overflow: ellipsis">
                                    <a href="#" class="link-dark"> {{ board.title }}</a>
                                </td>
                                <td>
                                    <small>조회&nbsp;{{ board.viewCnt }}&emsp;</small>
                                    <span class="badge bg-secondary">{{ board.time }}</span>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- <td>
                            <button
                                type="button"
                                id="deleteButton"
                                class="btn btn-link link-danger"
                                @click.stop="deleteItem(board.id)"
                            >
                                <i class="bi bi-trash"></i>
                            </button>
                            <form>
                                <input type="hidden" name="id" value="${notice.id}" />
                            </form>
                        </td> -->

    <!-- <button
                    type="button"
                    @click="createBoard"
                    style="
                        background-color: #ff6d5a;
                        color: white;
                        border: none;
                        border-radius: 4px;
                        padding: 4px 8px;
                    "
                >
                    글 쓰기
                </button> -->
</template>

<style scoped>
.board-list-div {
    margin-top: 50px;
    padding: 2rem;
}
</style>
