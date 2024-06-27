<script setup>
import { ref, onMounted } from 'vue';
import { useMemberStore } from '@/stores/member';
import { quillEditor } from 'vue3-quill';
import { storeToRefs } from 'pinia';
import axios from 'axios';
const memberStore = useMemberStore();
const { userInfo, isLogin } = storeToRefs(memberStore);
const comments = ref([]);
const props = defineProps(['aptCode']);

const newComment = ref('');

const addComment = async () => {
    await axios
        .post('http://localhost:8080/myhome/house/insertReview', {
            aptCode: props.aptCode,
            reviewText: newComment.value,
            userId: userInfo.value.userId,
        })
        // eslint-disable-next-line no-unused-vars
        .then((response) => {
            newComment.value = '';
        })
        .catch((error) => {
            console.log(error);
        });
    fetchComments();
};

const fetchComments = async () => {
    console.log(props);
    await axios
        .get(`http://localhost:8080/myhome/house/listReview/${props.aptCode}`)
        .then(({ data }) => {
            comments.value = data;
            console.log(data);
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
    <div>
        <h4 class="fw-semibold ms-1">
            <img width="30" height="30" src="https://img.icons8.com/ios/50/features-list.png" alt="features-list" />
            <span> 리뷰</span>
        </h4>
        <h6 v-text="comments.length + '개의 리뷰가 있습니다.'" class="ms-2 mt-1"></h6>
        <!-- 댓글 목록 -->
        <div v-for="comment in comments" :key="comment.reviewCode">
            <div class="card my-3 rounded">
                <div class="card-header d-flex justify-content-between">
                    <div class="mx-2">
                        <span class="">작성자: </span>
                        <span class="ms-2">{{ comment.userId }}</span>
                    </div>

                    <div class="mx-2">
                        {{ comment.time }}
                    </div>
                </div>
                <div class="card-body">
                    <p class="mt-2" v-html="comment.reviewText"></p>
                </div>
            </div>
        </div>

        <!-- 댓글 작성 -->
        <div class="card" v-if="isLogin">
            <div class="card-body">
                <h5 class="card-title fw-semibold">리뷰 작성</h5>
                <quillEditor v-model:value="newComment" style="height: 100px" />
                <button class="btn btn-primary mt-3" @click="addComment">댓글 추가</button>
            </div>
        </div>
    </div>
</template>

<style></style>
