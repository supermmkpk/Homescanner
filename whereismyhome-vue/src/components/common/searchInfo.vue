<script setup>
import { ref, watch } from "vue";
import Axios from "axios";
import { useRouter } from "vue-router";
const router = useRouter();
const props = defineProps(["searchData"]);
//console.log(props.searchData);
const ApartList = ref([]);
const DongList = ref([]);
const emit = defineEmits(["off-search"]);
watch(
    () => props.searchData,
    (termData) => {
        if (termData) {
            //console.log('자식컴포넌트에서 감시');
            console.log(props.searchData);
            const url1 = `http://localhost:8080/myhome/house/searchApartName/${props.searchData}`;
            Axios.get(url1)
                .then(({ data }) => {
                    ApartList.value = data;
                    console.log(ApartList.value);
                })
                .catch();
            const url2 = `http://localhost:8080/myhome/house/SearchDongName/${props.searchData}`;
            Axios.get(url2)
                .then(({ data }) => {
                    //console.log(data);
                    DongList.value = data;
                    //console.log(DongList.value);
                })
                .catch();
        }
    }
);
const moveMap = (lat2, lng2, level2) => {
    router.push({ name: "searchHome", query: { lat: lat2, lng: lng2, level: level2 } });
    emit("off-search", { data: false });
};
</script>

<template>
    <div
        id="card"
        class="container fixed-top border rounded"
        style="background-color: white; width: 60%; margin-left: 20%"
    >
        <div class="row" style="height: 100%">
            <div class="col border-end" style="height: 100%">
                <p class="fw-bold" style="padding-top: 30px; padding-left: 30px">주소</p>
                <ul v-for="Dong in DongList" :key="Dong.dongName">
                    <div @click="moveMap(Dong.lat, Dong.lng, 4)">
                        <p style="padding-bottom: 10px">
                            {{ Dong.sidoName + " " + Dong.gugunName + " " + Dong.dongName }}
                        </p>
                    </div>
                </ul>
            </div>
            <div class="col border-start" style="height: 100%">
                <p class="fw-bold" style="padding-top: 30px; padding-left: 30px">아파트명</p>
                <ul v-for="apart in ApartList" :key="apart.apartmentName">
                    <div @click="moveMap(apart.lat, apart.lng, 4)">
                        <p style="padding-bottom: 10px">
                            {{ apart.apartmentName }}
                        </p>
                    </div>
                </ul>
            </div>
        </div>
    </div>
</template>

<style scoped></style>
