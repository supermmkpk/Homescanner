<!-- eslint-disable no-unused-vars -->
<!-- eslint-disable vue/valid-v-for -->
<!-- eslint-disable no-undef -->
<script setup>
import { onMounted, ref, computed, watch, onBeforeMount } from "vue";
import { KakaoMap, KakaoMapMarker, KakaoMapCustomOverlay } from "vue3-kakao-maps";
import { useRoute, useRouter } from "vue-router";
import Axios from "axios";
import DetailHome from "@/components/home/DetailHome.vue";
import { SidebarMenu } from "vue-sidebar-menu";

const router = useRouter();
const route = useRoute();
const lat = ref(33.450701);
const lng = ref(126.570667);
const map = ref();
const bottlecheck = ref();
const schoolcheck = ref();
const foodcheck = ref();
const babyshark = ref();
const bottleList = ref([]);
const schoolList = ref([]);
const foodList = ref([]);
const babyList = ref([]);
const image_hospital = {
    imageSrc: "/@/assets/img/marker_red.png",
    imageWidth: 64,
    imageHeight: 64,
    imageOption: {},
};
const houseList = ref([]);
const SidoList = ref([]);
let SiGunGuList = [];
const dongList = ref([]);
const mapLevel = ref(11);
// 높이 10 이상은 시도
// 높이 9~7 부터 시군구
// 높이 6~4 부터 동 ->  일정 갯수
// 높이 4~1 부터 건물
const onLoadKakaoMap = (mapRef) => {
    map.value = mapRef;
    map.value.setMinLevel(1); // 맵 최저 level 지정
    map.value.setMaxLevel(11); // 맵 최고 level 지정
    //(mapLevel.value);
    map.value.setLevel(mapLevel.value);
    // mapLevel.value = map.value.getLevel();
    // 클릭한 위치로 이동
    kakao.maps.event.addListener(map.value, "click", function (mouseEvent) {
        //console.log("클릭");
        const latlng = mouseEvent.latLng;
        lat.value = latlng.getLat();
        lng.value = latlng.getLng();
        //console.log(lat.value + " " + lng.value);
        getHouseData(lat.value, lng.value);
        search();
        if (mapLevel.value === 6 || mapLevel.value === 5) {
            getDongList();
        }
        if (mapLevel.value <= 6) {
            getHouseData(lat.value, lng.value);
        }
    });
    // 드래그한 위도, 경도 정보를 가져옵니다
    kakao.maps.event.addListener(map.value, "mouseup", function () {
        //console.log("드래그");
        search();
        if (map.value) {
            // 지도의 현재 중심좌표를 얻어옵니다
            const center = map.value.getCenter();
            lat.value = center.getLat();
            lng.value = center.getLng();
            getHouseData(lat.value, lng.value);
            if (mapLevel.value === 6 || mapLevel.value === 5) {
                getDongList();
            }
            if (mapLevel.value <= 6) {
                getHouseData(lat.value, lng.value);
            }
        }
    });
    kakao.maps.event.addListener(map.value, "zoom_changed", function () {
        //console.log("휠");
        if (map.value) {
            //console.log("레벨 변경!!");
            mapLevel.value = map.value.getLevel();
            //console.log(mapLevel.value);
            if (mapLevel.value <= 6) {
                getDongList();
            }
            if (mapLevel.value <= 6) {
                getHouseData(lat.value, lng.value);
            }
        }
    });
};
async function search() {
    var places = new kakao.maps.services.Places();

    var callback1 = function (result, status) {
        if (status === kakao.maps.services.Status.OK) {
            //console.log(result);
            if (result !== null) {
                bottleList.value = result;
                // console.log('병원목록');
                // console.log(bottleList.value);
            }
        }
    };
    var callback2 = function (result, status) {
        if (status === kakao.maps.services.Status.OK) {
            //console.log(result);
            schoolList.value = result;
        }
    };
    var callback3 = function (result, status) {
        if (status === kakao.maps.services.Status.OK) {
            //console.log(result);
            foodList.value = result;
        }
    };
    var callback4 = function (result, status) {
        if (status === kakao.maps.services.Status.OK) {
            //console.log(result);
            babyList.value = result;
            //console.log("유치원");
            //console.log(babyList.value);
        }
    };

    // 공공기관 코드 검색
    places.categorySearch("HP8", callback1, {
        // Map 객체를 지정하지 않았으므로 좌표객체를 생성하여 넘겨준다.
        location: new kakao.maps.LatLng(lat.value, lng.value),
    });
    places.categorySearch("SC4", callback2, {
        // Map 객체를 지정하지 않았으므로 좌표객체를 생성하여 넘겨준다.
        location: new kakao.maps.LatLng(lat.value, lng.value),
    });
    places.categorySearch("FD6", callback3, {
        // Map 객체를 지정하지 않았으므로 좌표객체를 생성하여 넘겨준다.
        location: new kakao.maps.LatLng(lat.value, lng.value),
    });
    places.categorySearch("PS3", callback4, {
        // Map 객체를 지정하지 않았으므로 좌표객체를 생성하여 넘겨준다.
        location: new kakao.maps.LatLng(lat.value, lng.value),
    });
}

