<script setup>
import { RouterLink } from "vue-router";
import { useMemberStore } from "@/stores/member";
import { storeToRefs } from "pinia";
import { useRoute } from "vue-router";

const route = useRoute();

function isActive(path) {
    let flag = !route.path.startsWith(path);
    return flag;
}
function isExactPath(path) {
    return !(route.path === path);
}

function hasKeyword(keyword) {
    return !route.path.includes(keyword);
}

const memberStore = useMemberStore();
const { isAdmin } = storeToRefs(memberStore);
</script>

<template>
    <!-- ======= Sidebar ======= -->
    <aside id="sidebar" class="sidebar">
        <ul class="sidebar-nav" id="sidebar-nav">
            <li class="nav-item">
                <RouterLink
                    class="nav-link"
                    :to="{ name: 'home' }"
                    :class="{ collapsed: isExactPath('/') }"
                >
                    <i class="bi bi-houses"></i> <span>메인</span>
                </RouterLink>
            </li>
            <li class="nav-item">
                <RouterLink
                    class="nav-link"
                    :to="{ name: 'notice' }"
                    :class="{ collapsed: isActive('/notice') }"
                >
                    <i class="bi bi-exclamation-circle"></i> <span>공지사항</span>
                </RouterLink>
            </li>

            <li class="nav-item">
                <RouterLink
                    class="nav-link"
                    :to="{ name: 'news' }"
                    :class="{ collapsed: isActive('/news') }"
                >
                    <i class="bi bi-newspaper"></i> <span>부동산 뉴스</span>
                </RouterLink>
            </li>
            <li class="nav-item">
                <RouterLink
                    class="nav-link"
                    :to="{ name: 'boardList' }"
                    :class="{ collapsed: isActive('/board') }"
                >
                    <i class="bi bi-clipboard2"></i> <span>커뮤니티</span>
                </RouterLink>
            </li>
            <li class="nav-item">
                <RouterLink
                    class="nav-link"
                    :to="{ name: 'searchHome' }"
                    :class="{ collapsed: isActive('/Home') }"
                >
                    <i class="bi bi-search"></i> <span>아파트 검색</span>
                </RouterLink>
            </li>
            <li class="nav-item">
                <RouterLink
                    class="nav-link"
                    :to="{ name: 'chat' }"
                    :class="{ collapsed: isActive('/chat') }"
                >
                    <i class="bi bi-chat"></i> <span>채팅</span>
                </RouterLink>
            </li>

            <div v-show="isAdmin === true">
                <hr />
                <li class="nav-item">
                    <a
                        class="nav-link"
                        data-bs-target="#components-nav"
                        data-bs-toggle="collapse"
                        href="#"
                        :class="{ collapsed: hasKeyword('admin') }"
                    >
                        <i class="bi bi-gear-wide-connected"></i>
                        <span>관리자 메뉴</span>
                        <i class="bi bi-chevron-down ms-auto"></i>
                    </a>
                    <ul
                        id="components-nav"
                        class="nav-content collapse"
                        data-bs-parent="#sidebar-nav"
                    >
                        <li>
                            <router-link :to="{ name: 'adminNoticeList' }">
                                <i class="bi bi-circle"></i><span>공지사항 관리</span>
                            </router-link>
                        </li>
                        <li>
                            <router-link :to="{ name: 'memberList' }">
                                <i class="bi bi-circle"></i><span>등록 회원 조회</span>
                            </router-link>
                        </li>
                    </ul>
                </li>
            </div>
        </ul>
    </aside>
    <!-- End Sidebar-->
</template>

<style scoped>
.active-link {
    color: var(--main-color);
    background: #f6f9ff;
}
</style>
