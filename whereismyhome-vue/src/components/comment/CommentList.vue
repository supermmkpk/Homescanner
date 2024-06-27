<script setup>
import axios from 'axios';
import { ref } from 'vue';
import { quillEditor } from 'vue3-quill';
import { storeToRefs } from 'pinia';
import Swal from 'sweetalert2';
import { useMemberStore } from '@/stores/member';

const memberStore = useMemberStore();
const { userInfo, isLogin } = storeToRefs(memberStore);

const props = defineProps({
    comments: Object,
    boardId: Number,
});

const emit = defineEmits(['fetchComments']);

const newComment = ref('');

const addComment = async () => {
    await axios
        .post('http://localhost:8080/myhome/comment/regist', {
            content: newComment.value,
            userId: userInfo.value.userId,
            boardId: props.boardId,
        })
        .then((response) => {
            newComment.value = '';
            emit('fetchComments');
        })
        .catch((error) => {
            console.log(error);
        });
};

const deleteComment = async (id) => {
    Swal.fire({
        title: '해당 댓글을 삭제하시겠습니까?',
        showCancelButton: true,
        confirmButtonText: '삭제',
        cancelButtonText: '취소',
        icon: 'info',
    }).then(async (result) => {
        if (result.isConfirmed) {
            await axios
                .delete(`http://localhost:8080/myhome/comment/delete/${id}`)
                .then((response) => {
                    emit('fetchComments');
                })
                .catch((error) => {
                    console.log(error);
                });
        }
    });
};
</script>

<template>
    <h6 v-text="comments.length + '개의 댓글이 있습니다.'" class="ms-2 mt-1"></h6>
    <!-- 댓글 목록 -->
    <div v-for="comment in comments" :key="comment.id">
        <div class="card my-3 rounded">
            <div class="card-header d-flex justify-content-between">
                <div class="mx-2">
                    <i class="bi bi-chat-square-fill"></i>
                    <span class="ms-2">{{ comment.userId }}</span>
                    <a
                        href="#"
                        class="link-danger ms-2"
                        @click="deleteComment(comment.id)"
                        v-show="isLogin && userInfo.userId == comment.userId"
                    >
                        <i class="bi bi-trash-fill"></i>
                    </a>
                </div>

                <div class="mx-2">
                    {{ comment.time }}
                </div>
            </div>
            <div class="card-body">
                <p class="mt-2" v-html="comment.content"></p>
            </div>
        </div>
    </div>

    <!-- 댓글 작성 -->
    <div class="card" v-if="isLogin">
        <div class="card-body">
            <h5 class="card-title fw-semibold">댓글 작성</h5>
            <quillEditor v-model:value="newComment" style="height: 100px" />
            <button class="btn btn-primary mt-3" @click="addComment">댓글 추가</button>
        </div>
    </div>
</template>

<style scoped></style>