const isWaiting = ref(false);
const getHouseData = async (lat, lng) => {
    isWaiting.value = true;
    await Axios.post("http://localHost:8080/myhome/house/nearest", {
        // id: 0,
        lat,
        lng,
    })
        .then(({ data }) => {
            houseList.value = data;
            isWaiting.value = false;
            //console.log(houseList.value);
        })
        .catch((error) => {
            isWaiting.value = false;
            //console.error(error);
        });
    // console.log(houseList.value);
};

const getSidoGunGuList = async () => {
    const url = "http://localHost:8080/myhome/house/getMarkerDoSi";
    Axios.get(url)
        .then((data) => {
            SidoList.value = data.data;
            //console.log(SidoList.value);
        })
        .catch();
    const url2 = "http://localHost:8080/myhome/house/getMarkerSiGunGu";
    Axios.get(url2)
        .then((data) => {
            SiGunGuList = data.data;
            //console.log(SidoList);
        })
        .catch();
};

const getDongList = async () => {
    const url = "http://localhost:8080/myhome/house/getMarkerDong";
    Axios.post(url, {
        lat: lat.value,
        lng: lng.value,
    })
        .then((data) => {
            dongList.value = data.data;
            //console.log(dongList.value);
        })
        .catch();
};

onMounted(async () => {
    await getSidoGunGuList();
    await getDongList();
    //console.log('실행1');
    await setRouteData();
    await search();
    await getHouseData(lat.value, lng.value);
    //await console.log(SidoList.value);
    navigator.geolocation.getCurrentPosition(success, error, options);
});

const setRouteData = async () => {
    // console.log(route.query);
    if (route.query.lat) {
        //console.log("실행3");
        lat.value = route.query.lat;
        lng.value = route.query.lng;
        mapLevel.value = route.query.level;
        if (route.query.level) {
            map.value.setLevel(route.query.level);
        }
    }
};

window.moveSiGuGun = (lat2, lng2, level) => {
    //console.log('작동');
    lat.value = lat2;
    lng.value = lng2;
    map.value.setLevel(level);
};
const makeCustomOverlay = (sidoName, lat, lng, num) => {
    let innerhtml =
        `<button
        type="button"
        onclick="moveSiGuGun(` +
        lat +
        `,` +
        lng +
        `,` +
        num +
        `)"
        class="btn btn-secondary"
        style="
        border-radius: 30px;
        padding: 5px 10px;
        font-size: 12px;
        color: white;
        ">` +
        sidoName +
        `</button>`;
    //console.log(innerhtml);
    return innerhtml;
};
const makeCustomOverlay2 = (gugunName, count, lat, lng, num) => {
    let innerhtml =
        `<div
    onclick="moveSiGuGun(` +
        lat +
        `,` +
        lng +
        `,` +
        num +
        `)"
                            style="
                                background-color: white;
                                border: 1px solid #1F94ED;
                                border-radius: 30px;
                                color: #1F94ED;
                                font-size: 12px;
                                display:flex;
                                height:30px;
                            "
                        >` +
        `<div style="
                                padding: 5px;
                                background-color: #1F94ED;
                                border: 1px solid #1F94ED;
                                border-radius: 30px;
                                color: white;
                                font-size: 12px;
                            ">` +
        "&nbsp; " +
        count +
        " &nbsp;" +
        `</div>` +
        `<p style="
            color: #1F94ED; padding: 5px;">` +
        gugunName +
        `</p>` +
        `</div>`;
    // console.log(innerhtml);
    return innerhtml;
};
watch(
    () => route.query.lat,
    (termData) => {
        if (termData) {
            moveSiGuGun(route.query.lat, route.query.lng, route.query.level);
        }
    }
);

function goHomeDetail(house) {
    router.push({
        name: "homeDetail",
        query: {
            aptCode: house.aptCode,
            lat: house.lat,
            lng: house.lng,
            dong: house.dong,
        },
    });
}

