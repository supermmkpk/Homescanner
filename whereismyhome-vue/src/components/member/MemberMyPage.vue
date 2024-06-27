<script setup>
import memberDetail from "@/components/member/memberDetail.vue";
import { storeToRefs } from "pinia";
import { useMemberStore } from "@/stores/member";
import MemberUpdate from "@/components/member/memberUpdate.vue";
import MemberDelete from "@/components/member/MemberDelete.vue";
import HomeLikesList from "@/components/homelikes/HomeLikesList.vue";
import { ref } from "vue";
const memberStore = useMemberStore();
const { userInfo } = storeToRefs(memberStore);

const tabIndex = ref(0);
const change = (idx) => {
    tabIndex.value = idx;
};
</script>

<template>
    <div class="div-profile">
        <div class="pagetitle">
            <h1>Profile</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item">
                        <RouterLink :to="{ name: 'home' }">홈</RouterLink>
                    </li>
                    <li class="breadcrumb-item">유저</li>
                    <li class="breadcrumb-item active">내프로필</li>
                </ol>
            </nav>
        </div>
        <!-- End Page Title -->
        <section class="section profile">
            <div class="row">
                <div class="col-xl-4">
                    <div class="card">
                        <div
                            class="card-body profile-card pt-4 d-flex flex-column align-items-center"
                        >
                            <img
                                src="@/assets/img/profile-img.jpg"
                                alt="Profile"
                                class="rounded-circle"
                            />
                            <h2>{{ userInfo.userName }}</h2>
                            <h3>{{ userInfo.userId }}</h3>
                            <div class="social-links mt-2">
                                <a href="#" class="twitter"><i class="bi bi-twitter"></i></a>
                                <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
                                <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
                                <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-xl-8">
                    <div class="card">
                        <div class="card-body pt-3">
                            <!-- Bordered Tabs -->
                            <ul class="nav nav-tabs nav-tabs-bordered">
                                <li class="nav-item">
                                    <button
                                        class="nav-link active"
                                        data-bs-toggle="tab"
                                        data-bs-target="#profile-overview"
                                        @click="change(0)"
                                    >
                                        계정 정보
                                    </button>
                                </li>

                                <li class="nav-item">
                                    <button
                                        class="nav-link"
                                        data-bs-toggle="tab"
                                        data-bs-target="#profile-edit"
                                        @click="change(1)"
                                    >
                                        계정 정보 수정
                                    </button>
                                </li>

                                <li class="nav-item">
                                    <button
                                        class="nav-link"
                                        data-bs-toggle="tab"
                                        data-bs-target="#profile-edit"
                                        @click="change(2)"
                                    >
                                        찜 목록
                                    </button>
                                </li>

                                <li class="nav-item">
                                    <button
                                        class="nav-link"
                                        data-bs-toggle="tab"
                                        data-bs-target="#profile-edit"
                                        @click="change(3)"
                                    >
                                        탈퇴
                                    </button>
                                </li>
                            </ul>

                            <memberDetail :user-info="userInfo" v-show="tabIndex == 0" />
                            <MemberUpdate :user-info-now="userInfo" v-show="tabIndex == 1" />
                            <HomeLikesList :user-info="userInfo" v-show="tabIndex == 2" />
                            <MemberDelete :user-info="userInfo" v-show="tabIndex == 3" />
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</template>

<style scoped>
.div-profile {
    padding: 2rem;
    margin-top: 50px;
}
</style>
