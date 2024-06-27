<script setup>
import { ref } from "vue";
import { getResponseFromChatGPT } from "@/api/chatGPT";

const inputDong = ref("");
const inputCategory = ref("");
const response = ref(null);

const fetchResponse = async () => {
    try {
        response.value = await getResponseFromChatGPT(inputDong.value, inputCategory.value);
    } catch (error) {
        console.error("ChatGPT 응답 조회 실패:", error);
    }
};
</script>

<template>
    <div>
        <input v-model="inputDong" placeholder="동..." />
        <input v-model="inputCategory" placeholder="정보 구분..." @keyup.enter="fetchResponse" />
        <button @click="fetchResponse">응답 받기</button>
        <div v-show="response">{{ response }}</div>
    </div>
</template>

<style scoped></style>