function numberToKorean(numberString) {
    // 콤마 제거
    let number = parseInt(numberString.replace(/,/g, ""), 10);
    number *= 10000;

    const units = ["", "만", "억", "조", "경"];
    let unitIndex = 0;
    let koreanNumber = "";
    let currentNumber = number;

    while (currentNumber > 0) {
        // 한 단위의 숫자(10000)를 구함
        const unitNumber = currentNumber % 10000;
        // 단위가 0이 아니면 한글로 변환하여 결과에 추가
        if (unitNumber !== 0) {
            koreanNumber = String(unitNumber) + units[unitIndex] + koreanNumber;
        }
        // 다음 단위로 이동
        currentNumber = Math.floor(currentNumber / 10000);
        unitIndex++;
    }

    return koreanNumber;
}

function onClickKakaoMapMarker(lat, lng) {
    console.log(lat + ", " + lng);
    // 이동할 위도 경도 위치를 생성합니다
    var moveLatLon = new kakao.maps.LatLng(lat, lng);

    // 지도 중심을 이동 시킵니다
    map.value.setCenter(moveLatLon);
}

const options = {
    enableHighAccuracy: true,
    timeout: 5000,
    maximumAge: 0,
};

function success(pos) {
    const crd = pos.coords;
    lat.value = crd.latitude;
    lng.value = crd.longitude;
    //     console.log('Your current position is:');
    //     console.log(`Latitude : ${crd.latitude}`);
    //     console.log(`Longitude: ${crd.longitude}`);
    //     console.log(`More or less ${crd.accuracy} meters.`);
}

function error(err) {
    console.warn(`ERROR(${err.code}): ${err.message}`);
}
</script>

