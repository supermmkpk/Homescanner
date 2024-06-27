<template>
  <div class="container">
    <div calss="row">
      <div class="col">
        <router-link
          :to="{
            name: 'homeDetail',
            query: { aptCode: props.code, lat: props.lat, lng: props.lng },
          }"
        >
          <div>{{ props.name }}</div>
          <div class="mt-3">건축년도: {{ props.year }}</div>
          <div class="mt-3">
            위치:
            {{ props.road }}
          </div>
        </router-link>
      </div>
    </div>
  </div>
</template>

<script setup>
// eslint-disable-next-line no-unused-vars
import { ref, onMounted } from "vue";

const props = defineProps(["code", "name", "year", "road", "lat", "lng"]);
</script>

<style>
#map {
  width: 100%;
  height: 100%;
}
</style>
