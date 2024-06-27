<script setup>
import { useRoute, useRouter } from "vue-router";
// eslint-disable-next-line no-unused-vars
import { ref, onMounted, computed, defineComponent, reactive } from "vue";
import RoadView from "@/components/home/roadView.vue";
import Axios from "axios";
import TableLite from "vue3-table-lite";
import LoanCalCul from "@/components/home/LoanCalCul.vue";
import FindDataAi from "@/components/home/FindDataAi.vue";
import HomeReview from "@/components/home/HomeReview.vue";
import { storeToRefs } from "pinia";
import { useMemberStore } from "@/stores/member";
import Swal from "sweetalert2";
import axios from "axios";

const router = useRouter();

const memberStore = useMemberStore();
const { userInfo, isLogin } = storeToRefs(memberStore);

const aptCode = ref("");
const route = useRoute();
const houseData = ref([]);
const lat = ref(0);
const lng = ref(0);
onMounted(async () => {
    aptCode.value = route.query.aptCode;
    lat.value = route.query.lat;
    lng.value = route.query.lng;
    // console.log('detailhome');
    // console.log(lat.value, lng.value);
    await getHouseDeal();
    await doSearch(0, 10, "id", "asc");
    await getIsLiked();
});

const addData = async () => {
    var i;
    for (i = 0; i < houseData.value.length; i++) {
        var date = "";
        date = date + houseData.value[i].dealYear;
        if (houseData.value[i].dealMonth < 10) {
            date = date + "-0" + houseData.value[i].dealMonth;
        } else {
            date = date + "-" + houseData.value[i].dealMonth;
        }

        if (houseData.value[i].dealDay < 10) {
            date = date + "-0" + houseData.value[i].dealDay;
        } else {
            date = date + "-" + houseData.value[i].dealDay;
        }
        houseData.value[i].date = date;
    }
    //console.log(houseData.value);
    doChart();
};

const getHouseDeal = async () => {
    const url = `http://localhost:8080/myhome/house/searchHouseDeal/${aptCode.value}`;
    Axios.get(url)
        .then(({ data }) => {
            houseData.value = data;
            // console.log(houseData.value);
            table.totalRecordCount = houseData.value.length;
            addData();
        })
        .catch();
};

const table = reactive({
    isLoading: false,
    columns: [
        {
            label: "거래 날짜",
            field: "date",
            width: "6%",
            sortable: true,
            isKey: true,
        },
        {
            label: "층",
            field: "floor",
            width: "5%",
            sortable: true,
        },
        {
            label: "전용면젹(m<sup>2</sup>)",
            field: "area",
            width: "10%",
            sortable: true,
        },
        {
            label: "거래금액(만원)",
            field: "dealAmount",
            width: "15%",
            sortable: true,
        },
    ],
    rows: [],
    totalRecordCount: 10,
    sortable: {
        order: "id",
        sort: "asc",
    },
});

const doSearch = (offset, limit, order, sort) => {
    table.isLoading = true;

    // Start use axios to get data from Server
    let url = "http://localhost:8080/myhome/house/tableHouseDeal";
    Axios.post(url, {
        aptCode: route.query.aptCode,
        sort: sort,
        offset: offset,
        limit: limit,
    }).then(({ data }) => {
        //console.log(data);
        var i;
        for (i = 0; i < data.length; i++) {
            var date = "";
            date = date + data[i].dealYear;
            if (data[i].dealMonth < 10) {
                date = date + "-0" + data[i].dealMonth;
            } else {
                date = date + "-" + data[i].dealMonth;
            }

            if (data[i].dealDay < 10) {
                date = date + "-0" + data[i].dealDay;
            } else {
                date = date + "-" + data[i].dealDay;
            }
            data[i].date = date;
        }
        table.rows = data;
        table.sortable.order = order;
        table.sortable.sort = sort;
    });
    // End use axios to get data from Server
};
//
// First get data
function doChart() {
    const ctx = document.getElementById("myChart");
    let labels = [];
    let data = [];
    var i;
    for (i = 0; i < houseData.value.length; i++) {
        labels.push(houseData.value[i].date);
        data.push(houseData.value[i].dealAmount.replaceAll(",", "") * 1);
    }
    // console.log(labels);
    // console.log(data);
    // eslint-disable-next-line no-undef
    new Chart(ctx, {
        type: "line",
        data: {
            labels: labels,
            datasets: [
                {
                    label: "실거래가(만원)",
                    data: data,
                    borderWidth: 1,
                },
            ],
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true,
                },
            },
        },
    });
}

