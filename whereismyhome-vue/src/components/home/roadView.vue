<!-- eslint-disable no-unused-vars -->
<template>
    <div>
        <div id="map"></div>
    </div>
</template>

<script setup>
// eslint-disable-next-line no-unused-vars
import { ref, onMounted } from 'vue';
import { useRoute } from 'vue-router';
let map = null;
const props = defineProps(['lat', 'lng']);
onMounted(() => {
    if (window.kakao && window.kakao.maps) {
        console.log(1111);
        initMap();
    } else {
        const script = document.createElement('script');
        /* global kakao */
        script.onload = () => kakao.maps.load(initMap);
        script.src = `//dapi.kakao.com/v2/maps/sdk.js?autoload=false&appkey=5ec0bcc06b04d7840fc4d5fb7f1dcb62`;
        document.head.appendChild(script);
        console.log(2);
    }
});

const initMap = () => {
    console.log('실행됨!!');
    const container = document.getElementById('map');
    const options = {
        center: new kakao.maps.LatLng(33.450701, 126.570667),
        level: 5,
    };

    // 지도 객체를 등록합니다.
    // 지도 객체는 반응형 관리 대상이 아니므로 initMap에서 선언합니다.
    map = new kakao.maps.Map(container, options);

    console.log('실행됨2!!');
    var roadviewContainer = document.getElementById('map'); //로드뷰를 표시할 div
    var roadview = new kakao.maps.Roadview(roadviewContainer); //로드뷰 객체
    var roadviewClient = new kakao.maps.RoadviewClient(); //좌표로부터 로드뷰 파노ID를 가져올 로드뷰 helper객체
    console.log(props.lat, props.lng);
    var position = new kakao.maps.LatLng(props.lat, props.lng);

    // 특정 위치의 좌표와 가까운 로드뷰의 panoId를 추출하여 로드뷰를 띄운다.
    roadviewClient.getNearestPanoId(position, 50, function (panoId) {
        roadview.setPanoId(panoId, position); //panoId와 중심좌표를 통해 로드뷰 실행
    });
    console.log('실행됨3!!');
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
#map {
    width: 100%;
    height: 400px;
}
</style>
