<script setup>
import { ref, reactive, onMounted } from "vue";
import { useRoute, useRouter } from "vue-router";
import Axios from "axios";
import { quillEditor } from "vue3-quill";
import Swal from "sweetalert2";
const route = useRoute();
const router = useRouter();

const board = ref({});

onMounted(async () => {
    Axios.get(`http://localhost:8080/myhome/board/${route.params.boardId}`).then(({ data }) => {
        board.value = data;
    });
});

const updateNotice = () => {
    Axios.put(`http://localhost:8080/myhome/board/${route.params.boardId}`, {
        id: board.value.id,
        title: board.value.title,
        content: board.value.content,
        //userId: "",
        // created: '',
        // viewCnt: 0,
    }).then(({ data }) => {
        console.log(data);
        Swal.fire({
            title: "글 수정 완료!",
            text: "게시글 수정에 성공하였습니다.",
            icon: "success",
        });
        router.push({ name: "boardDetail", params: { boardId: board.value.id } });
    });
};
</script>

<template>
    <div class="container col-12 notice-update-div justify-content-center">
        <div class="card profile">
            <div class="profile-overview">
                <div class="card-header">
                    <form>
                        <div class="row mb-3">
                            <label for="title" class="col-form-label fs-6 fw-semibold">제목</label>
                            <div>
                                <input
                                    type="text"
                                    class="form-control"
                                    id="title"
                                    name="title"
                                    v-model="board.title"
                                    placeholder="제목을 입력하세요."
                                />
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="content" class="col-form-label fs-6 fw-semibold">
                                내용
                            </label>
                            <div style="height: 300px">
                                <quillEditor v-model:value="board.content"></quillEditor>
                            </div>
                        </div>

                        <div style="height: 100px"></div>

                        <div class="text-center">
                            <button type="button" class="btn btn-primary" @click="updateNotice">
                                수정 완료
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</template>

<style scoped>
.notice-update-div {
    margin-top: 50px;
    padding: 2rem;
}
</style>