const isLiked = ref(false);
async function getIsLiked() {
    await axios
        .get("http://localhost:8080/myhome/homeLikes/isLiked", {
            params: {
                userId: userInfo.value.userId,
                aptCode: aptCode.value,
            },
        })
        .then(({ data }) => {
            isLiked.value = data;
            console.log(isLiked.value);
        })
        .catch((error) => {
            console.log(error);
        });
}

async function add() {
    axios
        .post("http://localhost:8080/myhome/homeLikes/add", {
            userId: userInfo.value.userId,
            aptCode: aptCode.value,
        })
        .then(async (response) => {
            await Swal.fire({
                title: "좋아요 등록 완료!",
                text: "좋아요 등록에 성공하였습니다.",
                icon: "success",
            });
            isLiked.value = !isLiked.value;
        })
        .catch((error) => {
            Swal.fire({
                title: "좋아요 등록 실패...",
                text: "좋아요 등록에 실패하였습니다. 잠시후 다시 시도해 주세요.",
                icon: "error",
            });
        });
}

async function remove() {
    axios
        .delete("http://localhost:8080/myhome/homeLikes/delete", {
            params: {
                userId: userInfo.value.userId,
                aptCode: aptCode.value,
            },
        })
        .then(async (response) => {
            await Swal.fire({
                title: "관심 주택 취소 완료!",
                text: "관심 주택 목록에서 삭제되었습니다.",
                icon: "success",
            });
            isLiked.value = !isLiked.value;
        })
        .catch((error) => {
            Swal.fire({
                title: "관심 주택 취소 실패...",
                text: "관심 주택 취소 실패하였습니다. 잠시후 다시 시도해 주세요.",
                icon: "error",
            });
        });
}
</script>

<template>
    <div class="container detail-home-div">
        <RoadView :lng="route.query.lng" :lat="route.query.lat"></RoadView>
        <div class="container">
            <div v-show="isLogin == true" class="text-end mt-2 me-2">
                <button class="btn btn-outline-danger" v-if="isLiked == false">
                    <i class="bi bi-heart" @click="add"></i>
                </button>
                <button class="btn btn-outline-danger" v-else-if="isLiked == true">
                    <i class="bi bi-heart-fill" @click="remove"></i>
                </button>
            </div>
            <div class="mt-5 mb-3">
                <h4 class="fw-bold ms-1">거래가 차트(최근 2년)</h4>
                <div>
                    <canvas id="myChart" style="background-color: white"></canvas>
                </div>
            </div>
            <div class="mt-5 mb-3">
                <h4 class="fw-bold ms-1">거래가 정보</h4>
                <table-lite
                    :is-loading="table.isLoading"
                    :columns="table.columns"
                    :rows="table.rows"
                    :total="table.totalRecordCount"
                    :sortable="table.sortable"
                    :messages="table.messages"
                    @do-search="doSearch"
                    @is-finished="table.isLoading = false"
                ></table-lite>
            </div>
            <div class="mt-5 mb-3">
                <h4 class="fw-bold ms-1">대출 계산기</h4>
                <LoanCalCul
                    v-if="houseData[0]"
                    :max="houseData[0].dealAmount.replace(',', '') / 10000"
                />
            </div>
            <div class="mt-5 mb-3">
                <FindDataAi :dong="route.query.dong" />
            </div>

            <div class="mt-5 mb-3">
                <HomeReview :aptCode="route.query.aptCode" />
            </div>
        </div>
    </div>
</template>

<style scoped>
.detail-home-div {
    margin-top: 50px;
    padding: 2rem;
}
</style>
