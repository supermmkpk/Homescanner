<script setup>
import { ref, onMounted, onUnmounted } from "vue";
import { storeToRefs } from "pinia";
import { useMemberStore } from "@/stores/member";

const memberStore = useMemberStore();
const { userInfo } = storeToRefs(memberStore);

const messages = ref([]);
const newMessage = ref("");
const socket = new WebSocket("ws://localhost:8080/myhome/ws/chat");

onMounted(() => {
    // socket = new WebSocket("ws://" + location.host + "/ws/chat");

    socket.onmessage = (event) => {
        messages.value.push(event.data);
    };
});

function send() {
    if (newMessage.value !== "") {
        socket.send(newMessage.value);
        newMessage.value = "";
    }
}

onUnmounted(() => {
    if (socket) {
        socket.close();
    }
});

socket.onopen = function (event) {
    console.log("WebSocket is open now.");
};

socket.onmessage = function (event) {
    console.log("Received message:", event.data);
};

socket.onclose = function (event) {
    console.log("WebSocket is closed now.");
};

socket.onerror = function (error) {
    console.log("WebSocket error:", error);
};
</script>

<template>
    <div style="height: 50px"></div>
    <div class="my-5">
        <div class="col-6 mx-auto">
            <div class="card p-4 rounded-5 bg-light">
                <h4 class="fw-bold mb-2 ms-1">채팅</h4>
                <div style="min-height: 70vh" class="d-flex justify-content-end">
                    <div class="col-4">
                        <div
                            class="card rounded-2 text-end fs-5 p-2"
                            style="background-color: #f1f4f9"
                            v-for="msg in messages"
                            :key="msg.id"
                        >
                            {{ msg }}
                        </div>
                    </div>
                </div>
                <form class="row g-3 d-flex align-items-center" @submit.prevent>
                    <div class="col-11">
                        <input
                            class="form-control"
                            v-model="newMessage"
                            @keyup.enter="send"
                            placeholder="메시지를 입력하세요"
                        />
                    </div>
                    <div class="col-auto">
                        <button type="button" class="btn btn-primary btn-sm" @click="send">
                            전송
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</template>

<style scoped></style>
