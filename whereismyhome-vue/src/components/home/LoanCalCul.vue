<script setup>
import { ref, computed } from 'vue';
const props = defineProps(['max']);
const loanValue = ref(0);
const cValue = computed(() => {
    var value = (loanValue.value * 100000000) / ((1 - 1.0025 ** -480) / 0.0025);
    return value.toFixed(0);
});
</script>

<template>
    <div
        class="container"
        style="
            width: 100%;
            background-color: white;
            border: 2px solid whitesmoke;
            text-align: center;
            border-radius: 10px;
        "
    >
        <p>대출계산기 (금융감독원 최저금리 기준)</p>
        <h4>{{ loanValue }}억(20년간)</h4>
        <input type="range" style="width: 400px" v-model="loanValue" min="1" :max="props.max" step="0.1" />
        <p>매월 납입액 : {{ cValue }} 원 (원리금균등분할상환)</p>
    </div>
</template>

<style scoped></style>
