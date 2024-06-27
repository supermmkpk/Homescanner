<script setup>
import NoticeSummary from "@/components/main/NoticeSummary.vue";
import NewsSummary from "@/components/main/NewsSummary.vue";
import TheSidebar from "@/components/common/TheSidebar.vue";
import SearchInfo from "@/components/common/searchInfo.vue";
import { ref } from "vue";

let tempData = "";
let timerId = "";

const onChange = (event) => {
    clearTimeout(timerId);
    tempData = event.target.value;
    timerId = setTimeout(goSearch, 1000);
};

const goSearch = () => {
    searchData.value = tempData;
};
const onoff = ref(false);

window.addEventListener("scroll", function () {
    onoff.value = false;
});

const onModal = () => {
    onoff.value = true;
};
const offModal = () => {
    onoff.value = false;
};

const onClick = (e) => {
    const container = document.getElementById("card3");
    //console.log(e.target.parentNode);
    //console.log(container);
    if (!(container == e.target || container.contains(e.target))) {
        onoff.value = false;
    }
};
window.addEventListener("click", onClick);
const searchData = ref("");
</script>

<template>
    <TheSidebar />
    <div style="margin-top: 60px"></div>
    <div class="container-fluid p-0">
        <div class="image-container" id="card3">
            <img src="@/assets/img/main-img.jpg" alt="Main Image" class="img-fluid" />
            <div class="overlay">
                <div class="content col-5">
                    <span class="text-white fw-semibold fs-1 mb-5">어떤 아파트를 찾고 계세요?</span>
                    <form @submit.prevent class="mt-5">
                        <div>
                            <input
                                type="text"
                                class="form-control p-3 rounded-pill border-2 border-secondary shadow"
                                placeholder="원하시는 지역명, 단지명(아파트명)을 입력해 주세요"
                                v-model="searchData"
                                @input="onChange($event)"
                                @click="onModal"
                            />
                            <SearchInfo
                                @offSearch="offModal"
                                v-show="onoff"
                                :searchData="searchData"
                                style="margin-top: 330px; margin-left: 25vw; color: black"
                            />
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <section class="section dashboard">
        <div class="row justify-content-center">
            <!-- Left side columns -->
            <div class="col-lg-6">
                <NewsSummary :display="10" />
            </div>
            <!-- Right side columns -->
            <div class="col-lg-5">
                <NoticeSummary />
            </div>
        </div>
    </section>

    <router-view />
</template>

<style scoped>
.dashboard {
    padding: 3rem;
}

.image-container {
    position: relative;
    width: 100%;
    height: 40vh; /* Viewport Height의 30% */
    overflow: hidden;
}

.image-container img {
    width: 100%;
    height: 100%;
    object-fit: cover; /* 이미지가 컨테이너에 맞게 잘림 */
}

.overlay {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.3); /* 어둡게 하기 위한 반투명 검정색 */
    display: flex;
    align-items: center;
    justify-content: center;
}
.content {
    text-align: center;
    color: white;
}
</style>
