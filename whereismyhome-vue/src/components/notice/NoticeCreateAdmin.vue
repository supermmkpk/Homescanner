<!-- eslint-disable no-unused-vars -->
<script setup>
import { ref, onMounted } from "vue";
import { useRoute, useRouter } from "vue-router";
import Axios from "axios";
import { quillEditor } from "vue3-quill";
import Swal from "sweetalert2";
import { useMemberStore } from "@/stores/member";
import { storeToRefs } from "pinia";

const memberStore = useMemberStore();
const { userInfo } = storeToRefs(memberStore);

const route = useRoute();
const router = useRouter();

const title = ref("");
const content = ref("");
const url = "http://localhost:8080/myhome/notice/regist";
const createNotice = () => {
    Axios.post(url, {
        // id: 0,
        title: title.value,
        contents: content.value,
        regId: userInfo.value.userId,
        //regTime: ""
    })
        .then(function (response) {
            console.log(response);
            Swal.fire({
                title: "공지사항 작성 완료!",
                text: "공지사항 작성에 성공하였습니다.",
                icon: "success",
            });
            router.push({
                name: "noticeList",
            });
        })
        .catch(function (error) {
            console.log(error);
        });
};
</script>

<template>
    <div class="container col-12 board-create-div justify-content-center">
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
                                    v-model="title"
                                    placeholder="제목을 입력하세요."
                                />
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="content" class="col-form-label fs-6 fw-semibold">
                                내용
                            </label>
                            <div style="height: 300px">
                                <quillEditor v-model:value="content" />
                            </div>
                        </div>

                        <div style="height: 100px"></div>

                        <div class="text-center">
                            <button type="button" class="btn btn-primary" @click="createNotice">
                                작성 완료
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</template>

<style scoped>
.board-create-div {
    margin-top: 50px;
    padding: 2rem;
}
</style>
