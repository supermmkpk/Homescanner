<!-- eslint-disable no-unused-vars -->
<script setup>
import { ref, watch, onMounted } from "vue";
import { useRoute, useRouter } from "vue-router";
import Axios from "axios";
import { quillEditor } from "vue3-quill";
import Quill from "quill";
import "quill/dist/quill.snow.css";
import { storeToRefs } from "pinia";
import Swal from "sweetalert2";
import { useMemberStore } from "@/stores/member";
import axios from "axios";

const memberStore = useMemberStore();
const { userInfo } = storeToRefs(memberStore);

const route = useRoute();
const router = useRouter();

const title = ref("");
const content = ref("");
const url = "http://localhost:8080/myhome/board";
const createBoard = () => {
    Axios.post(url, {
        // id: 0,
        title: title.value,
        content: content.value,
        userId: userInfo.value.userId,
        // created: '',
        // viewCnt: 0,
    })
        .then(function (response) {
            console.log(response);
            Swal.fire({
                title: "글 작성 완료!",
                text: "게시글 작성에 성공하였습니다.",
                icon: "success",
            });
            router.push({
                name: "boardList",
            });
        })
        .catch(function (error) {
            console.log(error);
        });
};

const editorContainer = ref(null);

onMounted(() => {
    const quill = new Quill(editorContainer.value, {
        theme: "snow",
        modules: {
            toolbar: {
                container: [["bold", "italic", "underline", "strike"], ["image"]],
                handlers: {
                    image: async () => {
                        await selectLocalImage(quill);
                    },
                },
            },
        },
    });
    // Quill content change handler
    quill.on("text-change", () => {
        content.value = quill.root.innerHTML;
    });
    // Watch for content changes from v-model
    watch(content, (newValue) => {
        if (newValue !== quill.root.innerHTML) {
            quill.root.innerHTML = newValue;
        }
    });
});

const inVal = ref();
async function selectLocalImage(quill) {
    const input = document.createElement("input");
    input.setAttribute("type", "file");
    input.setAttribute("accept", "image/*");
    input.click();

    input.onchange = async () => {
        const file = input.files[0];
        console.log(file);
        if (file) {
            // 서버에 이미지 업로드
            const formData = new FormData();
            formData.append("image", file);
            console.log(formData);

            // 예시: 이미지 업로드 함수 (실제 구현 필요)
            const imageName = await uploadImage(formData);
            const imageUrl = "http://localhost:8080/myhome/file/display/" + imageName;
            console.log(imageUrl);

            // 에디터에 이미지 삽입
            const range = quill.getSelection(true);
            quill.insertEmbed(range.index, "image", imageUrl);
            // 이미지 크기 조정
            const img = quill.container.querySelector(`img[src="${imageUrl}"]`);
            quill.setSelection(range.index + 1);
        }
    };
}

async function uploadImage(formData) {
    let ret = null;
    await axios
        .post("http://localhost:8080/myhome/file/upload", formData, {
            headers: {
                "Content-Type": "multipart/form-data",
            },
        })
        .then(({ data }) => {
            console.log(data);
            ret = data;
        })
        .catch((error) => {
            console.log(error);
            return;
        });

    return ret;
}
async function displayImage(image) {
    await axios
        .post(`http://localhost:8080/myhome/file/display?fileName=${image}`)
        .then(({ data }) => {
            console.log(data);
            return data;
        })
        .catch((error) => {
            console.log(error);
            return;
        });
}
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
                                <div ref="editorContainer"></div>
                                <!-- <quillEditor v-model:value="content" /> -->
                            </div>
                        </div>

                        <div style="height: 100px"></div>

                        <div class="text-center">
                            <button type="button" class="btn btn-primary" @click="createBoard">
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
