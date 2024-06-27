<script setup>
import { ref } from "vue";
import axios from "axios";
import Swal from "sweetalert2";
import { useMemberStore } from "@/stores/member";
import { useRouter } from "vue-router";

const router = useRouter();

const { userLogout } = useMemberStore();
const props = defineProps({
    userInfo: Object,
});

const deleteMember = async () => {
    const { value: confirmDelete } = await Swal.fire({
        title: "정말 탈퇴하시겠습니까? \n 탈퇴하시면 되돌릴 수 없습니다!",
        input: "text",
        inputLabel: "아래에 '탈퇴'를 입력해 주세요",
        showCancelButton: true,
        inputValidator: (value) => {
            if (!value || value != "탈퇴") {
                return "입력값이 틀립니다.";
            }
        },
        showCancelButton: true,
        confirmButtonText: "탈퇴",
        cancelButtonText: "취소",
        confirmButtonColor: "#d33",
        cancelButtonColor: "#7a7878",
        icon: "warning",
    });
    if (confirmDelete === "탈퇴") {
        axios
            .delete(`http://localhost:8080/myhome/member/delete/${props.userInfo.userId}`)
            .then((response) => {
                console.log(response);
                Swal.fire({
                    title: "탈퇴 성공",
                    text: "회원 탈퇴하여 로그아웃합니다.",
                    icon: "success",
                });
                userLogout();
                router.push({ name: "home" });
            })
            .catch((error) => {
                console.log(error);
            });
    }
};
</script>

<template>
    <div class="tab-content pt-2">
        <div class="tab-pane fade show active profile-overview" id="profile-overview">
            <div class="row justify-content-center">
                <button class="btn btn-danger btn-lg mt-4 col-6" @click="deleteMember">
                    회원 탈퇴하기
                </button>
            </div>
        </div>
    </div>
</template>

<style scoped></style>