<template>
    <!-- 검색 결과 카드 목록 -->
    <div class="right-sidebar">
        <div
            class="spinner-grow text-secondary"
            role="status"
            style="position: relative; top: 49%; left: 49%"
            v-show="isWaiting"
        >
            <span class="visually-hidden">Loading...</span>
        </div>
        <div class="card rounded mb-2" v-for="house in houseList" :key="house.aptCode">
            <a href="#" @click="goHomeDetail(house)" class="link-dark">
                <div class="card-body">
                    <h5 class="card-title fw-bold fs-5">
                        매매 {{ numberToKorean(house.dealAmount) }}
                    </h5>
                    <span class="text-secondary fw-medium">{{ house.apartmentName }}</span>
                    <br />
                    <small class="text-secondary">건축년도: {{ house.buildYear }}년</small>
                    <br />
                    <small class="text-secondary">
                        주소: {{ house.roadName + " " + house.roadNameBonbun.replaceAll("0", "") }}
                    </small>
                </div>
            </a>
        </div>
    </div>

    <!-- 카테고리 버튼 -->
    <div class="map-div">
        <div class="container" style="height: 50px; position: absolute; right: 300px; z-index: 100">
            <div
                class="d-flex justify-content-end align-items-center transparent"
                style="height: 100%"
            >
                <div class="me-3 mt-3">
                    <input
                        type="checkbox"
                        v-model="bottlecheck"
                        class="btn-check"
                        id="btn-check-outlined1"
                        autocomplete="off"
                    />
                    <label
                        class="btn btn-light border-secondary border-1 rounded-pill btn-sm fw-medium"
                        for="btn-check-outlined1"
                    >
                        <img src="https://img.icons8.com/clouds/100/hospital.png" width="30px" />
                        &nbsp;병원
                    </label>
                </div>
                <div class="me-3 mt-3">
                    <input
                        type="checkbox"
                        v-model="schoolcheck"
                        class="btn-check"
                        id="btn-check-outlined2"
                        autocomplete="off"
                    />
                    <label
                        class="btn btn-light border-secondary border-1 rounded-pill btn-sm fw-medium"
                        for="btn-check-outlined2"
                    >
                        <img src="https://img.icons8.com/clouds/100/school.png" width="30px" />
                        &nbsp;학교
                    </label>
                </div>
                <div class="me-3 mt-3">
                    <input
                        type="checkbox"
                        v-model="foodcheck"
                        class="btn-check"
                        id="btn-check-outlined3"
                        autocomplete="off"
                    />
                    <label
                        class="btn btn-light border-secondary border-1 rounded-pill btn-sm fw-medium"
                        for="btn-check-outlined3"
                    >
                        <img src="https://img.icons8.com/clouds/100/restaurant.png" width="30px" />
                        음식점
                    </label>
                </div>
                <div class="me-3 mt-3">
                    <input
                        type="checkbox"
                        v-model="babyshark"
                        class="btn-check"
                        id="btn-check-outlined4"
                        autocomplete="off"
                    />
                    <label
                        class="btn btn-light border-secondary border-1 rounded-pill btn-sm fw-medium"
                        for="btn-check-outlined4"
                    >
                        <img src="https://img.icons8.com/fluency/48/day-care.png" width="30px" />
                        &nbsp;유치원
                    </label>
                </div>
            </div>
        </div>

        <!-- 지도 -->
        <div style="margin-top: 60px"></div>
        <div class="container" style="height: 500px; position: relative">
            <div class="row" style="height: calc(100vh - 60px); overflow: hidden">
                <span class="col-12" style="padding: 0">
                    <KakaoMap
                        @onLoadKakaoMap="onLoadKakaoMap"
                        :lat="lat"
                        :lng="lng"
                        width="100%"
                        height="100%"
                    >
                        <template v-if="mapLevel >= 10" v-for="sido in SidoList" :key="sido">
                            <KakaoMapCustomOverlay
                                :lat="sido.lat"
                                :lng="sido.lng"
                                :content="makeCustomOverlay(sido.sidoName, sido.lat, sido.lng, 8)"
                                :clickable="true"
                            ></KakaoMapCustomOverlay>
                        </template>
                        <template
                            v-if="mapLevel <= 9 && mapLevel >= 7"
                            v-for="sigungu in SiGunGuList"
                        >
                            <KakaoMapCustomOverlay
                                :lat="sigungu.lat"
                                :lng="sigungu.lng"
                                :content="
                                    makeCustomOverlay2(
                                        sigungu.gugunName,
                                        sigungu.count,
                                        sigungu.lat,
                                        sigungu.lng,
                                        6
                                    )
                                "
                            ></KakaoMapCustomOverlay>
                        </template>
                        <template v-if="mapLevel <= 6 && mapLevel >= 5" v-for="dong in dongList">
                            <KakaoMapCustomOverlay
                                :lat="dong.lat"
                                :lng="dong.lng"
                                :content="
                                    makeCustomOverlay2(
                                        dong.dongName,
                                        dong.count,
                                        dong.lat,
                                        dong.lng,
                                        3
                                    )
                                "
                            ></KakaoMapCustomOverlay>
                        </template>
                        <template v-if="mapLevel <= 4" v-for="(house, index) in houseList">
                            <KakaoMapMarker
                                :lat="house.lat"
                                :lng="house.lng"
                                :clickable="true"
                                @onClickKakaoMapMarker="onClickKakaoMapMarker(house.lat, house.lng)"
                            >
                                <!-- <template v-slot:infoWindow>
                                    <div class="infowindow-content">
                                        <div class="infowindow-title">
                                            {{ house.apartmentName }}
                                        </div>
                                    </div>
                                </template> -->
                            </KakaoMapMarker>
                        </template>
                        <template v-if="bottlecheck" v-for="bottle in bottleList">
                            <KakaoMapMarker
                                :lat="bottle.y"
                                :lng="bottle.x"
                                :image="{
                                    imageSrc: 'https://img.icons8.com/clouds/100/hospital.png',
                                    imageWidth: 48,
                                    imageHeight: 48,
                                    imageOption: {},
                                }"
                            />
                        </template>
                        <template v-if="foodcheck" v-for="food in foodList">
                            <KakaoMapMarker
                                :lat="food.y"
                                :lng="food.x"
                                :image="{
                                    imageSrc: 'https://img.icons8.com/clouds/100/restaurant.png',
                                    imageWidth: 48,
                                    imageHeight: 48,
                                    imageOption: {},
                                }"
                            />
                        </template>
                        <template v-if="schoolcheck" v-for="school in schoolList">
                            <KakaoMapMarker
                                :lat="school.y"
                                :lng="school.x"
                                :image="{
                                    imageSrc: 'https://img.icons8.com/clouds/100/school.png',
                                    imageWidth: 48,
                                    imageHeight: 48,
                                    imageOption: {},
                                }"
                            />
                        </template>
                        <template v-if="babyshark" v-for="baby in babyList">
                            <KakaoMapMarker
                                :lat="baby.y"
                                :lng="baby.x"
                                :image="{
                                    imageSrc: 'https://img.icons8.com/fluency/48/day-care.png',
                                    imageWidth: 43,
                                    imageHeight: 43,
                                    imageOption: {},
                                }"
                            />
                        </template>
                    </KakaoMap>
                </span>
            </div>
        </div>
    </div>
</template>
<style scoped>
.map-div {
    margin-right: 300px;
}
.right-sidebar {
    position: fixed;
    top: 60px;
    right: 0;
    bottom: 0;
    width: 300px;
    z-index: 996;
    padding: 20px;
    overflow-y: auto;
    scrollbar-width: thin;
    scrollbar-color: #aab7cf transparent;
    box-shadow: 0px 0px 20px rgba(1, 41, 112, 0.1);
    background-color: #fff;
}

.card:hover {
    background-color: #f1f4f9;
}
.infowindow-content {
    text-align: center;
    padding: 1px;
    font-family: Arial, sans-serif;
}
.infowindow-title {
    font-size: 10px;
    font-weight: bold;
    margin-bottom: 5px;
}
</style>
