<script setup>
import TheSidebar from "@/components/common/TheSidebar.vue";
import NewsSummary from "@/components/main/NewsSummary.vue";
</script>

<template>
    <TheSidebar />
    <div style="margin-top: 50px; padding: 2rem">
        <NewsSummary :display="50" />
    </div>
    <router-view />
</template>

<style scoped></style>
