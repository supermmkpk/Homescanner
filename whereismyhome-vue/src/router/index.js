/* eslint-disable no-unused-vars */
import { createRouter, createWebHistory } from "vue-router";
import MemberView from "@/views/MemberView.vue";
import BoardList from "@/components/board/BoardList.vue";
import BoardDetail from "@/components/board/BoardDetail.vue";
import BoardCreate from "@/components/board/BoardCreate.vue";
import BoardView from "@/views/BoardView.vue";
import BoardUpdate from "@/components/board/BoardUpdate.vue";
import memberRegister from "@/components/member/memberRegister.vue";
import memberList from "@/components/member/memberList.vue";
import memberDetail from "@/components/member/memberDetail.vue";
import memberUpdate from "@/components/member/memberUpdate.vue";
import MemberLogin from "@/components/member/MemberLogin.vue";
import MemberMyPage from "@/components/member/MemberMyPage.vue";
import searchHome from "@/components/home/searchHome.vue";
import DetailHome from "@/components/home/DetailHome.vue";
import SearchHomeView from "@/views/SearchHomeView.vue";
import HomeView from "@/views/HomeView.vue";
import NoticeView from "@/views/NoticeView.vue";
import NoticeDetail from "@/components/notice/NoticeDetail.vue";
import { storeToRefs } from "pinia";
import { useMemberStore } from "../stores/member";
import Swal from "sweetalert2";
import NoticeList from "@/components/notice/NoticeList.vue";
import NoticeCreateAdmin from "../components/notice/NoticeCreateAdmin.vue";
import NoticeUpdateAdmin from "../components/notice/NoticeUpdateAdmin.vue";
import { nextTick } from "vue";
import ResetPasswordView from "@/views/ResetPasswordView.vue";
import ChatComponent from "@/components/chat/ChatComponent.vue";
import ChatView from "@/views/ChatView.vue";
import NewsView from '@/views/NewsView.vue';

const onlyAuthUser = async (to, from, next) => {
    const memberStore = useMemberStore();
    const { userInfo, isValidToken } = storeToRefs(memberStore);
    const { getUserInfo } = memberStore;

    let token = sessionStorage.getItem("accessToken");

    if (userInfo.value != null && token) {
        await getUserInfo(token);
    }
    if (!isValidToken.value || userInfo.value === null) {
        next({ name: "memberLogin" });
    } else {
        next();
    }
};

const onlyAdminUser = async (to, from, next) => {
    const memberStore = useMemberStore();
    const { userInfo, isValidToken } = storeToRefs(memberStore);
    const { getUserInfo } = memberStore;

    let token = sessionStorage.getItem("accessToken");

    if (userInfo.value != null && token) {
        await getUserInfo(token);
    }
    if (!isValidToken.value || userInfo.value === null) {
        next({ name: "memberLogin" });
    } else if (userInfo.value.role !== "admin") {
        Swal.fire({
            title: "접근 불가",
            text: "관리자 권한이 필요한 메뉴입니다.",
            icon: "warning",
        });
    } else {
        next();
    }
};

const router = createRouter({
    history: createWebHistory(import.meta.env.BASE_URL),
    routes: [
        {
            path: "/",
            name: "home",
            component: HomeView,
        },
        {
            path: "/Home",
            name: "Home",
            component: SearchHomeView,
            redirect: { name: "searchHome" },
            children: [
                {
                    path: "searchHome",
                    name: "searchHome",
                    component: searchHome,
                },
                {
                    path: "homeDetail",
                    name: "homeDetail",
                    component: DetailHome,
                },
            ],
        },
        {
            path: "/board",
            name: "board",
            component: BoardView,
            redirect: { name: "boardList" },
            children: [
                {
                    path: "boardList",
                    name: "boardList",
                    component: BoardList,
                },
                {
                    path: "boardDetail/:boardId",
                    name: "boardDetail",
                    component: BoardDetail,
                },
                {
                    path: "boardCreate",
                    name: "boardCreate",
                    component: BoardCreate,
                },
                {
                    path: "boardUpdate/:boardId",
                    name: "boardUpdate",
                    component: BoardUpdate,
                },
            ],
        },
        {
            path: "/news",
            name: "news",
            component: NewsView,
        },
        {
            path: "/reset-password",
            name: "resetPassword",
            component: ResetPasswordView,
        },
        {
            path: "/chat",
            name: "chat",
            component: ChatView,
            redirect: { name: "chatComponent" },
            children: [
                {
                    path: "/chatComponent",
                    name: "chatComponent",
                    component: ChatComponent,
                },
            ],
        },
        {
            path: "/notice",
            name: "notice",
            component: NoticeView,
            redirect: { name: "noticeList" },
            children: [
                {
                    path: "noticeList",
                    name: "noticeList",
                    component: NoticeList,
                },
                {
                    path: "/admin/noticeList",
                    name: "adminNoticeList",
                    component: NoticeList,
                },
                {
                    path: "noticeDetail/:noticeId",
                    name: "noticeDetail",
                    component: NoticeDetail,
                },
                {
                    path: "/admin/noticeCreateAdmin",
                    name: "noticeCreateAdmin",
                    component: NoticeCreateAdmin,
                },
                {
                    path: "/admin/noticeUpdateAdmin",
                    name: "noticeUpdateAdmin",
                    component: NoticeUpdateAdmin,
                },
            ],
        },
        {
            path: "/member",
            name: "member",
            component: MemberView,
            redirect: { name: "memberList" },
            children: [
                {
                    path: "memberRegist",
                    name: "memberRegist",
                    component: memberRegister,
                },
                {
                    path: "memberLogin",
                    name: "memberLogin",
                    component: MemberLogin,
                },
                {
                    path: "/admin/memberList",
                    name: "memberList",
                    beforeEnter: onlyAuthUser,
                    component: memberList,
                },
                {
                    path: "memberDetail",
                    name: "memberDetail",
                    beforeEnter: onlyAuthUser,
                    component: memberDetail,
                },
                {
                    path: "memberUpdate",
                    name: "memberUpdate",
                    beforeEnter: onlyAuthUser,
                    component: memberUpdate,
                },
                {
                    path: "memberMyPage",
                    name: "memberMyPage",
                    beforeEnter: onlyAuthUser,
                    component: MemberMyPage,
                },
            ],
        },
    ],
});

export default router;
